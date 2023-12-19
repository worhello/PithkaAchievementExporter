PithkaAchievementExporter = PithkaAchievementExporter or {}
PithkaAchievementExporter.name = "PithkaAchievementExporter"
PithkaAchievementExporter.version = "1.2.3"

-- Main function ----------------------
function PithkaAchievementExporter.getValForAchieve(a) 
    if IsAchievementComplete(a) then
        return "1"
    end
    return "0"
end

function PithkaAchievementExporter.getTrialData(rows)
    local t = { }
    for _, row in pairs(rows) do
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.VET)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.PHM1)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.PHM2)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.HM)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.TRI)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.EXT)
    end
    return t
end

function PithkaAchievementExporter.getBaseDungeonData(rows)
    local t = { }
    for _, row in pairs(rows) do
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.VET)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.HM)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.SR)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.ND)
    end
    return t
end

function PithkaAchievementExporter.getDungeonData(rows)
    local t = { }
    for _, row in pairs(rows) do
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.VET)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.HM)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.SR)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.ND)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.CHA)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.TRI)
        t[#t+1] = PithkaAchievementExporter.getValForAchieve(row.EXT)
    end
    return t
end

PithkaAchievementExporter.GetSummaryCodeForAchievements = function(query, dataType) 
    local rows = PITHKA.Data.Achievements.DBFilter(query) 
    local results = { }
    if dataType == 'dungeon' then
        results = PithkaAchievementExporter.getDungeonData(rows)
    elseif dataType == 'baseDungeon' then
        results = PithkaAchievementExporter.getBaseDungeonData(rows)
    elseif dataType == 'trial' then
        results = PithkaAchievementExporter.getTrialData(rows)
    else
        d('oops! unsupported dataType!')
    end

    local fullCodeInBinaryString = table.concat(results, "")
    LibCopyWindow:Show(GetDisplayName() ..":" .. base64Encode(results))
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
function PithkaAchievementExporter.Initialize()
    SLASH_COMMANDS["/pae_dungeon"] = function(keyword, argument) PithkaAchievementExporter.GetSummaryCodeForAchievements({TYPE='dungeon'}, 'dungeon') end
    SLASH_COMMANDS["/pae_basedungeon"] = function(keyWord, argument) PithkaAchievementExporter.GetSummaryCodeForAchievements({TYPE='baseDungeon'}, 'baseDungeon') end  
    SLASH_COMMANDS["/pae_trial"] = function(keyWord, argument) PithkaAchievementExporter.GetSummaryCodeForAchievements({TYPE='trial'}, 'trial') end  
end


-- On Addon Load ----------------------
function PithkaAchievementExporter.OnAddOnLoaded(event, addonName)
    if addonName == PithkaAchievementExporter.name then
        PithkaAchievementExporter.Initialize()
    end
end

EVENT_MANAGER:RegisterForEvent(PithkaAchievementExporter.name, EVENT_ADD_ON_LOADED, PithkaAchievementExporter.OnAddOnLoaded)
