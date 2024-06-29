local v1 = {}
v1.XPTable = {}
local function GetTotalXP_1(p1)
    return 1000 + 225 * p1 * p1 - 225 * p1 * 0.5 * p1 - 1 - 1000 - 225
end
(function(p2)
    local v20 = 0
    local v21 = 1
    for v21 = v21, 100, 1 do
        local v24 = v21 - 1
        local v51 = 225
        local v52 = 0.5
        local v53 = v21 - 1
        local v54 = v52 * v53
        local v55 = v21 * v54
        v20 = v20 + 1000 + 225 * v21 * v21 - v51 * v55 - 1000 - 225 - 1000 + 225 * v24 * v24 - 225 * v24 * 0.5 * v24 - 1 - 1000 - 225
        local v61 = v1
        local v62 = v61.XPTable
        v62[v21] = v20
        if not p2 then
            v62 = print
            v61 = "Level: "
            v51 = v21
            v55 = " XP: "
            v54 = v21
            v53 = 1000 + 225 * v21 * v21 - 225 * v21 * 0.5 * v21 - 1
            v52 = v53 - 1000 - 225
            v62(v61, v51, v55, v54, v52)
        end
    end
end)()
local function v69(p3)
    p3 = p3 or 0
    local v70 = 1237500
    if p3 >= v70 then
        v70 = 100
        return v70, v1.XPTable[100]
    end
    v71 = v1
    local v76, v77, v72 = pairs(v71.XPTable)
    for v71, v81 in v76, v77, v72 do
        local v79 = v1.XPTable
        local v82 = v71 + 1
        local v80 = v79[v82]
        if p3 >= v81 then
            if v80 > p3 then
                v79 = v71
                v82 = v80
                return v79, v82
            end
        end
    end
    v76 = 1
    v71 = v1
    v72 = v71.XPTable
    v77 = v72[2]
    return v76, v77
end
v1.GetLevel = v69
v69 = function(p4)
    p4 = p4 or 1
    local v83 = p4
    return 1000 + 225 * v83 * v83 - 225 * v83 * 0.5 * v83 - 1 - 1000 - 225
end
v1.GetXP = v69
v69 = function(p5)
    local v100, v101 = v1.GetLevel(p5)
    local v104 = v1.GetXP(v100)
    return p5 - v104 / v101 - v104
end
v1.GetProgressToNextLevel = v69
return v1
