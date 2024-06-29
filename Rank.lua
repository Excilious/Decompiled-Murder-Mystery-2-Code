local v3 = game.Players.LocalPlayer
local v9 = ((v3.PlayerGui:WaitForChild("CustomGames")):WaitForChild("Mode1v1-Auto")):WaitForChild("Main")
local v10 = v9.QueueFrame.Queue
v3 = v10.Container
v10 = false
local v12 = game.ReplicatedStorage
local v15 = v12.Remotes.CustomGames.Get1v1Queue:InvokeServer()
v12 = game.ReplicatedStorage.Modules
local v17 = require(v12.EloRankInfo)
local v18 = v17.RankIcons
v12 = v17.RankOrder
local function UpdateQueue_1(p1)
    local v20 = p1
    if v20 then
        v20 = v15
        if v20 then
            v20 = {}
        end
    end
    v15 = v20
    v3:ClearAllChildren()
    script.UIListLayout:Clone().Parent = v3
    local v24, v25, v26 = pairs(v15)
    for v34, v28 in v24, v25, v26 do
        local v27 = v28.Player
        v27 = script.QueuePlayer
        local v30 = v27:Clone()
        v30.PlayerName.Text = v28.Player.Name
        v30.RankIcon.Icon.Image = v18[v28.Rank]
        v30.LayoutOrder = v34
        v30.Parent = v3
    end
    v24 = true
    v26 = v12
    v30 = _G
    v28 = v30.PlayerData
    v34 = v28.TestRank
    v25 = v26[v34]
    v26 = 4
    if v26 < v25 then
        v28 = game
        v34 = v28.Players
        v26 = v34.LocalPlayer
        v25 = v26.userId
        v24 = false
        v24 = true
    end
    v34 = v9
    v26 = v34.QueueFrame
    v25 = v26.Gold
    v26 = v24
    if not v26 then
        v28 = game
        v34 = v28.PlaceId
        v26 = false
        v26 = true
    end
    v25.Visible = v26
end
game.ReplicatedStorage.Remotes.CustomGames.Update1v1Queue.OnClientEvent:Connect(UpdateQueue_1)
game.ReplicatedStorage.Remotes.CustomGames.Started1v1.OnClientEvent:Connect(function()
    local v52 = false
    local v55, v56, v57 = pairs(v15)
    for v64, v59 in v55, v56, v57 do
        local v58 = v59.Player
        v58 = v59.Player.Name
        if v58 == game.Players.LocalPlayer.Name then
            v52 = true
        end
    end
    if v52 then
        v55 = false
        v10 = v55
        v57 = v9
        v56 = v57.QueueFrame
        v55 = v56.Leave
        v56 = false
        v55.Visible = v56
        v57 = v9
        v56 = v57.QueueFrame
        v55 = v56.Join
        v56 = true
        v55.Visible = v56
    end
end)
v9.QueueFrame.Join.MouseButton1Click:connect(function()
    v10 = true
    v9.QueueFrame.Join.Visible = false
    v9.QueueFrame.Leave.Visible = true
    game.ReplicatedStorage.Remotes.CustomGames.Join1v1Queue:FireServer()
end)
v9.QueueFrame.Leave.MouseButton1Click:connect(function()
    v10 = false
    v9.QueueFrame.Leave.Visible = false
    v9.QueueFrame.Join.Visible = true
    game.ReplicatedStorage.Remotes.CustomGames.Leave1v1Queue:FireServer()
end)
game.ReplicatedStorage.Remotes.CustomGames.Display1v1Queue.OnClientEvent:Connect(function()
    v9.Parent.Visible = true
end)
game.ReplicatedStorage.Remotes.CustomGames.Hide1v1Queue.OnClientEvent:Connect(function()
end)
v9.QueueFrame.Gold.MouseButton1Click:connect(function()
    game.ReplicatedStorage.Remotes.CustomGames.JoinGoldServer:FireServer()
    v9.Visible = false
end)
UpdateQueue_1()
