local v1 = 2
local v2 = -v1
local v3 = 3
local v7 = game.Players.LocalPlayer.userId
v3 = 8
v7 = game.Players.LocalPlayer.userId
v3 = 500
v1 = 0.2
v7 = function(p1)
    local v11 = time() - v2
    local v31 = v1
    local v32 = v31 + 0
    if v11 >= v32 then
        v11 = v3
        v32 = 0
        if v11 > v32 then
            v11 = time
            v2 = v11()
            v32 = v3
            v3 = v32 - 1
            local v13 = game
            v31 = v13.ReplicatedStorage
            v32 = v31.TrapSystem
            local v14 = game
            local v15 = v14.Players
            local v16 = v15.LocalPlayer
            local v17 = v16.Character
            local v35 = v17.HumanoidRootPart
            v31 = v35.CFrame
            if not v32.PlaceTrap:InvokeServer(v31) then
                v32 = v3
                local v19 = 0
                if v32 > v19 then
                    v35 = 1
                    v32 = v1
                    v19 = 1
                    for v13 = v35, v32, v19 do
                        v17 = p1.Cooldown
                        v16 = Color3.new
                        v15 = 0.88627450980392
                        v14 = 0.15686274509804
                        v17.TextColor3 = v16(v15, v14, 0.17254901960784)
                        v17 = p1.Cooldown
                        v17.Text = v1 - v13 + 1
                        v17 = wait
                        v17(1)
                        p1.Cooldown.Text = v1 - v13 + 1
                    end
                    v32 = p1.Cooldown
                    v19 = Color3.fromRGB
                    v35 = 0
                    v24 = 255
                    v25 = 0
                    v32.TextColor3 = v19(v35, v24, v25)
                    v32 = p1.Cooldown
                    v32.Text = "(" .. v3 .. ")"
                    return 
                end
                v32 = false
                p1.Visible = v32
                return 
            end
            v27 = time
            v28 = v1
            v26 = v27() - v28
            v32 = v26 + 0.5
            v2 = v32
        end
    end
end
return v7
