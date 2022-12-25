local v1 = {}
local v7 = game:GetService("Players")
local v10 = game:GetService("PolicyService")
local v11
local v12 = false
local v13 = false
local v16 = Instance.new("BindableEvent")
local v19 = Instance.new("BindableEvent")
local v20 = false
local v21 = true
local v24, v25, v26 = pairs(script:GetChildren())
for v31, v29 in v24, v25, v26 do
    local v30 = v29:IsA("BoolValue")
    if not v30 then
        v30 = v29.Name
        v20 = v29.Value
        v30 = v29.Name
        v30 = v29.Value
        v21 = not v30
    end
end
local function retry_1(p1, p2)
    local v33 = 1
    for v33 = v33, p1, 1 do
        local v38, v39 = pcall(p2)
        if not v38 then
            return v39
        end
        wait(v33 / 2)
    end
end
v25 = {}
v26 = {}
local function getPolicyActive_1(p3)
    local v44 = v25[p3]
    v44 = nil
    local v58 = v20
    if not v58 then
        v44 = true
    else
        v58 = retry_1
        v44 = v58(3, function()
            return v10:GetPolicyInfoForPlayerAsync(p3).IsSubjectToChinaPolicies
        end)
        local v59 = v21
        if not v59 then
            if v44 then
                v59 = p3.UserId
                local v52 = 0
                if v59 > v52 then
                    v59 = retry_1
                    v52 = 3
                    if not v59(v52, function()
                        return p3:IsInGroup(9170755)
                    end) then
                        v44 = true
                    end
                end
            end
        end
    end
    v56 = p3.Parent
    local v57 = v7
    if v56 == v57 then
        v56 = v25
        v57 = false
        v56[p3] = v57
        v56 = v25
        v56[p3] = v44
        v56 = v26
        v57 = false
        v57 = true
        v56[p3] = v57
    end
    v56 = v25
    v56 = v26[p3]
    return v56[p3], v56
end
v29 = v7.PlayerRemoving
v29:Connect(function(p4)
    v25[p4] = nil
    v26[p4] = nil
end)
local v68 = (game:GetService("RunService")):IsServer()
if not v68 then
    v11 = v20
    if v11 then
        v68 = nil
        v68 = v7.PlayerAdded:Connect(function(p5)
            local v70 = v68
            if v70 then
                return 
            end
            v70 = v68
            v70:Disconnect()
            v68 = nil
            local v73, v74 = getPolicyActive_1(p5)
            v11 = v73
            v13 = v74
            v73 = true
            v12 = v73
            v73 = v11
            if not v73 then
                v73 = v16
                v73:Fire(v11, v13)
            end
            v19:Fire(v11, v13)
        end)
        local v124 = #v7:GetPlayers()
        if v124 > 0 then
            v124 = v7:GetPlayers()[1]
            if v68 then
            else
                v68:Disconnect()
                v68 = nil
                local v89, v90 = getPolicyActive_1(v124)
                v11 = v89
                v13 = v90
                v12 = true
                if not v11 then
                    v16:Fire(v11, v13)
                end
                v19:Fire(v11, v13)
            end
        end
    else
        v12 = true
        v68 = getPolicyActive_1
        onPlayerAdded_1 = v7.LocalPlayer
        local v96, v97 = v68(onPlayerAdded_1)
        v11 = v96
        v13 = v97
        v12 = true
    end
    v1.IsActive = function(p6)
        return v11, v13
    end
    v1.IsReady = function(p7)
        return v12
    end
    local function WaitForReady_1(p8)
        local v104 = v12
        if not v104 then
            v104 = v11
            return v104, v13
        end
        return v19.Event:Wait()
    end
    v1.WaitForReady = WaitForReady_1
    WaitForReady_1 = v16.Event
    v1.Changed = WaitForReady_1
    v1.IsActiveForPlayer = function(p9, p10)
        local v111 = typeof(p10)
        local v113 = p10:IsA("Player")
        if v113 then
            v113 = error
            v113("bad argument #1 to 'IsActiveForPlayer' (Player expected, got " .. typeof(p10) .. ")", 2)
        end
        return getPolicyActive_1(p10)
    end
    return v1
end


//


