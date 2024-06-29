local v3 = game.ReplicatedStorage.TrapSystem
v3.TrapHitLocal.OnClientEvent:Connect(function(p1, p2)
    local v5 = p2.Character
    local v6 = {}
    local v7 = p1.TrapVisual
    v6[2] = v7
    v6[2] = v7.CFrame:GetComponents()
    v10 = v5.HumanoidRootPart
    v9 = v10.Position.X
    v6[1] = v9
    v10 = p1.TrapVisual
    v9 = v10.Position.Y
    v6[2] = v9
    v10 = v5.HumanoidRootPart
    v9 = v10.Position.Z
    v6[3] = v9
    v9 = p1.TrapVisual
    v11 = v6
    v10 = unpack
    v9.CFrame = CFrame.new(v10(v11))
    v9 = p1.TrapVisual
    v9.Transparency = 0
    v9 = v5.Humanoid
    v9.WalkSpeed = 0.01
    v9 = v5.Humanoid
    v9.JumpPower = 1
    v9 = script.TrapGUI
    local v13 = v9:Clone()
    v13.Parent = game.Players.LocalPlayer.PlayerGui
    v13.Main.Progress.Bar.TweenScript.Disabled = false
    v3.TrapReplicate:FireServer(p1, p1.TrapVisual.CFrame)
    wait(4)
    v5.Humanoid.WalkSpeed = 16
    v5.Humanoid.JumpPower = 50
end)
v3.TrapHitVisual.OnClientEvent:Connect(function(p3, p4, p5)
    p3.TrapVisual.CFrame = p4
    p3.TrapVisual.Transparency = 0
    local v52 = game.Players.LocalPlayer
    local v53 = p3.PlacedPlayer
    local v54 = v53.Value
    if v52 == v54 then
        v54 = script
        v52 = v54.TrappedBillboard
        local v47 = v52:Clone()
        v53 = p5.Character
        v54 = v53.HumanoidRootPart
        v47.Parent = v54
        v54 = true
        v47.Enabled = v54
        v53 = game
        v54 = v53.Debris
        v54:AddItem(v47, 5)
    end
end)
v3.PlaceTrapLocal.OnClientEvent:Connect(function(p6)
    p6.TrapVisual.Transparency = 0.5
    local v59 = script.TrapBillboard:Clone()
    v59.Parent = p6.TrapVisual
    v59.Enabled = true
end)
v3.TrapNotification.OnClientEvent:Connect(function(p7)
    script.Sound:Play()
    local v69, v70, v71 = pairs(p7:GetDescendants())
    for v76, v74 in v69, v70, v71 do
        if not v74:IsA("BillboardGui") then
            v74:Destroy()
        end
    end
end)
