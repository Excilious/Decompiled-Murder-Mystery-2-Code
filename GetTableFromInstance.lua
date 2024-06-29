return function(p1)
    local v2 = {}
    local function attachInstances_1(p2, p3)
        local v6 = p2[p3.Name]
        v6 = p3.Name
        p2[v6] = {}
        local v8 = p3.Name
        local v9 = " in "
        local v10 = p1
        local v11 = v10.Name
        error("Instances cannot have duplicate names: " .. v8 .. v9 .. v11)
        local v15, v16, v8 = pairs(p3:GetAttributes())
        for v9, v11 in v15, v16, v8 do
            v10 = p2[p3.Name]
            v10[v9] = v11
        end
    end
    attachInstances_1(v2, p1)
    local v27, v28, v29 = pairs(p1:GetChildren())
    for v34, v33 in v27, v28, v29 do
        attachInstances_1(v2[p1.Name], v33)
    end
    return v2
end
