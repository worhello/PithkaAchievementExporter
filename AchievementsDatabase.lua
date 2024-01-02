WorhelloAchievementExporter = WorhelloAchievementExporter or {}
WorhelloAchievementExporter.Achievements = WorhelloAchievementExporter.Achievements or {}

-- This should be incremented as new achievement codes are added below 
WorhelloAchievementExporter.Achievements.Version = 1

-- The initial implementation here was heavily based on Pithka's PITHKA.Data.Achievements.DB in Achievements.lua
-- Now this will diverge as additional extra achievements will be added
WorhelloAchievementExporter.Achievements.DB = {
    -- Trials
    --                  VET   PHM1   PHM2   HM    TRI    EXT
    {ABBV="HRC", CODES={1474, "NIL", "NIL", 1136, "NIL", "NIL"}, TYPE="trial"},
    {ABBV="AA",  CODES={1503, "NIL", "NIL", 1137, "NIL", "NIL"}, TYPE="trial"},
    {ABBV="SO",  CODES={1462, "NIL", "NIL", 1138, "NIL", "NIL"}, TYPE="trial"},
    {ABBV="MOL", CODES={1368, "NIL", "NIL", 1344, "NIL", 1391},  TYPE="trial"},
    {ABBV="HOF", CODES={1810, "NIL", "NIL", 1829, 1838,  1836},  TYPE="trial"},
    {ABBV="AS",  CODES={2077, 2085,  2086,  2079, 2087,  2075},  TYPE="trial"},
    {ABBV="CR",  CODES={2133, 2134,  2135,  2136, 2139,  2140},  TYPE="trial"},
    {ABBV="SS",  CODES={2435, 2469,  2470,  2466, 2467,  2468},  TYPE="trial"},
    {ABBV="KA",  CODES={2734, 2736,  2737,  2739, 2740,  2746},  TYPE="trial"},
    {ABBV="RG",  CODES={2987, 3005,  3006,  3007, 3003,  3004},  TYPE="trial"},
    {ABBV="DSR", CODES={3244, 3250,  3251,  3252, 3248,  3249},  TYPE="trial"},
    {ABBV="SE",  CODES={3560, 3566,  3567,  3568, 3564,  3565},  TYPE="trial"},

    -- Arenas   
    {ABBV="DSA",  CODES={1140, "NIL", "NIL"}, TYPE="arena"},    
    {ABBV="BRP",  CODES={2363, 2368,  2372 }, TYPE="arena"},
    {ABBV="MSA",  CODES={1305, "NIL", "NIL"}, TYPE="arena"},
    {ABBV="VSA",  CODES={2908, 2912,  2913 }, TYPE="arena"},    

    -- DLC Dungeons
    --                  Vet   HM    SR    ND    CHA    TRI    EXT...
    {ABBV="WGT", CODES={1120, 1279, 1275, 1276, "NIL", "NIL", 1306}, TYPE="dungeon"},
    {ABBV="ICP", CODES={880,  1303, 1128, 1129, 1132,  "NIL", 1133}, TYPE="dungeon"},
    {ABBV="ROM", CODES={1505, 1506, 1507, 1508, 1511,  "NIL", 1516}, TYPE="dungeon"},
    {ABBV="COS", CODES={1523, 1524, 1525, 1526, 1529,  "NIL", 1534}, TYPE="dungeon"},
    {ABBV="FH",  CODES={1699, 1704, 1702, 1703, 1942,  "NIL", 1948}, TYPE="dungeon"},
    {ABBV="BF",  CODES={1691, 1696, 1694, 1695, 1941,  "NIL", 1819}, TYPE="dungeon"},
    {ABBV="FL",  CODES={1960, 1965, 1963, 1964, 1966,  2102,  1967}, TYPE="dungeon"},
    {ABBV="SP",  CODES={1976, 1981, 1979, 1980, 1982,  1983,  1991}, TYPE="dungeon"},
    {ABBV="MHK", CODES={2153, 2154, 2155, 2156, 2158,  2159,  2301}, TYPE="dungeon"},
    {ABBV="MOS", CODES={2163, 2164, 2165, 2166, 2167,  2168,  2305}, TYPE="dungeon"},
    {ABBV="FV",  CODES={2261, 2262, 2263, 2264, 2266,  2267,  2384}, TYPE="dungeon"},
    {ABBV="DOM", CODES={2271, 2272, 2273, 2274, 2275,  2276,  2395}, TYPE="dungeon"},
    {ABBV="LOM", CODES={2426, 2427, 2428, 2429, 2430,  2431,  2581}, TYPE="dungeon"},
    {ABBV="MF",  CODES={2416, 2417, 2418, 2419, 2421,  2422,  2575}, TYPE="dungeon"},
    {ABBV="IR",  CODES={2540, 2541, 2542, 2543, 2545,  2546,  2677}, TYPE="dungeon"},
    {ABBV="UG",  CODES={2550, 2551, 2552, 2553, 2554,  2555,  2679}, TYPE="dungeon"},
    {ABBV="SG",  CODES={2695, 2755, 2697, 2698, 2700,  2701,  2824}, TYPE="dungeon"},
    {ABBV="CT",  CODES={2705, 2706, 2707, 2708, 2709,  2710,  2828}, TYPE="dungeon"},
    {ABBV="BDV", CODES={2832, 2833, 2834, 2835, 2837,  2838,  2883}, TYPE="dungeon"},
    {ABBV="TC",  CODES={2842, 2843, 2844, 2845, 2846,  2847,  2886}, TYPE="dungeon"},
    {ABBV="RPB", CODES={3017, 3018, 3019, 3020, 3022,  3023,  3035}, TYPE="dungeon"},
    {ABBV="DC",  CODES={3027, 3028, 3029, 3030, 3031,  3032,  3042}, TYPE="dungeon"},    
    {ABBV="CA",  CODES={3105, 3153, 3107, 3108, 3110,  3111,  3226}, TYPE="dungeon"},
    {ABBV="SR",  CODES={3115, 3154, 3117, 3118, 3119,  3120,  3224}, TYPE="dungeon"},
    {ABBV="ER",  CODES={3376, 3377, 3378, 3379, 3380,  3381,  3391}, TYPE="dungeon"},
    {ABBV="GD",  CODES={3395, 3396, 3397, 3398, 3399,  3400,  3410}, TYPE="dungeon"},
    {ABBV="BS",  CODES={3469, 3470, 3471, 3472, 3473,  3474,  3484}, TYPE="dungeon"},
    {ABBV="SH",  CODES={3530, 3531, 3532, 3533, 3534,  3535,  3538}, TYPE="dungeon"},
    {ABBV="BRP", CODES={2363, 2364, 2366, 2365, "NIL", 2368,  2372}, TYPE="dungeon"},

    -- Base Game Dungeons
    --                   VET   HM    SR    ND
    {ABBV="FG1",  CODES={1556, 1561, 1559, 1560},  TYPE='baseDungeon'},
    {ABBV="FG2",  CODES={343,  342,  340,  1563},  TYPE='baseDungeon'},
    {ABBV="BC1",  CODES={1549, 1554, 1552, 1553},  TYPE='baseDungeon'},
    {ABBV="BC2",  CODES={545,  451,  449,  1564},  TYPE='baseDungeon'},
    {ABBV="EH1",  CODES={1573, 1578, 1576, 1577},  TYPE='baseDungeon'},
    {ABBV="EH2",  CODES={459,  463,  461,  1580},  TYPE='baseDungeon'},
    {ABBV="COA1", CODES={1597, 1602, 1600, 1601},  TYPE='baseDungeon'},
    {ABBV="COA2", CODES={878,  1114, 1108, 1107},  TYPE='baseDungeon'},
    {ABBV="COH1", CODES={1610, 1615, 1613, 1614},  TYPE='baseDungeon'},
    {ABBV="COH2", CODES={876,  1084, 941,  942 },  TYPE='baseDungeon'},
    {ABBV="DC1",  CODES={1581, 1586, 1584, 1585},  TYPE='baseDungeon'},
    {ABBV="DC2",  CODES={464,  467,  465,  1588},  TYPE='baseDungeon'},
    {ABBV="SC1",  CODES={1565, 1570, 1568, 1569},  TYPE='baseDungeon'},
    {ABBV="SC2",  CODES={421,  448,  446,  1572},  TYPE='baseDungeon'},
    {ABBV="WS1",  CODES={1589, 1594, 1592, 1593},  TYPE='baseDungeon'},
    {ABBV="WS2",  CODES={678,  681,  679,  1596},  TYPE='baseDungeon'},
    {ABBV="AC",   CODES={1604, 1609, 1607, 1608},  TYPE='baseDungeon'},
    {ABBV="BH",   CODES={1647, 1652, 1650, 1651},  TYPE='baseDungeon'},
    {ABBV="BC",   CODES={1641, 1646, 1644, 1645},  TYPE='baseDungeon'},
    {ABBV="DK",   CODES={1623, 1628, 1626, 1627},  TYPE='baseDungeon'},
    {ABBV="SW",   CODES={1635, 1640, 1638, 1639},  TYPE='baseDungeon'},
    {ABBV="TI",   CODES={1617, 1622, 1620, 1621},  TYPE='baseDungeon'},
    {ABBV="VOM",  CODES={1653, 1658, 1656, 1657},  TYPE='baseDungeon'},
    {ABBV="VOL",  CODES={1629, 1634, 1632, 1633},  TYPE='baseDungeon'}
}

WorhelloAchievementExporter.Achievements.DBFilter = function(query)
    local output = {}    
    for _, row in ipairs(WorhelloAchievementExporter.Achievements.DB) do 
        local test = true
        for key, value in pairs(query) do
            test = test and row[key] == value
        end
        if test then 
            table.insert(output, row) 
        end
    end

    return output
end