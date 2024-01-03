WorhelloAchievementExporter = WorhelloAchievementExporter or {}
WorhelloAchievementExporter.name = "WorhelloAchievementExporter"
WorhelloAchievementExporter.version = "2.2.0"
WorhelloAchievementExporter.Achievements = WorhelloAchievementExporter.Achievements or {}

-- Main function ----------------------
function WorhelloAchievementExporter.getValForAchieve(a) 
    if IsAchievementComplete(a) then
        return "1"
    end
    return "0"
end

function WorhelloAchievementExporter.parseAllRows(data)
    local t = { }
    for _, row in pairs(data) do
        for _1, achieveCode in pairs(row.CODES) do
            if (achieveCode == "NIL") then
                t[#t+1] = "0"
            else
                t[#t+1] = WorhelloAchievementExporter.getValForAchieve(achieveCode)
            end
        end
    end
    return t
end

WorhelloAchievementExporter.GetSummaryCodeForAchievements = function(query)
    local data = WorhelloAchievementExporter.Achievements.DBFilter(query)
    local results = WorhelloAchievementExporter.parseAllRows(data)

    local fullCodeInBinaryString = table.concat(results, "")
    -- LibCopyWindow:Show(GetDisplayName() ..":" .. fullCodeInBinaryString)
    LibCopyWindow:Show(GetDisplayName() .. ":" .. WorhelloAchievementExporter.Achievements.Version .. ":" .. base64Encode(results))
end

function base64Encode(dataAsTable)
    local base64Lexicon='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+_'
    local paddingNeeded = 6 - (#dataAsTable % 6)
    if paddingNeeded > 0 and paddingNeeded < 6 then
        for i = 1, paddingNeeded, 1 do
            dataAsTable[#dataAsTable+1] = 0
        end
    end

    local result = { }
    local curr = 0
    local numCharsAdded = 0
    for dataPtr = 1, #dataAsTable, 1 do
        local currPtrRemainder = dataPtr % 6
        if currPtrRemainder == 0 then
            currPtrRemainder = 6
        end
        if dataAsTable[dataPtr] == "1" then
            local currPowerOfTwo = 6 - currPtrRemainder
            curr = curr + math.pow(2, currPowerOfTwo)
        end

        if dataPtr % 6 == 0 then
            result[#result + 1] = string.sub(base64Lexicon, curr + 1, curr + 1)
            curr = 0
        end
    end
    return table.concat(result)
end

-- Initialize -------------------------
function WorhelloAchievementExporter.Initialize()
    SLASH_COMMANDS["/wae_dungeon"] = function(keyword, argument) WorhelloAchievementExporter.GetSummaryCodeForAchievements({TYPE='dungeon'}) end
    SLASH_COMMANDS["/wae_basedungeon"] = function(keyword, argument) WorhelloAchievementExporter.GetSummaryCodeForAchievements({TYPE='baseDungeon'}) end
    SLASH_COMMANDS["/wae_trial"] = function(keyword, argument) WorhelloAchievementExporter.GetSummaryCodeForAchievements({TYPE='trial'}) end
end


-- On Addon Load ----------------------
function WorhelloAchievementExporter.OnAddOnLoaded(event, addonName)
    if addonName == WorhelloAchievementExporter.name then
        WorhelloAchievementExporter.Initialize()
    end
end

EVENT_MANAGER:RegisterForEvent(WorhelloAchievementExporter.name, EVENT_ADD_ON_LOADED, WorhelloAchievementExporter.OnAddOnLoaded)
