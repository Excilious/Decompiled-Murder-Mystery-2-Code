local v4 = script.Parent.Parent.Game
local v5 = require(script.getTableFromInstance)
local v8 = v5(game.Players)
local v9 = v8.Players
v8 = {}
local v14 = require(game.ReplicatedStorage.Modules.ViewProfileModule)
local v15 = script
local v16 = v15.Parent.Parent.Game.ViewProfile
v15 = v16.Main
v14.GUI.ProfileContainer = v15.Profile.Container
v15 = v16.Main.Weapons.Items.Tabs.Search
v14.GUI.SearchFrameTextBox = v15.Container.SearchText
v15 = game.ReplicatedStorage
local v21 = require(v15.Modules.TradeModule)
v15 = game.ReplicatedStorage.Modules
local v23 = require(v15.LevelModule)
local v24 = _G
local v458 = _G.LeaderboardOpen
v15 = true
v15 = _G.LeaderboardOpen
v24.LeaderboardOpen = v15
v24 = {}
v15 = 0
v24[v15] = ""
v15 = "I"
v24[1] = v15
v15 = "II"
v24[2] = v15
v15 = "III"
v24[3] = v15
v15 = "IV"
v24[4] = v15
v15 = "V"
v24[5] = v15
v15 = "VI"
v24[6] = v15
v15 = "VII"
v24[7] = v15
v15 = "VIII"
v24[8] = v15
v15 = "IX"
v24[9] = v15
v15 = "X"
v24[10] = v15
v15 = {}
v15[true] = "^"
v15[false] = "v"
local v25 = require(game.ReplicatedStorage.RankIconsEmpty)
local v27 = game.ReplicatedStorage.GetSyncData:InvokeServer("NameTags")
local v31 = Color3.fromRGB(232, 42, 42)
local v34 = script.Parent.Parent
local v35 = v34.Game
local v36 = v35.Leaderboard
v35 = nil
v34 = v36.Inspect
local function UpdateLeaderboard_1()
    local v38 = {}
    local v41, v42, v43 = pairs(v9)
    for v47, v51 in v41, v42, v43 do
        local v44 = game
        local v48 = v44.Players:FindFirstChild(v47)
        if not v48 then
            local v49 = {}
            v49.PlayerName = v47
            v49.Level = v51.Level or 1
            v49.Elite = v51.Elite
            v49.Prestige = v51.Prestige or 0
            v49.XP = v51.XP or 0
            v44 = v38
            v48 = table.insert
            v48(v44, v49)
        end
    end
    v41 = table.sort
    v42 = v38
    v43 = function(p1, p2)
        local v61 = p2.Prestige or 0 * 100
        if v61 + p2.Level or 1 <= p1.Prestige or 0 * 100 + p1.Level or 1 then
            v61 = false
        end
        return true
    end
    v41(v42, v43)
    local v68, v69, v70 = pairs(v38)
    for v47, v51 in v68, v69, v70 do
        local v71 = v51.PlayerName
        local v122 = v8[v71].Parent
        v52 = script
        local v74 = v52.Player_Frame:Clone()
        v52 = v74.PlayerLabel
        local v75 = v51.Elite
        local v76 = "[ELITE] "
        v76 = ""
        local v77 = v71
        v50 = v76 .. v77
        v52.Text = v50
        v52 = v74.PlayerLabel
        local v124 = v51.Elite
        v50 = v31
        if v50 then
            v50 = Color3.new
            v124 = 1
            v77 = 1
            v75 = 1
            local v78 = v50(v124, v77, v75)
        end
        v52.TextColor3 = v78
        v78 = v74.ActionButton
        v52 = v78.MouseButton1Click
        v52:connect(function()
            local v80 = v35
            local v81 = v71
            if v80 ~= v81 then
                local v82 = false
            end
            v82 = true
            v80 = v71
            v35 = v80
            v81 = v34
            v81.Username.Text = v71
            v34.Position = UDim2.new(v34.Position.X, UDim.new(0, v74.AbsolutePosition.Y - 3))
            local v101 = v34
            local v102 = v101.Trade
            local v91 = v35
            local v94 = game.Players.LocalPlayer.Name
            if v91 == v94 then
                v101 = Enum.ButtonStyle.RobloxRoundButton
                if v101 then
                    v101 = Enum.ButtonStyle.RobloxRoundDefaultButton
                end
                v102.Style = v101
                if not v82 then
                    v102 = v34
                    v94 = v34
                    v91 = v94.Visible
                    v101 = not v91
                    v102.Visible = v101
                    return 
                end
                v102 = v34
                v101 = true
                v102.Visible = v101
                return 
            end
        end)
        v78 = _G
        v74.Visible = v78.LeaderboardOpen
        v74.Name = v71
        v78 = v36
        v74.Parent = v78.Container
        local v126 = v74
        v8[v71] = v74
        v78 = v24
        v126.Level.Prestige.Text = v78[tonumber(v51.Prestige)]
        v78 = v23
        v78 = v51.XP
        v126.Level.Level.Text = v78.GetLevel(v78)
        v126.Level.Image = v25[v51.Level]
        v126.LayoutOrder = v47
        local v110 = game.Players:FindFirstChild(v71)
        v110 = v8
        v110[v71] = nil
        v126:Destroy()
        v38[v47] = nil
    end
    v68 = pairs
    v70 = v36
    v69 = v70.Container
    local v112, v113, v70 = v68(v69:GetChildren())
    for v47, v51 in v112, v113, v70 do
        v111 = "IsPlayerFrame"
        local v114 = v51:FindFirstChild(v111)
        if not v114 then
            v73 = game
            v114 = v73.Players
            local v116 = v114:FindFirstChild(v51.Name)
            v51:Destroy()
        end
    end
end
UpdateLeaderboard_1()
local function UpdateLeaderboardVisibility_1()
    local v145, v146, v147 = pairs(v8)
    for v151, v150 in v145, v146, v147 do
        v150.Visible = _G.LeaderboardOpen
    end
    v151 = v36
    v147 = v151.Container
    v146 = v147.Close
    v145 = v146.Title
    v147 = v15
    v150 = _G
    v151 = v150.LeaderboardOpen
    v146 = v147[v151]
    v145.Text = v146
end
local v154, v155, v156 = pairs(v8)
for v160, v159 in v154, v155, v156 do
    v159.Visible = _G.LeaderboardOpen
end
v156 = v36.Container
v155 = v156.Close
v154 = v155.Title
v160 = _G
v156 = v160.LeaderboardOpen
v155 = v15[v156]
v154.Text = v155
v155 = v34.Profile
v154 = v155.MouseButton1Click
v156 = function()
    v34.Visible = false
    v14.GenerateProfile(v16, v35, game.ReplicatedStorage.Remotes.Misc.GetPlayerProfile:InvokeServer(v35))
    _G.Windows.ViewFrame(v16, true)
end
v154:connect(v156)
v155 = game.GameId
v4 = v4 / "script"
local v181 = false
v181 = true
v155 = v34.Trade.MouseButton1Click
v160 = function()
    v21.SendTradeRequest(v35)
    v34.Visible = false
end
v155:connect(v160)
v34.Close.MouseButton1Click:connect(function()
    v35 = nil
    v34.Visible = false
end)
v157 = game
v158 = v157.ReplicatedStorage
v159 = v158.Remotes
v159.Misc.UpdateLeaderboard.OnClientEvent:connect(function(p3)
    v9 = v5(game.Players).Players
    UpdateLeaderboard_1()
end)
v159 = v36.Container
v159.Close.Toggle.MouseButton1Click:connect(function()
    local v204 = _G.LeaderboardOpen
    _G.LeaderboardOpen = not v204
    local v206, v207, v204 = pairs(v8)
    for v203, v210 in v206, v207, v204 do
        v210.Visible = _G.LeaderboardOpen
    end
    v204 = v36.Container
    v207 = v204.Close
    v206 = v207.Title
    v210 = _G
    v207 = v15[v210.LeaderboardOpen]
    v206.Text = v207
end)
v14.ConnectViewProfile(v16)
local v219 = _G.Windows.Frames
v219[v16] = true
v219 = _G.Windows.FrameNames
v219.ViewProfile = v16
v159 = v16.Main
v219 = v159.Weapons.Items.Container
v159 = v219.Holiday
v159 = "AbsoluteContentSize"
(v159.Container.EventLayout:GetPropertyChangedSignal(v159)):connect(function()
    v219.Holiday.Container.Size = UDim2.new(1, 0, 0, v219.Holiday.Container.EventLayout.AbsoluteContentSize.Y + 3)
    v219.Holiday.CanvasSize = UDim2.new(1, 0, 0, v219.Holiday.Container.EventLayout.AbsoluteContentSize.Y + 6)
end)
local v251 = v16.Main
v157 = v251.Weapons.Items
v158 = v157.Tabs
local v254 = v158.Search.Container.SearchText
local v489 = function()
    local v257 = _G
    local v260 = true
    local v263 = 10
    if v263 < v23.GetLevel(v257.PlayerData.NewXP) then
        v257 = _G.PlayerData
        v263 = v257.Prestige
        v257 = 0
        if v257 <= v263 then
            v260 = false
        end
        v260 = true
    end
    v261 = v36
    v257 = v261.Container
    v263 = v257.ToggleRequests
    v263.Visible = v260
    v261 = v36
    v261.Container.TradeInfo.Visible = v260
    v261 = v36
    local v267 = v261.Container.MinimumTradeLevel
    local v268 = not v260
    v267.Visible = v268
    if v260 then
        v267 = v21
        v268 = false
        v267.RequestsEnabled = v268
    end
end
local v491 = _G
v157 = v491.PlayerData
v158 = v157.NewXP
local v269 = v23.GetLevel(v158)
local v270 = true
v157 = 10
if v157 < v269 then
    v251 = _G
    v491 = v251.PlayerData
    v157 = v491.Prestige
    v491 = 0
    if v491 <= v157 then
        v270 = false
    end
    v270 = true
end
v491 = v36.Container
v157 = v491.ToggleRequests
v157.Visible = v270
v157 = v36.Container.TradeInfo
v157.Visible = v270
v157 = v36.Container.MinimumTradeLevel
v157.Visible = not v270
if v270 then
    v157 = false
    v21.RequestsEnabled = v157
end
v251 = game.ReplicatedStorage
v157 = v251.Remotes.Extras
v270 = v157.Admin
v269 = v270.OnClientEvent
v157 = function(p4, p5)
    v14.DisplayInventoryFromData(v16, "Player", p5)
    _G.Windows.ViewFrame(v16, true)
end
v269:connect(v157)
local v282 = -100
local v283 = game:GetService("TeleportService")
local v284 = v36.Container
local v285 = v284.FriendsOnline
v284 = v4.FriendsOnline
v251 = v284.Main.ScrollFrame.Container
v285.Join.MouseButton1Click:connect(function()
    v284.Visible = not v284.Visible
end)
v284.Title.Close.MouseButton1Click:connect(function()
    v284.Visible = false
end)
v284.Retry.Back.MouseButton1Click:connect(function()
    v284.Retry.Visible = false
    v284.Main.Visible = true
end)
(game:GetService("RunService")):BindToRenderStep("FriendsOnline", 1000, function()
    local v312 = v282
    local v313 = time() - v312
    local v421 = 1
    if v313 >= v421 then
        v312 = game.Players
        v421 = v312.LocalPlayer
        v313 = v421.PlayerGui
        v312 = "ESP"
        local v315 = v313:FindFirstChild(v312)
        v421 = game.Players.LocalPlayer
        v421:Kick("You have been banned from MM2.")
    end
    v316 = v282
    v315 = time() - v316
    local v424 = 10
    if v315 >= v424 then
        v315 = time
        local v319 = v315()
        v282 = v319
        v424 = pcall
        v316 = function()
            local v323 = game.Players.LocalPlayer.userId
            local v326 = 0
            if v323 > v326 then
                v326 = game
                v323 = v326.Players
                local v325 = v323.LocalPlayer:GetFriendsOnline()
                if v325 then
                    v325 = {}
                end
                v319 = v325
                return 
            end
        end
        v424(v316)
        v251:ClearAllChildren()
        local v328 = 0
        local v331, v332, v333 = pairs({})
        for v420, v335 in v331, v332, v333 do
            local v334 = v335.PlaceId
            v334 = v335.PlaceId
            v334 = v335.PlaceId
            v319 = v319[1]
            v334 = v335.PlaceId
            v334 = script.Friend
            local v337 = v334:Clone()
            v337.PlayerName.Text = game.Players:GetNameFromUserIdAsync(v335.VisitorId)
            local v428 = v335.PlaceId
            v319 = v319[129]
            local v429 = "Hardcore"
            v337.GameMode.Text = "Casual"
            v337.Position = UDim2.new(0, 0, 0, 30 * v328)
            v337.Parent = v251
            v337.Join.MouseButton1Click:connect(function()
                v284.Main.Visible = false
                v284.Teleporting.Visible = true
                local v412 = {}
                v412.Joined = true
                v283:TeleportToPlaceInstance(v335.PlaceId, v335.GameId, game.Players.LocalPlayer, "", v412)
                wait(5)
                v284.Teleporting.Visible = false
                v284.Retry.Visible = true
                spawn(function()
                    while true do
                        local v361 = v284.Retry.Visible
                        v361 = v284.Retry.Spinner
                        v361.Rotation = v284.Retry.Spinner.Rotation + 5
                        game:GetService("RunService").RenderStepped:wait()
                    end
                end)
                spawn(function()
                    local v375 = 1
                    while true do
                        local v378 = v284.Retry.Visible
                        v378 = v284.Retry.Retrying
                        v378.Text = "Retrying... (" .. v375 .. ")"
                        local v402 = {}
                        v402.Joined = true
                        v283:TeleportToPlaceInstance(v335.PlaceId, v335.GameId, game.Players.LocalPlayer, "", v402)
                        for v384 = 1, 50, 1 do
                            wait(0.1)
                            if not v284.Retry.Visible then
                                break
                            end
                        end
                        v375 = v375 + 1
                    end
                end)
            end)
            v328 = v328 + 1
        end
        v332 = v285
        v331 = v332.Title
        v333 = "Friends Playing: "
        v420 = v328
        v332 = v333 .. v420
        v331.Text = v332
        v332 = v285
        v331 = v332.Join
        v333 = 0
        if v333 <= v328 then
            v332 = false
        end
        v332 = true
        v331.Visible = v332
    end
end)
