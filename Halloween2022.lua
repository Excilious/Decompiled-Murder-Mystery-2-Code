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
