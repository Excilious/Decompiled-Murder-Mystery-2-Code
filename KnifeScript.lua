game.Workspace.ChildAdded:connect(function(p1)
    local v4 = p1.Name
    v4 = p1:WaitForChild("HandleLink").Value
    local v8 = v4:Clone()
    local v11 = p1:WaitForChild("BladePosition")
    v8.CFrame = v11.CFrame
    local v13 = v8:FindFirstChild("VH")
    if not v13 then
        v13 = 1
        v8.Transparency = v13
        v13 = v8.VH
        v11 = 0
        v13.Transparency = v11
    else
        v13 = 0
        v8.Transparency = v13
    end
    v8.Anchored = true
    v8.Parent = p1
    v8.Name = "KnifeVisual"
end)
local v18 = time()
(game:GetService("RunService")):BindToRenderStep("ThrowingKnifeVisualizer", Enum.RenderPriority.Last.Value, function(p2)
    local v25 = game
    local v27, v28, v25 = pairs(v25.Workspace:GetChildren())
    for v82, v30 in v27, v28, v25 do
        local v29 = v30.Name
        local v32 = v30:FindFirstChild("KnifeVisual")
        if not v32 then
            v32 = v30.BladePosition
            local v87 = CFrame.new(v30.KnifeVisual.Position, v30.BladePosition.Position).lookVector
            local v90 = v30.KnifeVisual.Position - v30.BladePosition.Position.magnitude
            local v47 = v30.Vector3Value
            local v95 = p2 / 0.016666666666667
            local v97 = v30.KnifeVisual.CFrame.p + v47.Value * 1.6 * v95
            local v49, v42, v45, v48, v47, v50, v51, v52, v53, v54, v55, v56 = (v30.KnifeVisual.CFrame * CFrame.Angles(-12.566370614359 * p2, 0, 0)):components()
            local v73 = CFrame.new(v97.X, v97.Y, v97.Z, v95, v47, v50, v51, v52, v53, v54, v55, v56)
            v30.KnifeVisual.CFrame = v73
            local v76 = v30.KnifeVisual:FindFirstChild("VH")
            if not v76 then
                v76.CFrame = v73 * v76:FindFirstChild("ManualWeld").C0
                print("cut")
            end
        end
    end
end)
