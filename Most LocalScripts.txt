local v1 = script
local v4 = v1.Parent.Parent.Game
local v5 = game
local v6 = v5.ReplicatedStorage
v1 = v6.Modules
local v7 = require(v1.ItemModule)
local v8 = v4.NewItem
v1 = nil
v6 = {}
local v10 = game.Lighting
v5 = v10.NewItemBlur
v10 = false
v5.Enabled = v10
v5 = 1
v10 = 1
local function UpdateClaimText_1()
    local v12 = v10
    local v13 = 1
    if v12 > v13 then
        v13 = v8.Container
        v12 = v13.Claim
        v13 = "Claim (" .. v5 .. "/" .. v10 .. ")"
        v12.Text = v13
        return 
    end
    v14 = v8
    v14.Container.Claim.Text = "Claim"
end
local function ShowItem_1()
    local v26 = v6[1]
    local v46 = _G.Database[v26.Type][v26.ItemName]
    v7.DisplayItem(v8.Container.NewItem, v46, v26.Amount or nil)
    local v36 = _G.Database.Rarities[v46.Rarity].Color
    local v38 = Color3.fromRGB(v36.r, v36.g, v36.b)
    if v38 then
        v38 = Color3.new
        local v42 = v38(1, 1, 1)
    end
    v8.Container.Starburst.ImageColor3 = v42
    v42 = v8.Container
    v42 = v26.TitleText
    v42.Title.Text = v42
    local v62 = v26.LFrame
    if not v62 then
        v62 = v26.LFrame
        v1 = v62
        v62 = v1
        v42 = false
        v62.Visible = v42
    end
    v42 = game.Lighting
    v42 = true
    v42.NewItemBlur.Enabled = v42
    v42 = true
    v8.Visible = v42
end
local function v67(p1, p2, p3, p4, p5)
    local v69 = {}
    v69.ItemName = p1
    v69.TitleText = p2 or "You Got..."
    v69.LFrame = p3
    local v79 = p4 or "Weapons"
    v69.Type = v79
    v69.Amount = p5
    table.insert(v6, v69)
    local v72 = v8
    local v73 = v72.Visible
    if v73 then
        v73 = 1
        v5 = v73
        v72 = v6
        v73 = #v72
        v10 = v73
        v73 = ShowItem_1
        v73()
    else
        v72 = v10
        v10 = v72 + 1
    end
    v74 = v10
    local v80 = 1
    if v74 > v80 then
        v80 = v8.Container
        v74 = v80.Claim
        v79 = v5
        v80 = "Claim (" .. v79 .. "/" .. v10 .. ")"
        v74.Text = v80
        return 
    end
    v75 = v8
    v74 = v75.Container.Claim
    v74.Text = "Claim"
end
_G.NewItem = v67
v67 = v8.Container.Claim
v67.MouseButton1Click:connect(function()
    local v87 = v8
    local v101 = v4
    v7.AnimateItemIconIntoInventory(v87.Container.NewItem.Container.Icon, v101.Dock.Inventory, v4)
    v8.Visible = false
    _G.UnfinishedItem = nil
    _G.UnfinishedType = nil
    table.remove(v6, 1)
    local v94 = game
    v94.Lighting.NewItemBlur.Enabled = false
    local v113 = v6[1]
    v5 = v5 + 1
    local v116 = v10
    local v117 = 1
    if v116 > v117 then
        v94 = v8
        v117 = v94.Container
        v116 = v117.Claim
        v94 = "Claim ("
        v101 = "/"
        v87 = v10
        v117 = v94 .. v5 .. v101 .. v87 .. ")"
        v116.Text = v117
    else
        v94 = v8
        v117 = v94.Container
        v116 = v117.Claim
        v117 = "Claim"
        v116.Text = v117
    end
    ShowItem_1()
    return 
    v10 = 1
    v5 = 1
    local v120 = v1
    if not v120 then
        v120 = v1
        v117 = true
        v120.Visible = v117
    end
end)
v67 = game.ReplicatedStorage.ItemGift
v67.OnClientEvent:connect(function(p6, p7)
    _G.NewItem(p6, "You Got...", nil, p7)
end)


//

local v3 = game:GetService("PolicyService")
local v6 = game.Players.LocalPlayer
local v92 = script.Parent.Parent.Game
local v11 = require(game.ReplicatedStorage.Modules.TradeModule)
local v18, v19 = pcall(function()
    return v3:GetPolicyInfoForPlayerAsync(v6)
end)
local v20 = _G
local v23 = true
local v102 = 10
if v102 < require(game.ReplicatedStorage.Modules.LevelModule).GetLevel(v20.PlayerData.NewXP) then
    v20 = _G.PlayerData
    v102 = v20.Prestige
    v20 = 0
    if v20 <= v102 then
        v23 = false
    end
    v23 = true
end
if v18 then
    v102 = warn
    v24 = "PolicyService error: "
    v20 = v24 .. v19
    v102(v20)
else
    local v26 = v19.IsPaidItemTradingAllowed
    v24 = "Trading Allowed = "
    v25 = v26
    print(v24, v25)
    if v26 then
        v92.Leaderboard.Inspect.Trade.Visible = false
        v11.RequestsEnabled = false
        return "Trading Not Allowed"
    end
end
if v23 then
    v29 = v92.Leaderboard
    v26 = v29.Inspect.Trade
    v26.Visible = false
    v26 = false
    v11.RequestsEnabled = v26
end
v26 = v92.Leaderboard
v31 = v26.Inspect
v28 = v26.Container
v29 = v28.TradeRequest
v28 = game.Players.LocalPlayer.PlayerGui.TradeGUI
v11.GUI.RequestFrame = v29
v11.GUI.TradeGUI = game.Players.LocalPlayer.PlayerGui.TradeGUI
v11.GUI.Actions = v28.Container.Trade.Actions
v11.GUI.YourOffer = v28.Container.Trade.YourOffer
v11.GUI.TheirOffer = v28.Container.Trade.TheirOffer
local v126 = game.ReplicatedStorage.Trade
local v38, v34 = v126.GetTradeStatus:InvokeServer()
v11.UpdateTradeRequestWindow(v38, v126)
v11.ConnectRequestWindow()
v11.ConnectActions()
v11.ConnectTabButtons()
local v44 = v92.Leaderboard.Container.ToggleRequests
v44.On.Visible = v11.RequestsEnabled
v44.Off.Visible = not v11.RequestsEnabled
v44.On.MouseButton1Click:connect(function()
    v44.On.Visible = false
    v44.Off.Visible = true
    v11.RequestsEnabled = false
    game.ReplicatedStorage.Trade.DeclineRequest:FireServer()
    v29.Visible = false
end)
v44.Off.MouseButton1Click:connect(function()
    v44.On.Visible = true
    v44.Off.Visible = false
    v11.RequestsEnabled = true
end)
v28.Changed:connect(function()
    v28.ClickBlocker.Visible = v28.Enabled
end)
local v76 = game.Players.LocalPlayer
v76.Changed:connect(function()
    local v82 = v76:GetAttribute("PerformingTrade")
    local v85 = false
    v28.Container.Visible = true
    v82 = v76
    local v84 = v82:GetAttribute("PerformingTrade")
    local v89 = false
    v28.Processing.Visible = true
end)


//

local v3 = script.Parent.Parent
local v4 = v3.Game
local v319 = v4.Inventory
local v7 = require(game.ReplicatedStorage.Modules.InventoryModule)
v7.GUI.MyInventory = {}
v7.GUI.MyInventory.Main = v319.Main
v7.GUI.MyInventory.Nav = v319.Nav
v7.GUI.NewItem = v4.NewItem
local v11 = v319.Main.Weapons
v7.GUI.EvoMenu = v11.EvoMenu
local v335 = {}
local v12 = "Effects"
local v13 = "Perks"
local v14 = "Emotes"
local v15 = "Radios"
local v16 = "Pets"
v335[1] = "Weapons"
v335[2] = v12
v335[3] = v13
v335[4] = v14
v335[5] = v15
v335[6] = v16
local v17, v18, v11 = pairs(v335)
for v10, v12 in v17, v18, v11 do
    v13 = pairs
    v16 = v7.CreateBlankInventoryTable
    local v19 = v16()
    v14 = v19[v12]
    local v20, v21, v15 = v13(v14)
    for v19, v34 in v20, v21, v15 do
        local v25 = v3.Main:FindFirstChild(v12).Items
        local v27 = v25.Container:FindFirstChild(v19)
        if v27 then
            v25 = v3.Main:FindFirstChild(v12).Items.Container
            v27 = v25:FindFirstChild("Holiday").Container
            local v33 = v27:FindFirstChild(v19)
        end
        v32 = v33.Container
        v32:ClearAllChildren()
    end
end
v17 = v7.GenerateInventory
v18 = v319
v11 = _G.PlayerData
local v35 = v17(v18, v11)
v7.MyInventory = v35
v35 = v319.Main.Weapons.Items.Container
(v35.Holiday.Container.EventLayout:GetPropertyChangedSignal("AbsoluteContentSize")):connect(function()
    v35.Holiday.Container.Size = UDim2.new(1, 0, 0, v35.Holiday.Container.EventLayout.AbsoluteContentSize.Y + 3)
    v35.Holiday.CanvasSize = UDim2.new(1, 0, 0, v35.Holiday.Container.EventLayout.AbsoluteContentSize.Y + 6)
end)
v7.ConnectNavButtons(v319.Nav, v319.Main)
v7.ConnectTabButtons(v319, "Weapons")
v7.UpdateMyEquip()
v7.ConnectEquipButtons()
v15 = v319.Main
v21 = v15.Pets
v20 = v21.Equipped
v7.ConnectPetNaming(v20.Container.NameYourPet.Container2)
v21 = v319.Main
v20 = v21.Weapons
v7.ConnectCodeFrame(v20.Equipped.Container.Codes)
v7.ConnectEvoMenu()
_G.Windows.Frames[v4.Inventory] = true
_G.Windows.FrameNames.Inventory = v4.Inventory
v4.Dock.Inventory.MouseButton1Click:connect(function()
    _G.Windows.ViewFrame(v3)
end)
v21 = v319.Main.Weapons
v20 = v21.Items
local v89 = v20.Tabs.Search.Container.SearchText
(v89:GetPropertyChangedSignal("Text")):connect(function()
    local v93 = v89.Text
    local v129 = string.gsub(v93, "S", "")
    local v98 = v7
    local v99 = v98.MyInventory
    local v102, v103, v104 = pairs(v99.Data.Weapons)
    for v100, v99 in v102, v103, v104 do
        v98 = pairs
        local v106, v107, v108 = v98(v99)
        for v127, v110 in v106, v107, v108 do
            v110.Frame.Visible = string.find(string.lower(v110.Name), string.lower(v93))
            local v131 = v110.Frame.Parent
            local v119 = v131.Parent:IsA("ScrollingFrame")
            if not v119 then
                v131 = v110.Frame.Parent
                v119 = v131.Parent
                v131 = Vector2.new
                v119.CanvasPosition = v131(0, 0)
            else
                v122 = v110.Frame.Parent.Parent.Parent
                v119 = v122.Parent
                v122 = Vector2.new
                v119.CanvasPosition = v122(0, 0)
            end
        end
    end
end)
local v137 = v4.Processing
local function v138(p1)
    if not p1 then
        v137.Title.Text = p1
        spawn(function()
            while true do
                local v142 = v137.Visible
                v142 = v137.Spinner
                v142.Rotation = v137.Spinner.Rotation + 5
                game:GetService("RunService").RenderStepped:wait()
            end
        end)
        spawn(function()
            while true do
                local v155 = v137.Visible
                v155 = wait
                v155(0.2)
                v137.Title.Text = v137.Title.Text .. "."
            end
        end)
        v137.Visible = true
        return 
    end
    v164 = v137
    v165 = false
    v164.Visible = v165
end
_G.Process = v138
v21 = game
v20 = v21.ReplicatedStorage
v138 = v20.UpdateDataClient
v20 = function(p2, p3)
    if p2 then
        v7.UpdateInventory(v3, v7.MyInventory)
    end
end
v138.Event:connect(v20)
v34 = v319.Main
v19 = v34.Weapons
v21 = v19.Equipped.Container
v138 = v21.Crafting.ActionButton
v138.MouseButton1Click:connect(function()
    _G.Windows.ViewFrame(v4.Crafting)
end)
v34 = v319.Main
v19 = v34.Radios
v21 = v19.Equipped.Container
v138 = v21.ViewSongs.ActionButton
v138.MouseButton1Click:connect(function()
    _G.Windows.ViewFrame(v4.Radio)
end)
v138 = game.Players
v21 = v4.Inventory.Main
v138 = v21.Radios.NoRadioCover
v138.Visible = not v138.LocalPlayer:GetAttribute("Radio")
v34 = game
v19 = v34.ReplicatedStorage
v21 = v19.Remotes.Shop
v138 = v21.GetRadio.OnClientEvent
v21 = function()
    v4.Inventory.Main.Radios.NoRadioCover.Visible = false
end
v138:connect(v21)
v34 = v4.Inventory
v19 = v34.Main
v19.Radios.NoRadioCover.Buy.MouseButton1Click:connect(function()
    game.ReplicatedStorage.Remotes.Shop.GetRadio:FireServer()
end)
v34 = v319.Main
v19 = v34.Weapons
local v379 = v19.Equipped
local v207 = v379.Container
local v380 = v207.PrimeOpen
if not game.StarterGui:GetAttribute("showPrime") then
    v207 = true
    v380.Visible = v207
    v379 = v380.Parent
    v207 = v379.Codes
    v379 = false
    v207.Visible = v379
    v207 = v380.Activated
    v19 = function()
        _G.Windows.ViewFrame("PrimeGaming")
    end
    v207:Connect(v19)
else
    v380.Visible = false
    v379 = v380.Parent
    v379 = true
    v379.Codes.Visible = v379
end
v212 = game
local v214 = v212:GetService("TweenService")
v34 = Enum.EasingStyle.Quad
v33 = Enum.EasingDirection.Out
local v219 = TweenInfo.new(0.5, v34, v33, 0, false, 0)
local v227 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v235 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local function PlayTweens_1(p4)
    local v240, v241, v242 = pairs(p4)
    for v245, v244 in v240, v241, v242 do
        v244:Play()
    end
end
local v246 = 0
local v248 = game.Players
local v250 = v248.LocalPlayer:GetAttribute("Elite")
local v253 = game:GetService("UserInputService")
local v254 = v253.TouchEnabled
if not v254 then
    v253 = game
    local v256 = v253:GetService("UserInputService")
    v254 = v256.KeyboardEnabled
    if v254 then
        v248 = v4.TabletCashBag
        if v248 then
            v248 = v4.CashBag
        end
        v254 = _G
        v256 = false
        v254.CoinBagFull = v256
        v256 = game.ReplicatedStorage.Remotes.Gameplay.GetCoin
        v254 = v256.OnClientEvent
        v254:connect(function(p5, p6)
            local v261 = v246
            if p5 > v261 then
                v261 = v246 + p6
                v246 = v261
            end
            local v314 = v246
            if v314 > p5 then
                v246 = p5
            end
            local v263 = v248
            v262 = v263.CoinIcon
            v314 = v262.Coins
            v262 = v246
            v314.Text = v262
            local v315 = v246
            if v315 >= p5 then
                v315 = v248
                v262 = "http://www.roblox.com/asset/?id=197073328"
                v315.Image = v262
                v262 = v248
                v315 = v262.Full
                v262 = true
                v315.Visible = v262
                v315 = _G
                v262 = true
                v315.CoinBagFull = v262
                v315 = pairs
                v263 = game
                v262 = v263.Workspace
                local v264, v265, v263 = v315(v262:GetChildren())
                for v281, v268 in v264, v265, v263 do
                    local v269 = v268:FindFirstChild("CoinContainer")
                    if not v269 then
                        local v272, v273, v274 = pairs(v269:GetChildren())
                        for v280, v279 in v272, v273, v274 do
                            local v277 = Instance.new("Model")
                            v277.Name = "BagFull"
                            v277.Parent = v279
                        end
                    end
                end
                v265 = v4
                v264 = v265.CoinBagFull
                v265 = true
                v264.Visible = v265
                v264 = {}
                v265 = v214
                v268 = v4
                v281 = v268.CoinBagFull
                v268 = v219
                v269 = {}
                v272 = UDim2.new
                v273 = 0.5
                v274 = 0
                v280 = 0.8
                v279 = 0
                v269.Position = v272(v273, v274, v280, v279)
                v264[2] = v263
                v264[2] = v265:Create(v281, v268, v269)
                v283 = pairs
                v263 = v264
                local v285, v286, v284 = v283(v263)
                for v288, v287 in v285, v286, v284 do
                    v287:Play()
                end
                v264 = wait
                v285 = 0.5
                v264(v285)
                local v289 = {}
                v288 = v4
                v284 = v288.CoinBagFull
                v288 = v227
                v287 = {}
                v287.Rotation = 3
                v289[2] = v286
                v289[2] = v214:Create(v284, v288, v287)
                v292 = pairs
                v286 = v289
                local v294, v295, v293 = v292(v286)
                for v297, v296 in v294, v295, v293 do
                    v296:Play()
                end
                v294 = 1.5
                wait(v294)
                local v298 = {}
                v297 = v4
                v293 = v297.CoinBagFull
                v297 = v235
                v296 = {}
                v296.Position = UDim2.new(0.5, 0, 1.15, 0)
                v298[2] = v295
                v298[2] = v214:Create(v293, v297, v296)
                v306 = pairs
                v295 = v298
                local v308, v309, v307 = v306(v295)
                for v311, v310 in v308, v309, v307 do
                    v310:Play()
                end
                v308 = 0.5
                wait(v308)
                v4.CoinBagFull.Visible = false
            end
        end)
        return 
    end
end


//

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


//

local v2 = script.Parent
local v3 = v2.Parent
local v4 = v3.Game
v3 = v4.Crafting
v2 = v4.Salvage
local v107 = v4.Inventory
local v10 = require(game.ReplicatedStorage.Modules.CraftModule)
v10.SetSalvageConfirmButton(v10.ShowSalvageRewards)
v10.SetCraftConfirmButton(v10.UpdateCraftConfirm)
v10.SetCraftGUI(v3, v3.Inventory.Craft.ScrollFrame, script.Recipe, v3.Action, v3.Inventory.Salvage.ScrollFrame, script.Item, v3.Action.Salvage, v2, v3.Action.Confirm)
v10.GenerateRecipes()
v10.GenerateSalvageInventory(v3.Inventory.Salvage.ScrollFrame, script.Item)
_G.Windows.Frames[v3] = true
_G.Windows.FrameNames.Crafting = v3
v3.Title.Back.MouseButton1Click:connect(function()
    v3.Visible = false
end)
v3.Action.Nav.Salvage.MouseButton1Click:connect(function()
    v3.Inventory.Craft.Visible = false
    v3.Inventory.Salvage.Visible = true
    v3.Action.Craft.Visible = false
    v3.Action.Salvage.Visible = true
    v3.Action.Nav.Salvage.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
    v3.Action.Nav.Craft.Style = Enum.ButtonStyle.RobloxRoundButton
    v10.ChangeMode("Salvage", true)
end)
v3.Action.Nav.Craft.MouseButton1Click:connect(function()
    v3.Inventory.Craft.Visible = true
    v3.Inventory.Salvage.Visible = false
    v3.Action.Craft.Visible = true
    v3.Action.Salvage.Visible = false
    v3.Action.Nav.Craft.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
    v3.Action.Nav.Salvage.Style = Enum.ButtonStyle.RobloxRoundButton
    v10.ChangeMode("Craft", true)
end)
v2.Claim.MouseButton1Click:connect(function()
    local v105 = v2.Claim.Style
    local v106 = Enum.ButtonStyle.RobloxRoundDefaultButton
    if v105 == v106 then
        v105 = v2
        v106 = false
        v105.Visible = v106
        v105 = v3
        v106 = true
        v105.Visible = v106
    end
end)


//

local v4 = script.Parent.Parent.Game
local v52 = v4.Shop
local v8 = require(game.ReplicatedStorage.Modules.ShopModule)
local v11 = require(game.ReplicatedStorage.Modules.ItemModule)
v8.GUI.ShopFrame = v52
v8.GUI.Main = v52.Main
v8.GUI.Nav = v52.Nav
v8.GUI.Title = v52.Title
v8.GUI.FeaturedFrame = v52.Main.Featured
v8.GUI.ViewBoxFrame = v52.Main.ViewCrate.Container
v8.GUI.Processing = v4.Processing
v8.GUI.HotItemsContainer = v52.Main.Featured.HotItems.Container
v8.GenerateHotItems()
v8.ConnectNavButtons()
v8.ConnectViewBoxFrame()
v8.ConnectBuyPopup()
v8.ConnectGems()
v8.GenerateShopItems()
_G.Windows.Frames[v4.Shop] = true
_G.Windows.FrameNames.Shop = v4.Shop
v4.Dock.Shop.MouseButton1Click:connect(function()
    _G.Windows.ViewFrame(v4.Shop)
    v8.ViewFeatured()
end)
v4.Shop.Main.Radios.NoRadioCover.Visible = not game.Players.LocalPlayer:GetAttribute("Radio")
game.ReplicatedStorage.Remotes.Shop.GetRadio.OnClientEvent:connect(function()
    v4.Shop.Main.Radios.NoRadioCover.Visible = false
end)
v4.Shop.Main.Radios.NoRadioCover.Buy.MouseButton1Click:connect(function()
    game.ReplicatedStorage.Remotes.Shop.GetRadio:FireServer()
end)
v52.Main.Featured.Offers.EventCover.BuyItem.MouseButton1Click:connect(function()
    _G.Windows.ViewFrame("Christmas2022")
end)


//

local v7 = require(game.ReplicatedStorage.Modules.EmoteModule)
local v8 = script.Parent.Parent.Game.Emotes
_G.EmoteFrame = v8
v7.EmoteGUI = v8
v7.GenerateEmotes(_G.PlayerData.Emotes.Owned, v8)
v7.SetupPageButtons()
_G.UpdateEmotes()


//

local v4 = game.ReplicatedStorage.Remotes.Extras
local v6 = v4.GetPlayerData:InvokeServer()
v4 = false
local v7 = game
local v8 = require(v7.ReplicatedStorage.CodeImages)
local v9 = script
v7 = v9.Parent
local v10 = v7.Parent.Game
v7 = v10.Dock
v7 = true
local v11 = game
v9 = v11.PlaceId
v11 = game
v9 = v11.PlaceId
v7 = false
v7 = true
v9 = v10.Spectate
v11 = 1
local v12
local function GetSpectatePlayers_1()
    local v15 = {}
    local v16 = v6
    if not v16 then
        v16 = pairs
        local v18, v19, v20 = v16(v6)
        for v24, v28 in v18, v19, v20 do
            local v25 = game.Players:FindFirstChild(v24)
            local v26 = game
            local v27 = v26.Players
            local v32 = v27.LocalPlayer
            if v25 == v32 then
                v32 = v28.Dead
                if v32 then
                    v32 = {}
                    return v32
                end
            end
            local v29 = v28.Dead
            if v29 then
                if not v25 then
                    v29 = v25.Character
                    if not v29 then
                        v29 = v25.Character
                        v26 = "Humanoid"
                        local v30 = v29:FindFirstChild(v26)
                        if not v30 then
                            v27 = v15
                            v30 = table.insert
                            v30(v27, v25)
                        end
                    end
                end
            end
        end
    end
    return v15
end
game.ReplicatedStorage.UpdatePlayerData.OnClientEvent:connect(function(p1)
    v6 = p1
    local v37 = v4
    if v37 then
        return 
    end
    v37 = GetSpectatePlayers_1
    local v38 = v37()
    if not v38 then
        v38 = #GetSpectatePlayers_1()
        local v54 = 0
        if v38 > v54 then
            v38 = v12
            local v42 = GetSpectatePlayers_1()
            local v43 = v12
            v54 = v42[v43]
            if v38 ~= v54 then
                v38 = pairs
                v43 = GetSpectatePlayers_1
                local v44 = v43()
                v54 = v44
                local v45, v46, v42 = v38(v54)
                for v44, v48 in v45, v46, v42 do
                    if v48 == v12 then
                        v11 = v44
                        return 
                    end
                end
                while true do
                    v46 = v11
                    v45 = v46 + 1
                    v11 = v45
                    v46 = GetSpectatePlayers_1
                    v42 = v11
                    v45 = v46()[v42]
                    if v45 then
                        break
                    end
                    v45 = v11
                    v42 = GetSpectatePlayers_1
                    if #v42() <= v45 then
                        break
                    end
                end
                v45 = v11
                v50 = GetSpectatePlayers_1
                v49 = #v50()
                if v45 > v49 then
                    v45 = 1
                    v11 = v45
                end
                v49 = GetSpectatePlayers_1
                local v52 = v49()
                local v56 = v11
                v45 = v52[v56]
                v12 = v45
                v45 = v12
                if not v45 then
                    v45 = v7
                    if not v45 then
                        v52 = v9
                        v45 = v52.CodeImage
                        v56 = v8
                        v47 = v12.Name
                        v48 = p1[v47]
                        v44 = v48.CodeName
                        v52 = v56[v44]
                        v45.Image = v52
                        v52 = v9
                        v45 = v52.CodeImage
                        v47 = v12
                        v48 = v47.Name
                        v44 = p1[v48]
                        v56 = v44.Color
                        v52 = v56.Color
                        v45.ImageColor3 = v52
                    else
                        v56 = v9
                        v52 = v56.CodeImage
                        v45 = v52.PlayerName
                        v56 = v12
                        v52 = v56.Name
                        v45.Text = v52
                    end
                    v56 = game
                    v52 = v56.Workspace
                    v45 = v52.CurrentCamera
                    v44 = v12
                    v56 = v44.Character
                    v52 = v56.Humanoid
                    v45.CameraSubject = v52
                    v52 = v10
                    v45 = v52.Waiting
                    v52 = "http://www.roblox.com/asset/?id=189842948"
                    v45.Image = v52
                    v45 = v9
                    v52 = true
                    v45.Visible = v52
                    v45 = true
                    v4 = v45
                    return 
                end
                v45 = game.Workspace.CurrentCamera
                v47 = game
                v48 = v47.Players
                v45.CameraSubject = v48.LocalPlayer.Character.Humanoid
                v45 = game.Workspace.CurrentCamera
                v45.CameraType = "Custom"
                v45 = v9
                v45.Visible = false
                v45 = v10.Waiting
                v45.Image = "http://www.roblox.com/asset/?id=189761558"
                v45 = false
                v4 = v45
                return 
                v45 = game.Workspace.CurrentCamera
                v47 = game
                v48 = v47.Players
                v45.CameraSubject = v48.LocalPlayer.Character.Humanoid
                v45 = game.Workspace.CurrentCamera
                v45.CameraType = "Custom"
                v45 = v9
                v45.Visible = false
                v45 = v10.Waiting
                v45.Image = "http://www.roblox.com/asset/?id=189761558"
                v45 = false
                v4 = v45
            end
            return 
        end
    end
end)
local function ChangeSpectate_1(p2)
    local v82 = GetSpectatePlayers_1()
    if not v82 then
        v82 = #GetSpectatePlayers_1()
        local v94 = 0
        if v82 > v94 then
            v94 = v11
            v82 = v94 + p2
            v11 = v82
            v82 = v11
            v94 = 1
            if v94 > v82 then
                v94 = GetSpectatePlayers_1
                v82 = #v94()
                v11 = v82
            else
                v82 = v11
                v85 = #GetSpectatePlayers_1()
                if v82 > v85 then
                    v82 = 1
                    v11 = v82
                end
            end
            v85 = GetSpectatePlayers_1
            v87 = v11
            v82 = v85()[v87]
            v12 = v82
            v87 = game
            v82 = v87.Workspace.CurrentCamera
            local v89 = v12
            v87 = v89.Character
            local v96 = v87.Humanoid
            v82.CameraSubject = v96
            v82 = v7
            if not v82 then
                v96 = v9
                v82 = v96.CodeImage
                v87 = v8
                v89 = v6[v12.Name].CodeName
                v96 = v87[v89]
                v82.Image = v96
                v96 = v9
                v82 = v96.CodeImage
                v89 = v6[v12.Name]
                v87 = v89.Color
                v96 = v87.Color
                v82.ImageColor3 = v96
                return 
            end
            v87 = v9
            v82 = v87.CodeImage.PlayerName
            v87 = v12
            v82.Text = v87.Name
            return 
        end
    end
    v87 = game
    v88 = v87.Workspace
    v90 = game
    v93 = v90.Players
    v89 = v93.LocalPlayer
    v87 = v89.Character
    v88 = v87.Humanoid
    v88.CurrentCamera.CameraSubject = v88
    v87 = game
    v88 = v87.Workspace
    v88 = "Custom"
    v88.CurrentCamera.CameraType = v88
    v88 = false
    v9.Visible = v88
    v88 = v10
    v88 = "http://www.roblox.com/asset/?id=189761558"
    v88.Waiting.Image = v88
    v4 = false
end
v9.Right.MouseButton1Click:connect(function()
    ChangeSpectate_1(1)
end)
v9.Left.MouseButton1Click:connect(function()
    ChangeSpectate_1(-1)
end)
v7.Spectate.MouseButton1Click:connect(function()
    local v116 = v4
    if not v116 then
        v116 = game.Workspace.CurrentCamera
        v116.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        v116 = game.Workspace.CurrentCamera
        v116.CameraType = "Custom"
        v116 = v9
        v116.Visible = false
        v116 = v10.Waiting
        v116.Image = "http://www.roblox.com/asset/?id=189761558"
        v116 = false
        v4 = v116
        return 
    end
    local v122 = GetSpectatePlayers_1()
    if not v122 then
        v118 = GetSpectatePlayers_1
        v122 = #v118()
        local v136 = 0
        if v122 > v136 then
            v122 = 1
            v11 = v122
            v136 = GetSpectatePlayers_1
            v117 = v11
            v122 = v136()[v117]
            v12 = v122
            v117 = game
            v122 = v117.Workspace.CurrentCamera
            v121 = v12
            v117 = v121.Character
            local v138 = v117.Humanoid
            v122.CameraSubject = v138
            v122 = v7
            if not v122 then
                v138 = v9
                v122 = v138.CodeImage
                v117 = v8
                v119 = v6
                v120 = v119[v12.Name]
                v121 = v120.CodeName
                v138 = v117[v121]
                v122.Image = v138
                v138 = v9
                v122 = v138.CodeImage
                v120 = v6
                v119 = v12.Name
                v121 = v120[v119]
                v117 = v121.Color
                v138 = v117.Color
                v122.ImageColor3 = v138
            else
                v117 = v9
                v138 = v117.CodeImage
                v122 = v138.PlayerName
                v117 = v12
                v138 = v117.Name
                v122.Text = v138
            end
            v122 = v10.Waiting
            v122.Image = "http://www.roblox.com/asset/?id=189842948"
            v122 = v9
            v122.Visible = true
            v122 = true
            v4 = v122
        end
    end
end)
game:GetService("UserInputService").InputBegan:connect(function(p3, p4)
    if not p4 then
        return 
    end
    local v147 = v4
    if v147 then
        return 
    end
    v147 = p3.KeyCode
    local v148 = Enum.KeyCode.Q
    if v147 == v148 then
        v147 = ChangeSpectate_1
        v148 = -1
        v147(v148)
        return 
    end
    local v149 = p3.KeyCode
    local v150 = Enum.KeyCode.E
    if v149 == v150 then
        v149 = ChangeSpectate_1
        v150 = 1
        v149(v150)
    end
end)


//

local v2 = script.Parent
local v4 = v2.Parent.Game
v2 = v4.Settings
v2 = v4.Radio
_G.Windows.Frames[v2] = true
local v7 = game.Players.LocalPlayer:GetAttribute("Radio")
local v344 = true
local v8 = game
local v9 = v8.PlaceId
v8 = game
v9 = v8.PlaceId
local v345 = false
local v346 = true
v9 = true
local v10 = game
v8 = v10.PlaceId
v10 = game
v8 = v10.PlaceId
local v347 = v4[1]
v9 = false
v9 = true
local v11 = v2.Main
v10 = v11.MySongs
v8 = v10.ScrollFrame
local v12 = v2.Main
v11 = v12.MySongs
v10 = v11.Adder
v12 = v2.Main
v11 = v12.Search
local v14 = v2.Main.Search
v12 = v14.ScrollFrame
local v15 = v2.Main
local v349 = v15.Search.Searcher
local function unescape_1(p1)
    p1 = string.gsub(p1, "&lt;", "<")
    p1 = string.gsub(p1, "&gt;", ">")
    p1 = string.gsub(p1, "&quot;", '"')
    p1 = string.gsub(p1, "&apos;", "'")
    p1 = string.gsub(p1, "&#(%d+);", function(p2)
        local v39 = tonumber(p2)
        if not v39 then
            v39 = tonumber
            local v41 = v39(p2)
            local v42 = 126
            if v42 > v41 then
                v42 = tonumber
                v41 = string.char
                return v41(v42(p2))
            end
        end
        return ""
    end)
    p1 = string.gsub(p1, "&#x(%d+);", function(p3)
        local v51 = tonumber(p3)
        if not v51 then
            v51 = tonumber
            local v53 = v51(p3)
            local v54 = 126
            if v54 > v53 then
                v54 = tonumber
                v53 = string.char
                return v53(v54(p3))
            end
        end
        return ""
    end)
    p1 = string.gsub(p1, ".", function(p4)
        local v63 = string.byte(p4)
        if not v63 then
            if 126 > v63 then
                return p4
            end
        end
        v64 = ""
        return v64
    end)
    p1 = string.gsub(p1, "&amp;", "&")
    return p1
end
unescape = unescape_1
if v346 then
    if v9 then
        v15 = {}
        local v77 = game
        local v78 = v77.ReplicatedStorage
        local v80 = v78.Remotes.Extras
        v15[2] = v80
        v15[4] = v78
        v15[5] = v77
        v15[4] = v80.GetData:InvokeServer("RadioSongs")
        unescape_1 = unpack
        local v92 = unescape_1(v15)
        v82 = v2.Nav
        local v94, v95, v80 = pairs(v82:GetChildren())
        for v83, v78 in v94, v95, v80 do
            v77 = v78.MouseButton1Click
            v85 = function()
                script.Preview:Stop()
                script.Preview.SoundId = ""
                local v99 = v2
                local v100, v101, v99 = pairs(v99.Nav:GetChildren())
                for v105, v103 in v100, v101, v99 do
                    local v102 = v78
                    local v104 = Enum.ButtonStyle.RobloxRoundDefaultButton
                    if v104 then
                        v104 = Enum.ButtonStyle.RobloxRoundButton
                    end
                    v103.Style = v104
                end
                if v103 == v102 then
                    v100 = pairs
                    v99 = v2
                    v101 = v99.Main
                    local v106, v107, v99 = v100(v101:GetChildren())
                    for v105, v103 in v106, v107, v99 do
                        v102 = v103.Name
                        if v102 ~= v78.Name then
                            v104 = false
                        end
                        v104 = true
                        v103.Visible = v104
                    end
                    return 
                end
            end
            v77:connect(v85)
        end
        v94 = false
        v78 = game
        v83 = v78.ReplicatedStorage
        v80 = v83.RoleSelect
        v95 = v80.OnClientEvent
        v83 = function(p5, p6, p7, p8)
            v94 = true
        end
        v95:connect(v83)
        v84 = game
        v84.ReplicatedStorage.Remotes.Shop.GetRadio.OnClientEvent:connect(function()
            v94 = true
        end)
        local function UpdateSongList_1()
            v8:ClearAllChildren()
            local v124, v125, v126 = pairs(v92)
            for u1, v131 in v124, v125, v126 do
                local v129 = script.Song:Clone()
                v129.Container.SongName.Text = v131.Name
                v129.Container.Play.MouseButton1Click:connect(function()
                    local v133 = v94
                    if not v133 then
                        local v134 = game
                        local v135 = v134.Players
                        local v136 = v135.LocalPlayer
                        v133 = v136.Character
                        if not v133 then
                            local v138 = game.Players
                            v134 = v138.LocalPlayer
                            v135 = v134.Character
                            v136 = v135.Humanoid
                            v133 = v136.Health
                            v136 = 0
                            if v133 > v136 then
                                v133 = v7
                                if not v133 then
                                    v135 = game
                                    v136 = v135.ReplicatedStorage
                                    v133 = v136.PlaySong
                                    v134 = v131
                                    v135 = v134.ID
                                    v133:FireServer(v135)
                                    return 
                                end
                                v138 = game
                                v134 = v138.ReplicatedStorage
                                v136 = v134.Remotes.Shop
                                v136.GetRadio:FireServer()
                                return 
                            end
                        end
                    end
                    v134 = v2
                    v139 = v134.Main
                    v136 = v139.MySongs
                    v136 = true
                    v136.Wait.Visible = v136
                    v136 = 2
                    wait(v136)
                    v134 = v2
                    v139 = v134.Main
                    v139.MySongs.Wait.Visible = false
                end)
                v129.Container.Delete.MouseButton1Click:connect(function()
                    table.remove(v92, u1)
                    game.ReplicatedStorage.RemoveSong:FireServer(u1)
                    UpdateSongList_1()
                end)
                v129.Position = UDim2.new(0, 0, 0, u1 - 1 * v129.Size.Y.Offset)
                v129.Parent = v8
            end
        end
        local function AddSong_1(p9, p10)
            local v175
            pcall(function()
                local v180 = tonumber(p9)
                if not v180 then
                    v180 = game
                    local v184 = (v180:GetService("MarketplaceService")):GetProductInfo(p9)
                    if not v184 then
                        local v185 = v184.AssetTypeId
                        v185 = "https://www.roblox.com/asset/?id=" .. p9
                        v175 = v185
                        p10 = unescape(v184.Name)
                    end
                end
            end)
            local v191 = "https://www.roblox.com/asset/?id="
            local v192 = p9
            v175 = v191 .. v192
            if not v175 then
                v191 = pairs
                v192 = v92
                local v193, v194, v195 = v191(v192)
                for v198, v197 in v193, v194, v195 do
                    if v197.ID == v175 then
                        return 
                    end
                end
                v194 = v92
                v195 = 1
                v198 = {}
                v198.ID = v175
                v198.Name = p10
                v193 = table.insert
                v193(v194, v195, v198)
                local v200 = #v92
                local v208 = 30
                if v200 >= v208 then
                    v200 = table.remove
                    v208 = v92
                    v200(v208, 30)
                end
                game.ReplicatedStorage.SaveSong:FireServer(v175, p10)
                UpdateSongList_1()
            else
                v203 = v10
                v203 = "Invalid ID!"
                v203.ID.Text = v203
            end
        end
        v2.Radio.MouseButton1Click:connect(function()
            _G.Windows.ViewFrame(v2)
        end)
        local function SearchSongs_1(p11)
            local v217 = v7
            if v217 then
                if p11 then
                    v217 = game.ReplicatedStorage.GetRadio
                    v217:FireServer()
                    return 
                end
            end
            v219 = script
            v219.Preview:Stop()
            v219 = script
            v219 = ""
            v219.Preview.SoundId = v219
            v219 = v11
            local v222, v223, v218 = pairs(v219:GetChildren())
            for v226, v225 in v222, v223, v218 do
                local v224 = v225.Name
                v224 = false
                v225.Visible = v224
            end
            v223 = v11
            v222 = v223.Processing
            v223 = true
            v222.Visible = v223
            v223 = v11
            v222 = v223.Processing
            v223 = "Searching."
            v222.Text = v223
            v222 = spawn
            v223 = function()
                local v227 = 1
                while true do
                    local v230 = v11.Processing.Visible
                    if not v230 then
                        break
                    end
                    v230 = v11.Processing
                    v230.Text = "Searching"
                    local v231 = v227 - 1
                    local v240 = v231 % 4
                    local v241 = 1
                    for v228 = 1, v240, v241 do
                        v231 = v11.Processing
                        v231.Text = v11.Processing.Text .. "."
                    end
                    v227 = v227 + 1
                    v240 = wait
                    v241 = 0.25
                    v240(v241)
                end
            end
            v222(v223)
            v225 = game
            v226 = v225.ReplicatedStorage
            v218 = v226.Remotes
            local v243 = v218.Extras
            if p11 then
                v225 = v14
                v226 = v225.ID
                v218 = v226.Text
                if v218 then
                    v218 = ""
                end
                local v245 = v243.SearchSongs:InvokeServer(v218)
                v243 = v11.Processing
                local v313 = false
                v243.Visible = v313
                if not v245 then
                    p11 = #p11
                    v243 = v12
                    v243:ClearAllChildren()
                    local v247 = {}
                    v313 = 0
                    v247.ID = v313
                    v313 = ""
                    v247.Name = v313
                    v313 = 0
                    v247.Takes = v313
                    v313 = 0
                    v247.Index = v313
                    v313 = pairs
                    v226 = v245
                    local v248, v249, v225 = v313(v226)
                    for v224, v251 in v248, v249, v225 do
                        local v250 = v251.AssetId
                        local v252 = v251.Sales
                        local v253 = v247.Takes
                        if v252 > v253 then
                            v253 = v251.AssetId
                            v247.ID = v253
                            v247.Takes = v252
                            v247.Index = v224
                            v253 = v251.Name
                            v247.Name = v253
                        end
                    end
                    v248 = table.remove
                    v249 = v245
                    v225 = v247.Index
                    v248(v249, v225)
                    v224 = {}
                    v251 = v247.ID
                    v224.AssetId = v251
                    v251 = v247.Name
                    v224.Name = v251
                    table.insert(v245, 1, v224)
                    local v259, v260, v261 = pairs(v245)
                    for v304, v251 in v259, v260, v261 do
                        v252 = script
                        v250 = v252.SearchedSong
                        local v262 = v250:Clone()
                        v253 = v262.Container
                        v252 = v253.SongName
                        v253 = tostring
                        v252.Text = v253(v251.Name)
                        v252 = pairs
                        local v265, v266, v267 = v252(v92)
                        for v273, v269 in v265, v266, v267 do
                            local v268 = v269.ID
                            local v272 = "https://www.roblox.com/asset/?id=" .. v251.AssetId
                            if v268 == v272 then
                                v272 = v262.Container
                                v268 = v272.Add
                                v272 = "Added"
                                v268.Text = v272
                                v272 = v262.Container
                                v268 = v272.Add
                                v272 = Enum.ButtonStyle.RobloxRoundButton
                                v268.Style = v272
                            end
                        end
                        v265 = nil
                        v273 = v262.Container
                        v267 = v273.Add
                        v266 = v267.MouseButton1Click
                        v273 = function()
                            v265:disconnect()
                            v262.Container.Add.Text = "Added"
                            v262.Container.Add.Style = Enum.ButtonStyle.RobloxRoundButton
                            AddSong_1(v251.AssetId, v251.Name)
                        end
                        v265 = v266:connect(v273)
                        v267 = v262.Container.Preview
                        v267.MouseButton1Click:connect(function()
                            local v292, v293, v294 = pairs(v12:GetChildren())
                            for v298, v296 in v292, v293, v294 do
                                v296.Container.Preview.Text = "Preview"
                            end
                            v293 = script
                            v292 = v293.Preview
                            v292:Stop()
                            v293 = "https://www.roblox.com/asset/?id="
                            v298 = v251
                            v294 = v298.AssetId
                            v298 = script
                            v294 = v298.Preview
                            v293 = v294.SoundId
                            v298 = script
                            v294 = v298.Preview
                            v294.SoundId = v293 .. v294
                            v296 = script
                            v298 = v296.Preview
                            v294 = v298.SoundId
                            if v294 ~= v293 then
                                v296 = v262
                                v298 = v296.Container
                                v294 = v298.Preview
                                v298 = "Stop"
                                v294.Text = v298
                                v298 = script
                                v294 = v298.Preview
                                v294:Play()
                                return 
                            end
                            v298 = script
                            v298 = ""
                            v298.Preview.SoundId = v298
                        end)
                        v267 = 0
                        v269 = 0
                        v272 = v304 - 1
                        v271 = v262.Size.Y
                        v270 = v271.Offset
                        v268 = v272 * v270
                        v262.Position = UDim2.new(v267, 0, v269, v268)
                        v271 = v262.Size.Y
                        v270 = v271.Offset
                        v272 = v270 * v304
                        v12.CanvasSize = UDim2.new(0, 0, 0, v272)
                        v262.Parent = v12
                    end
                    v259 = v12
                    v260 = true
                    v259.Visible = v260
                    return 
                    v259 = v11
                    v259 = true
                    v259.Empty.Visible = v259
                    return 
                end
                v259 = v11
                v247 = v259.Error
                v259 = true
                v247.Visible = v259
                return 
            end
        end
        v84 = SearchSongs_1
        v349.Add.MouseButton1Click:connect(v84)
        v349.ID.FocusLost:connect(function(p12)
            if not p12 then
                SearchSongs_1()
            end
        end)
        v10.Add.MouseButton1Click:connect(function()
            AddSong_1(v10.ID.Text)
        end)
        SearchSongs_1(true)
        UpdateSongList_1()
        return 
    end
end
if not v346 then
    v92 = pcall
    v94 = function()
        game.Workspace.Lobby.RadioGamepass:Destroy()
    end
    v92(v94)
end


//

local v1 = script
local v4 = v1.Parent.Parent.Game
local v6 = game.ReplicatedStorage
v1 = v6.Remotes
v6 = game
v1 = v6.Players
local v77 = v1.LocalPlayer
local v8 = game:GetService("UserInputService")
v6 = v8.TouchEnabled
if not v6 then
    v1 = v4.TabletPerk
    if v1 then
        v1 = v4.Perk
    end
    v6 = true
    v8 = game.PlaceId
    v8 = game.PlaceId
    v4 = v4[1]
    v6 = false
    v6 = true
    v8 = nil
    local v12 = game.ReplicatedStorage.GetSyncData:InvokeServer("Perks")
    local v31 = game
    local v34 = v31.Workspace:FindFirstChild("Footsteps")
    if not v34 then
        v31 = game.Workspace
        v34 = v31.Footsteps
        v34:Destroy()
    end
    _G.Sleight = false
    _G.Haste = false
    v35 = function(p2)
        local v37 = v6
        if not v37 then
            local v38 = "Trap"
        else
            v37 = _G.PlayerData.Perks.Equipped
            v38 = v37[1]
        end
        v8 = v38
        v41 = v8
        v38 = v12[v41]
        v41 = v1
        v41 = function(p1)
            local v16 = _G.Cache[p1]
            v16 = _G.Cache[p1]
            return v16
            local v17 = tonumber(p1)
            if not v17 then
                v17 = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId="
                local v19 = v17 .. p1
                if v19 then
                    v19 = p1
                end
                v17 = v19
                local v29 = v17 .. "&bust=" .. math.random(1, 10000)
                v17 = _G.Cache
                v17[p1] = v29
                return v29
            end
        end
        v40 = v38.Image
        v41.PerkIcon.Image = v41(v40)
        v1.PerkName.Text = v38.Name
        v1.ActivateText.Visible = v38.Active
        local v55 = true
        v1.Visible = v55
        local v56 = v38.Active
        if v56 then
            v56 = require
            v39 = v8
            v55 = script[v39]
            (v56(v55))(v1)
        end
    end
    v1.Gameplay.ActivatePerk.OnClientEvent:connect(v35)
    game:GetService("UserInputService").InputBegan:connect(function(p3)
        local v61 = v8
        v61 = p3.KeyCode
        local v62 = Enum.KeyCode.Q
        if v61 == v62 then
            local v63 = v12
            local v64 = v8
            v62 = v63[v64]
            v61 = v62.Active
            if not v61 then
                v61 = require
                v63 = script
                v64 = v8
                v62 = v63[v64]
                (v61(v62))(v1)
            end
        end
    end)
    v1.MouseButton1Click:connect(function()
        local v69 = v8
        local v70 = v12
        local v71 = v8
        local v72 = v70[v71]
        v69 = v72.Active
        if not v69 then
            v69 = require
            v70 = script
            v71 = v8
            v72 = v70[v71]
            (v69(v72))(v1)
        end
    end)
    return 
end


//

local v2 = game
if not (require(v2.ReplicatedFirst:WaitForChild("ChinaPolicyService"))):IsActive() then
    return 
end
local v8 = script
local v536 = v8.Parent.Parent.Game
v8 = game.ReplicatedStorage.Modules
local v13 = require(v8.Halloween2022)
v8 = game.ReplicatedStorage
local v15 = "Pass"
local v16 = v8.GetSyncData:InvokeServer("Halloween2022" .. v15)
v8 = v536.Halloween2022
local v17 = v8.Frames.BattlePass
v15 = v8.Frames
local v18 = v17.BuyTiers
v15 = v18.BuyFrame
local v19 = v8.Frames
v18 = v19.CurrencyExchange
local v20 = v8.Frames
local v544 = v20.PurchaseCurrency
v20 = false
local v24 = game.ReplicatedStorage.Modules
local v26 = require(v24.GridCreator)
v24 = game.ReplicatedStorage
local v28 = v24["Halloween2022" .. "Events"]
v24 = {}
v24.Weapons = game.ReplicatedStorage.GetSyncData:InvokeServer("Item")
v24.Materials = game.ReplicatedStorage.GetSyncData:InvokeServer("Materials")
v24.Crates = game.ReplicatedStorage.GetSyncData:InvokeServer("MysteryBox")
local v35 = game.ReplicatedStorage.GetSyncData:InvokeServer("Rarity")
local v36 = _G
local v561 = v36.EventCurrencyGained
if v561 then
    v561 = _G
    v36 = 0
    v561.EventCurrencyGained = v36
end
v13.GUI = v8
v13.BattlePassFrame = v8.Frames.BattlePass.Pass
v13.YourTier = v8.Frames.BattlePass.YourTier.TierNumber
v13.BuyTiersFrame = v17.BuyTiers.BuyFrame
v13.Currency = "Candies2022"
v13.KeyName = "HalloweenKey2022"
_G.Windows.Frames[v8] = true
_G.Windows.FrameNames.Halloween2022 = v8
v17.BuyTiers.TierCost.CandyCost.CandyNumber.Text = v16.TierCost
v17.BuyTiers.BuyFrame.CandyDisplay.Amount.Text = v16.TierCost
local v588 = {}
v588.Main = v8
v588.CandyDisplay = v17.YourCandies.Container
v588.CandyDisplay2 = v544.Candies.Container.Amount
v588.CandyDisplayBox = v8.Frames.Box.Main.Contents.Keys
v588.PumpkinKeyDisplayBox = v8.Frames.Box.Main.Contents.Keys2
v588.LeaderboardTokens = v8.Frames.Leaderboard.PlayerLeaderboard.Contents.Tokens
v588.TotalCandies = v8.Frames.Leaderboard.Description
v588.BoxButtonCandies = v8.Frames.Box.Main.Contents.Open
v588.BoxButtonKey = v8.Frames.Box.Main.Contents.Open2
v588.BattlePassFrame = v8.Frames.BattlePass
v588.TravellerFrame = v8.Frames.Traveller
v588.OpenCrate = script.OpenCrate
v13.GUI = v588
local function PageButtons_1()
    local v42 = v17
    local v45 = v13.CurrentPassPage
    local v49 = 0
    if v49 <= v45 then
        v42 = false
    end
    v42.Left.Visible = true
    local v51 = v17
    v49 = v13
    v45 = v49.CurrentPassPage
    if v45 <= v16.TotalTiers / 5 - 1 then
        v51 = false
    end
    v51.Right.Visible = true
end
v13.GenerateTiers(script.Tier, script.Page, v13.GenerateTierRewardPC)
local v56 = v13.CurrentPassPage
local v57 = 0
if v57 <= v56 then
    local v58 = false
end
v58 = true
v17.Left.Visible = v58
v56 = v13.CurrentPassPage
local v59 = v16.TotalTiers
v57 = v59 / 5 - 1
if v56 <= v57 then
    v58 = false
end
v58 = true
v17.Right.Visible = v58
v58 = v17.Left
v56 = function()
    v13.ChangePage(-1)
    local v62 = v17
    local v65 = v13.CurrentPassPage
    local v70 = 0
    if v70 <= v65 then
        v62 = false
    end
    v62.Left.Visible = true
    local v72 = v17
    v70 = v13
    v65 = v70.CurrentPassPage
    if v65 <= v16.TotalTiers / 5 - 1 then
        v72 = false
    end
    v72.Right.Visible = true
end
v58.MouseButton1Click:connect(v56)
v58 = v17.Right
v58.MouseButton1Click:connect(function()
    v13.ChangePage(1)
    local v80 = v17
    local v83 = v13.CurrentPassPage
    local v88 = 0
    if v88 <= v83 then
        v80 = false
    end
    v80.Left.Visible = true
    local v90 = v17
    v88 = v13
    v83 = v88.CurrentPassPage
    if v83 <= v16.TotalTiers / 5 - 1 then
        v90 = false
    end
    v90.Right.Visible = true
end)
v58 = v15.Plus1
v58.MouseButton1Click:connect(function()
    v13.ChangeBuyTiers(1)
end)
v58 = v15.Minus1
v58.MouseButton1Click:connect(function()
    v13.ChangeBuyTiers(-1)
end)
v58 = v15.Plus10
v58.MouseButton1Click:connect(function()
    v13.ChangeBuyTiers(10)
end)
v58 = v15.Minus10
v58.MouseButton1Click:connect(function()
    v13.ChangeBuyTiers(-10)
end)
local v114 = 0
v58 = v15.Buy.MouseButton1Click
v57 = function()
    local v118 = v114
    local v119 = time() - v118
    local v132 = 1
    if v119 >= v132 then
        v119 = time
        v114 = v119()
        v132 = v13
        local v121, v117 = v132.BuyTiers()
        if not v121 then
            v118 = v15.Buy
            v118.Style = Enum.ButtonStyle.RobloxRoundButton
            local v135 = v17
            v118 = v135.Left
            local v124 = v13.CurrentPassPage
            local v136 = 0
            if v136 <= v124 then
                v135 = false
            end
            v118.Visible = true
            local v138 = v17
            v118 = v138.Right
            v136 = v13
            v124 = v136.CurrentPassPage
            if v124 <= v16.TotalTiers / 5 - 1 then
                v138 = false
            end
            v118.Visible = true
            v118 = wait
            v118(1)
            v15.Buy.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
            return 
        end
        v124 = v15
        v128 = v124.MoreCandies
        v129 = v128.TextLabel
        v124 = "You need "
        v123 = v132
        v127 = " more candies"
        v128 = v124 .. v123 .. v127
        v129.Text = v128
        v128 = v15
        v129 = v128.MoreCandies
        v128 = true
        v129.Visible = v128
        v129 = wait
        v128 = 1
        v129(v128)
        v15.MoreCandies.Visible = false
    end
end
v58:connect(v57)
local v145 = v15.Menu.Container
local v146, v147, v145 = pairs(v145.List:GetChildren())
for v39, v59 in v146, v147, v145 do
    local v150 = v59:IsA("Frame")
    if not v150 then
        v150 = v59.Container.Button.MouseButton1Click
        v150:connect(function()
            local v154 = v8
            local v156, v157, v154 = pairs(v154.Frames:GetChildren())
            for v163, v160 in v156, v157, v154 do
                local v159 = v59.Name
                v159 = v8
                v159.Visible = false
                local v166 = v2.Shop
                v166.Visible = true
                local v168 = v160.Name
                if v168 ~= v59.Name then
                    v166 = false
                end
                v160.Visible = true
                v168 = v8
                v168.Back.Visible = true
            end
        end)
    end
end
v146 = _G
v147 = function()
    local v173 = v8
    local v175, v176, v173 = pairs(v173.Frames:GetChildren())
    for v180, v178 in v175, v176, v173 do
        local v177 = v178.Name
        local v179 = false
        v179 = true
        v178.Visible = v179
    end
    v173 = _G
    v176 = v173.Windows
    v175 = v176.ViewFrame
    v176 = v8
    v175(v176)
    v20 = false
end
v146.ViewCandies = v147
v146 = _G
v147 = function()
    local v183 = v8
    local v185, v186, v183 = pairs(v183.Frames:GetChildren())
    for v190, v188 in v185, v186, v183 do
        local v187 = v188.Name
        local v189 = false
        v189 = true
        v188.Visible = v189
    end
    v183 = _G
    v186 = v183.Windows
    v185 = v186.ViewFrame
    v186 = v8
    v185(v186)
    v20 = false
end
v146.ViewBattlePass = v147
v147 = v8.Back
v146 = v147.MouseButton1Click
v145 = function()
    local v193 = v8.Frames
    local v194 = v193.Menu
    local v195 = v194.Visible
    if not v195 then
        v195 = v20
        if not v195 then
            v193 = _G
            v194 = v193.Windows
            v195 = v194.ViewFrame
            v193 = v2
            v194 = v193.Shop
            v195(v194)
            return 
        end
        v8.Visible = false
        return 
    end
    local v204 = v8.Frames
    v197 = v204.Traveller
    v196 = v197.Visible
    if not v196 then
        v204 = v8
        v197 = v204.Frames
        v196 = v197.Traveller
        v197 = false
        v196.Visible = v197
        v196 = v17
        v197 = true
        v196.Visible = v197
        return 
    end
    local v205 = v8
    local v206 = v205.Frames
    v197 = v206.ItemPack
    v196 = v197.Visible
    if not v196 then
        v205 = v8.Frames
        v206 = v205.ItemPack
        v197 = v206.MoreInfo
        v196 = v197.Visible
        if not v196 then
            v205 = v8
            v206 = v205.Frames
            v197 = v206.ItemPack
            v196 = v197.MoreInfo
            v197 = false
            v196.Visible = v197
            v205 = v8
            v206 = v205.Frames
            v197 = v206.ItemPack
            v196 = v197.Main
            v197 = true
            v196.Visible = v197
            return 
        end
    end
    v196 = pairs
    local v207 = v8
    v197 = v207.Frames
    local v199, v200, v193 = v196(v197:GetChildren())
    for v192, v198 in v199, v200, v207 do
        local v201 = v198.Name
        local v202 = false
        v202 = true
        v198.Visible = v202
    end
end
v146:connect(v145)
v13.UpdateCandies()
v147 = v8.Close
v147.MouseButton1Click:connect(function()
    local v212 = v8
    local v214, v215, v212 = pairs(v212.Frames:GetChildren())
    for v219, v217 in v214, v215, v212 do
        local v216 = v217.Name
        local v218 = false
        v218 = true
        v217.Visible = v218
    end
    v214 = v8
    v215 = false
    v214.Visible = v215
end)
local v220 = _G
v147 = function()
    local v222 = v8
    local v224, v225, v222 = pairs(v222.Frames:GetChildren())
    for v229, v227 in v224, v225, v222 do
        local v226 = v227.Name
        local v228 = false
        v228 = true
        v227.Visible = v228
    end
end
v220.ViewHalloweenBox = v147
v220 = v18.BuyCandies
v147 = false
local v232 = game:GetService("UserInputService").KeyboardEnabled
local v234 = game:GetService("UserInputService")
v232 = v234.TouchEnabled
v147 = false
v147 = true
local function BuyCandiesUpdate_1()
    local v237 = v220
    local v238 = v237.GemBox
    local v240 = tonumber(v238.Text)
    if not v240 then
        v240 = v220.GemBox
        v238 = tonumber
        v237 = v220.GemBox.Text
        v240.Text = math.floor(v238(v237))
        v240 = v220.CandyAmount
        v240.Text = tonumber(v220.GemBox.Text) * 10
        return 
    end
    v244 = v220
    v244 = ""
    v244.GemBox.Text = v244
end
if not v147 then
    v59 = v220.GemBox
    v234 = v59.FocusLost
    v234:connect(BuyCandiesUpdate_1)
else
    v59 = v220.GemBox
    v59.Changed:connect(BuyCandiesUpdate_1)
end
local v257 = v18.SellCandies
local function SellCandiesUpdate_1()
    local v260 = v257
    local v261 = v260.CandyBox
    local v263 = tonumber(v261.Text)
    if not v263 then
        v263 = v257.CandyBox
        v261 = tonumber
        v260 = v257.CandyBox.Text
        v263.Text = math.floor(v261(v260))
        v263 = v257.CoinAmount
        v263.Text = tonumber(v257.CandyBox.Text)
        return 
    end
    v270 = v257
    v270 = ""
    v270.CandyBox.Text = v270
end
if not v147 then
    v152 = v257.CandyBox
    v152.FocusLost:connect(SellCandiesUpdate_1)
else
    v152 = v257.CandyBox
    v152.Changed:connect(SellCandiesUpdate_1)
end
local v280 = false
v152 = v220.Confirm.MouseButton1Click
v152:connect(function()
    local v283 = v280
    if not v283 then
        return 
    end
    v283 = _G.PlayerData.Gems
    local v286 = v220
    local v287 = v286.GemBox
    local v288 = tonumber(v287.Text)
    if v283 >= v288 then
        v288 = true
        v280 = v288
        v288 = tonumber
        v286 = v220
        v287 = v286.GemBox
        v287 = v220
        v287 = 0
        v287.GemBox.Text = v287
        v287 = v220
        v287 = "Buying..."
        v287.Confirm.Text = v287
        BuyCandiesUpdate_1()
        v287 = v28
        v286 = v288(v287.Text)
        v287.BuyCandies:InvokeServer(v286)
        v287 = v220
        v287 = "BUY"
        v287.Confirm.Text = v287
        v280 = false
        v287 = v13
        v287.UpdateTotalCandies()
    end
end)
v257.Confirm.MouseButton1Click:connect(function()
    local v302 = v280
    if not v302 then
        return 
    end
    v302 = true
    v280 = v302
    v257.CandyBox.Text = 0
    v257.Confirm.Text = "Selling..."
    SellCandiesUpdate_1()
    v28.SellCandies:InvokeServer(tonumber(v257.CandyBox.Text))
    v257.Confirm.Text = "SELL"
    v280 = false
end)
local function UpdateCandyExchange_1()
    v18.Candies.Container.Amount.Text = v26.Commafy(_G.PlayerData.Materials.Owned.Candies2021 or 0)
    v18.Gems.Container.Amount.Text = v26.Commafy(_G.PlayerData.Gems or 0)
    v18.Cash.Container.Amount.Text = v26.Commafy(_G.PlayerData.Coins or 0)
end
UpdateCandyExchange_1()
v544.Exchange.MouseButton1Click:connect(function()
    v19.Visible = false
    v18.Visible = true
end)
local v641 = v544.Container
local v367, v368, v369 = pairs(v641:GetChildren())
for v381, v371 in v367, v368, v369 do
    v371.MouseButton1Click:connect(function()
        game.ReplicatedStorage.Remotes.Shop.PurchaseProduct:FireServer(v371.Name, "Candies2021")
    end)
end
v371 = v8.Frames
v381 = v371.Traveller
v369 = v381.Unlocked
v368 = v369.Confirm
v367 = v368.MouseButton1Click
v369 = function()
    local v382 = _G
    local v383 = v382.PlayerData
    local v384 = v383.Materials
    local v386 = v384.Owned.Candies2022
    local v388 = 80000
    if v386 >= v388 then
        v384 = _G
        v388 = v384.PlayerData
        v386 = v388.Halloween2022
        v388 = true
        v386.AncientClaimed = v388
        v388 = v28
        v386 = v388.BuyEventAncient
        v386:FireServer()
        v383 = v8
        v384 = v383.Frames
        v388 = v384.Traveller
        v388 = false
        v388.Unlocked.Visible = v388
        v383 = v8
        v384 = v383.Frames
        v388 = v384.Traveller
        v388 = true
        v388.Radio.Visible = v388
        v382 = v8
        v383 = v382.Frames
        v384 = v383.Traveller
        v388 = v384.Radio
        v388.ResetAnimation:Fire()
    end
end
v367:connect(v369)
v371 = v8.Frames
v381 = v371.Traveller
v368 = v381.Radio.Confirm
v368.MouseButton1Click:connect(function()
    local v393 = _G
    local v394 = v393.PlayerData
    local v395 = v394.Materials
    local v397 = v395.Owned.Candies2022
    local v399 = 5000
    if v397 >= v399 then
        v395 = _G
        v399 = v395.PlayerData
        v397 = v399.Halloween2022
        v399 = true
        v397.RadioClaimed = v399
        v399 = v28
        v397 = v399.BuyHalloweenRadio
        v397:FireServer()
        v394 = v8
        v395 = v394.Frames
        v399 = v395.Traveller
        v399 = false
        v399.Unlocked.Visible = v399
        v394 = v8
        v395 = v394.Frames
        v399 = v395.Traveller
        v399 = false
        v399.Radio.Visible = v399
        v394 = v8
        v395 = v394.Frames
        v399 = v395.Traveller
        v399 = true
        v399.Completed.Visible = v399
        v393 = v8
        v394 = v393.Frames
        v395 = v394.Traveller
        v399 = v395.Completed
        v399.ResetAnimation:Fire()
    end
end)
v381 = _G
v368 = v381.PlayerData.Halloween2022
local v404 = v368.AncientClaimed
v381 = _G
v368 = v381.PlayerData.Halloween2022
v404 = v368.RadioClaimed
v368 = v8.Frames.Traveller
v404 = v368.NotUnlocked
v368 = false
v404.Visible = v368
v368 = v8.Frames.Traveller
v368 = false
v368.Unlocked.Visible = v368
v368 = v8.Frames.Traveller
v368 = false
v368.Radio.Visible = v368
v368 = v8.Frames.Traveller
v368 = true
v368.Completed.Visible = v368
v368 = v8.Frames.Traveller
v368 = false
v368.NotUnlocked.Visible = v368
v368 = v8.Frames.Traveller
v368 = false
v368.Unlocked.Visible = v368
v368 = v8.Frames.Traveller
v368 = true
v368.Radio.Visible = v368
v371 = v8.Frames
v381 = v371.Box
v368 = v381.Main.Contents
local function UpdateCrateContents_1()
    local v407 = v24
    local v408 = v407.Crates
    local v409 = "Halloween2022"
    local v410 = "Box"
    local v411 = v408[v409 .. v410]
    local v413, v414, v415 = pairs(v411.Contents)
    for v411, v408 in v413, v414, v415 do
        v407 = v404
        local v416 = "Item"
        local v417 = v411
        v410 = v416 .. v417
        local v418 = v407:FindFirstChild(v410)
        if not v418 then
            v416 = v404
            v417 = "Item" .. v411
            v409 = v416[v417].Container
            v418 = v409.Icon
            v409 = v26.GetImage
            v417 = v24.Weapons
            v416 = v417[v408]
            v418.Image = v409(v416.Image)
            v416 = v404
            v417 = "Item" .. v411
            v418 = v416[v417].Container.ItemName
            v417 = v24
            v416 = v417.Weapons
            v418.Text = v416[v408].ItemName
            v416 = v404
            v417 = "Item" .. v411
            v418 = v416[v417].Container.ItemName
            v417 = v24.Weapons[v408]
            v416 = v417.Rarity
            v418.TextColor3 = v35[v416]
        end
    end
end
(v641:GetChildren())()
v371 = v368.Container.Parent.Parent
v381 = v371.GetMore
v371 = function()
    v8.Frames.Box.Visible = false
    v8.Frames.PurchaseCurrency.Visible = true
end
v381.MouseButton1Click:connect(v371)
local v451 = v8.Frames
v381 = v451.ItemPack.Main.MoreInfo
v381.MouseButton1Click:connect(function()
    v8.Frames.ItemPack.Main.Visible = false
    v8.Frames.ItemPack.MoreInfo.Visible = true
    v8.Frames.ItemPack.MoreInfo.Completed.ResetAnimation:Fire()
end)
v381 = v8.Frames.ItemPack.MoreInfo.Completed.Confirm
v381.MouseButton1Click:connect(function()
    v8.Frames.ItemPack.Main.Visible = true
    v8.Frames.ItemPack.MoreInfo.Visible = false
end)
v13.ConnectBox()
local v484 = {}
v381 = script.Place1
v484.Place1 = v381
v381 = script.Place2
v484.Place2 = v381
v381 = script.Place3
v484.Place3 = v381
v381 = script.Place
v484.Place = v381
v13.LeaderboardFrames = v484
v13.UpdateLeaderboard()
v381 = v8.Frames.ItemPack.Main.Buy
v381.MouseButton1Click:connect(function()
    game.ReplicatedStorage.Remotes.Shop.GetPack:FireServer(24102758)
end)
v381 = v536.Dock
local v494, v495, v496 = pairs(v381:GetChildren())
for v441, v451 in v494, v495, v496 do
    local v498 = v451:IsA("ImageButton")
    if not v498 then
        v498 = v451.MouseButton1Click
        v498:connect(function()
            local v501 = v451.Name
            v501 = v8
            v501.Visible = false
        end)
    end
end
v494 = 1
v495 = v17.Tutorial
local v503 = _G
local v673 = v503.PlayerData.Halloween2022
v496 = not v673.Tutorial
v495.Visible = v496
v496 = pairs
local v505, v506, v451 = v496(v495:GetDescendants())
for v504, v503 in v505, v506, v673 do
    local v509 = v503:IsA("TextButton")
    if not v509 then
        v509 = v503.MouseButton1Click
        v509:connect(function()
            local v511 = v494
            v494 = v511 + 1
            local v514 = v494
            local v516 = v495:FindFirstChild("Frame" .. v514)
            if not v516 then
                v516 = pairs
                v511 = v495
                local v517, v518, v519 = v516(v511:GetChildren())
                for v513, v514 in v517, v518, v519 do
                    if v514.Name ~= "Frame" .. v494 then
                        local v524 = false
                    end
                    v524 = true
                    v514.Visible = v524
                end
                return 
            end
            v519 = _G
            v518 = v519.PlayerData
            v517 = v518.Halloween2022
            v518 = true
            v517.Tutorial = v518
            v517 = v495
            v518 = false
            v517.Visible = v518
            v518 = v28
            v517 = v518.Tutorial
            v517:FireServer()
        end)
    end
end
v673 = game.ReplicatedStorage
v506 = v673.UpdateDataClient
v505 = v506.Event
v505:connect(function()
    v13.UpdateCandies()
    UpdateCandyExchange_1()
end)
v506 = v28.OpenHalloweenMenu
v506.OnClientEvent:connect(function()
    _G.Windows.ViewFrame(v8)
    v20 = false
end)


//




