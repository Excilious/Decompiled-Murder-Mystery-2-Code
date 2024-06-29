while true do
    wait()
    local v3 = _G.PlayerData
end
v3 = wait
v2 = 0.2
v3(v2)
local v7 = require(script.Weld)
local v10 = game:GetService("TweenService")
local v17 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local v18
local v25 = (require(game.ReplicatedFirst:WaitForChild("ChinaPolicyService"))):IsActive()
game:GetService("RunService").Heartbeat:connect(function(p1)
    v18 = nil
    local v31 = game
    local v33, v34, v31 = pairs(v31.Workspace:GetChildren())
    for v39, v37 in v33, v34, v31 do
        local v38 = v37:FindFirstChild("CoinContainer")
        if not v38 then
            v38 = v37.CoinContainer
            v18 = v38
        end
    end
    v33 = v18
    return 
    v34 = v18
    v33 = v34.Parent
    v33 = nil
    v18 = v33
    return 
    v33 = pairs
    v34 = v18
    local v40, v41, v31 = v33(v34:GetChildren())
    for v39, v37 in v40, v41, v31 do
        local v43 = v37:FindFirstChild("Coin")
        local v44 = v37.Name
        local v46 = v37:FindFirstChild("BagFull")
        v46 = _G.CoinBagFull
        v46 = nil
        v46 = game.ReplicatedStorage.SnowTokenObjects.SnowToken:Clone()
        v46.Name = "Coin"
        v7(v37)
        v46.CFrame = v37.CFrame
        v46.Parent = v37
        local v114 = v37.Name
        local v54 = v37:FindFirstChild("BagFull")
        local v56 = v37:FindFirstChild("SpinningVisual")
        local v57 = v37:FindFirstChild("SpinComplete")
        local v59 = v37:FindFirstChild("BagFull")
        local v60
        local v61 = game
        v60 = v61.ReplicatedStorage.SnowTokenObjects.SpinningVisual:Clone()
        v60.Name = "SpinningVisual"
        v7(v37)
        v60.CFrame = v37.CFrame
        v60.Parent = v37
        spawn(function()
            local v70, v71, v72 = pairs(v60:GetDescendants())
            for v87, v75 in v70, v71, v72 do
                local v76 = v75:IsA("BasePart")
                if not v75:IsA("Decal") then
                    local v80 = v75:IsA("MeshPart")
                    if not v80 then
                        v80 = ""
                        v75.TextureID = v80
                    end
                    local v83 = {}
                    v83.Transparency = 1
                    (v10:Create(v75, v17, v83)):Play()
                end
            end
            v70 = wait
            if v76 then
                v71 = 0.2
                v70(v71)
                local v90 = Instance.new("Model")
                v90.Name = "SpinComplete"
                v90.Parent = v37
                return 
            end
        end)
        local v95 = v37:FindFirstChild("RoundEnd")
        local v97 = v37:FindFirstChild("BagFull")
        if not v97 then
            v60 = 0
        else
            v60 = 0.2
        end
        if v59 then
            v61 = Vector3.new
            v97 = v56.CFrame + v61(0, v60, 0) * CFrame.Angles(0.5235987755983, 0, 0)
            v56.CFrame = v97
        end
        if not v43 then
            v43:Destroy()
            if not v43 then
                v57 = v43.CFrame
                v59 = CFrame.Angles
                v97 = 1.9198621771938
                v97 = 0
                v103 = 0
                v56 = v57 * v59(v97 * p1, v97, v103)
                v43.CFrame = v56
            end
        end
    end
    return 
    if v95 then
    end
    if v43 then
        if not v56 then
        end
        if not v43 then
        end
        if v46 then
            if v57 then
            end
            if v56 then
            end
            if v46 then
                if not v54 then
                end
            end
        end
    end
end)
