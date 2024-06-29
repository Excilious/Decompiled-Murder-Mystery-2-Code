local v1 = {}
local v3 = game
local v5 = v3.ReplicatedStorage.Modules
local v7 = require(v5.GridCreator)
v5 = game.ReplicatedStorage
local v8 = v5.Halloween2020Events
v3 = "Pass"
v5 = "Halloween2020" .. v3
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.Currency = nil
EventCurrentTierBuy = 1
v1.BuyTiersFrame = nil
v1.LeaderboardFrames = {}
v3 = game.ReplicatedStorage
local v10 = v3.GetSyncData:InvokeServer()
v3 = nil
v1.NewPassTierRewardObject = v3
v3 = nil
v1.NewPassPageObject = v3
v3 = nil
v1.PassTierRewardObjectFunction = v3
v3 = function(p1, p2, p3, p4)
    v10 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v39 = v10[v5]
    v7.CreatePass(p3, p1, v39, v1.BattlePassFrame, p2)
    local v23 = _G.PlayerData
    local v24 = v23.Halloween2020
    v1.YourTier.Text = "Your Tier: " .. v24.CurrentTier
    local v49 = _G.PlayerData.Halloween2020.CurrentTier
    local v50 = v39.TotalTiers
    if v49 >= v50 then
        v49 = v49 - 1
    end
    v50 = math.floor
    local v26 = v50(v49 / 5)
    if p4 then
        v23 = v1
        v24 = v23.BattlePassFrame
        local v28, v29, v23 = pairs(v24:GetChildren())
        for v22, v31 in v28, v29, v23 do
            if v31.Name ~= "Page" .. v26 then
                local v35 = false
            end
            v35 = true
            v31.Visible = v35
        end
        v28 = v1
        v28.CurrentPassPage = v26
    end
    v28 = v1
    v29 = 1
    v28.CurrentTierBuy = v29
    v29 = v1
    v28 = v29.ChangeBuyTiers
    v29 = 0
    v28(v29)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v3
v3 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v54 = p6.Traveller
    v54 = p5.Container.Icon
    v54.Image = p6.Image
    local v97 = "???"
    p5.Title.TierNumber.Text = v97
    local v59 = _G.PlayerData.Halloween2020.CurrentTier
    if p7 < v59 then
        v97 = false
    end
    local v99 = true
    p5.Enter.Visible = v99
    v59 = _G.PlayerData.Halloween2020.CurrentTier + 1
    if v59 ~= p7 then
        v99 = false
    end
    local v104 = true
    p5.Next.Visible = v104
    v59 = _G.PlayerData.Halloween2020.CurrentTier
    if v59 <= p7 then
        v104 = false
    end
    p5.Locked.Visible = true
    p5.Claim.Visible = false
    v59 = function()
        v1.GUI.BattlePassFrame.Visible = false
        v1.GUI.TravellerFrame.Visible = true
    end
    p5.Enter.MouseButton1Click:connect(v59)
    return 
    local v70 = tostring(p7)
    local v118 = v10
    local v119 = v118[v5]
    local v120 = v119.Rewards
    local v121 = v120[v70]
    local v122 = false
    local v124 = p6.ItemID
    if not v124 then
        v120 = v7
        v124 = v120.MakeItemFrame
        v120 = p5
        v119 = p6
        v118 = false
        v124(v120, v119, v118)
        local v74 = v3
        local v75 = v74[p5]
        if v75 then
            v75 = v3
            v74 = p5.Claim.MouseButton1Click
            v75[p5] = v74:connect(function()
                p5.Claim.Visible = false
                local v86 = _G.PlayerData.Halloween2020.ClaimedRewards[v70]
                v1.ClaimReward(v70)
            end)
        end
    end
    v75 = p5.Locked
    v76 = _G.PlayerData.Halloween2020.CurrentTier
    if v76 <= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Next
    v76 = _G.PlayerData.Halloween2020.CurrentTier + 1
    if v76 ~= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Claim
    v90 = false
    v76 = _G.PlayerData.Halloween2020.CurrentTier
    if v76 >= p7 then
        v90 = not _G.PlayerData.Halloween2020.ClaimedRewards[v70]
        if not v90 then
            v90 = true
        end
    end
    v75.Visible = v90
    v90 = p5.Title
    v75 = v90.TierNumber
    v75.Text = p7
end
v1.ChangePage = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v146 = v1
    local v136, v137, v134 = pairs(v146.BattlePassFrame:GetChildren())
    for v133, v139 in v136, v137, v146 do
        if v139.Name ~= "Page" .. v1.CurrentPassPage then
            local v144 = false
        end
        v144 = true
        v139.Visible = v144
    end
end
v1.ChangeBuyTiers = function(p9)
    local v151 = _G.PlayerData.Halloween2020.CurrentTier
    local v163 = v10[v5].TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v171 = v1.CurrentTierBuy
    local v172 = 1
    if v172 > v171 then
        v171 = v1
        v172 = 1
        v171.CurrentTierBuy = v172
    end
    local v174 = v1.CurrentTierBuy
    local v175 = v174 + v151
    if v175 > v163 then
        v175 = v1
        v174 = v163 - v151
        v175.CurrentTierBuy = v174
    end
    local v178 = v1.CurrentTierBuy
    local v179 = 1
    if v178 > v179 then
        v174 = "s"
    else
        v174 = ""
    end
    v179 = v1
    v178 = v179.BuyTiersFrame
    v178.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v174)
    local v185 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v186 = v1
    local v187 = v186.CurrentTierBuy
    local v188 = v187 * v10[v5].TierCost
    v185.Text = v188
    if v151 >= v163 then
        v187 = v1
        v188 = v187.BuyTiersFrame
        v185 = v188.Parent
        v188 = false
        v185.Visible = v188
        v186 = v1
        v187 = v186.BattlePassFrame
        v188 = v187.Parent
        v185 = v188.PassComplete
        v188 = true
        v185.Visible = v188
    end
end
v1.BuyTiers = function()
    local v190 = v1.CurrentTierBuy
    local v222 = _G.PlayerData.Materials.Owned[v1.Currency] or 0
    local v223 = v10
    local v227 = v223[v5].TierCost * v190
    if v227 < v222 then
        v223 = false
    end
    print("Tiers To Buy: " .. v190)
    local v231 = "Current Tier: "
    local v199 = _G
    local v200 = v199.PlayerData
    local v201 = v200.Halloween2020
    local v232 = v201.CurrentTier
    print(v231 .. v232)
    if not true then
        v231 = v190
        v8.BuyTiers:FireServer(v231)
        v232 = _G
        v199 = _G.PlayerData
        v200 = v199.Materials
        v201 = v200.Owned
        v199 = v1
        v200 = v199.Currency
        v232 = v201[v200]
        v232.PlayerData.Materials.Owned[v1.Currency] = v232 - v227
        v200 = _G
        v201 = v200.PlayerData
        v232 = v201.Halloween2020
        _G.PlayerData.Halloween2020.CurrentTier = v232.CurrentTier + v190
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v201 = v1
        v232 = v201.CurrentTierBuy
        print("Tiers To Buy: " .. v232)
        v199 = _G
        v200 = v199.PlayerData
        v201 = v200.Halloween2020
        v232 = v201.CurrentTier
        print("Current Tier: " .. v232)
        v1.UpdateCandies()
        v232 = v1
        v201 = v1
        v232 = v201.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v232.NewPassPageObject, v232)
        return true
    end
    return false, v227 - v222
end
v1.ClaimReward = function(p10)
    local v255 = tostring(p10)
    local v256 = v10
    local v257 = v5
    local v258 = v256[v257]
    local v259 = v258.Rewards
    local v260 = v259[v255]
    if not v260 then
        v259 = v260.ItemID
        v258 = print
        v256 = v259
        v258(v256)
        local v261 = _G
        v257 = v261.PlayerData
        local v263 = v257.Halloween2020.CurrentTier
        v257 = v255
        local v264 = tonumber(v257)
        if v263 >= v264 then
            v261 = _G.PlayerData
            v264 = v261.Halloween2020.ClaimedRewards
            v263 = v264[v255]
            v261 = _G
            v264 = v261.PlayerData.Halloween2020
            v263 = v264.ClaimedRewards
            v264 = true
            v263[v255] = v264
            v263 = v260.ItemType
            v263 = v260.ItemType
            v263 = v260.ItemType
            v261 = _G.PlayerData
            v264 = v261[v260.ItemType].Owned
            v263 = v264[v259]
            v261 = _G.PlayerData
            local v279 = v260.ItemType
            local v280 = v261[v279]
            v264 = v280.Owned
            if not v263 then
                v261 = v260.Amount
                v280 = v263 + v261
                if v280 then
                    v280 = v260.Amount
                end
                v264[v259] = v280
                v279 = _G
                v261 = v279.PlayerData
                v279 = v260.ItemType
                v280 = v261[v279]
                v264 = v280.Owned
                v280 = v259
                v263 = table.insert
                v263(v264, v280)
                v261 = v1
                v279 = v1
                v261 = v279.PassTierRewardObjectFunction
                v279 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v261.NewPassPageObject, v261, v279)
                v8.ClaimReward:FireServer(v255)
                return 
                return 
            end
        end
    end
end
local v283 = v8.UpdateGiftTool
v283.OnClientEvent:Connect(function()
    v1.UpdateCandies()
end)
local function v287()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplay2.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0) .. " Candies"
    v1.GUI.PumpkinKeyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.KeyName] or 0) .. " Pumpkin Keys"
    local v355 = v1.GUI
    local v363 = _G.PlayerData.Materials.Owned[v1.KeyName] or 0
    local v364 = 0
    if v364 <= v363 then
        v355 = false
    end
    v355.PumpkinKeyDisplayBox.Visible = true
    v363 = v1
    local v366 = v363.GUI
    v364 = _G.PlayerData.Materials.Owned[v1.KeyName]
    local v374 = v364 or 0
    local v375 = 0
    if v375 <= v374 then
        v366 = false
    end
    v366.BoxButtonKey.Visible = true
    v375 = _G
    v374 = v375.PlayerData
    local v378 = v374.Halloween2020.AncientClaimed
    v1.GUI.TravellerFrame.Part1.Visible = false
    v1.GUI.TravellerFrame.Part3.Visible = true
end
v1.UpdateCandies = v287
v287 = 0
v1.TotalCurrency = v287
v287 = function()
    v1.GUI.TotalCandies.Text = "You have earned " .. v1.TotalCurrency + _G.EventCurrencyGained .. " candies total."
end
v1.UpdateTotalCandies = v287
v287 = function()
    local v400 = v8
    local v402, v400 = v400.GetLeaderboard:InvokeServer()
    v1.TotalCurrency = v400 or 0
    local v404 = v1
    v404.UpdateTotalCandies()
    local v405 = v1
    v404 = v405.GUI
    v404 = 1
    v405 = v404.LeaderboardTokens.Container
    local v407 = 0
    local v408 = {}
    v405:ClearAllChildren()
    local v454, v455, v456 = pairs(v402)
    for v459, v461 in v454, v455, v456 do
        (function(p11, p12)
            local v413 = v1.LeaderboardFrames
            local v415 = v404
            local v431 = "Place" .. v415
            local v416 = v413[v431]
            if v416 then
                v431 = v1
                v413 = v431.LeaderboardFrames
                v416 = v413.Place
            end
            local v417 = v416:Clone()
            local v432 = v404
            local v433 = 4
            if v433 > v432 then
                v433 = v417.Container
                v432 = v433.PlayerImage
                v415 = game.ReplicatedStorage
                v433 = v415.GetPlayerImage
                v432.Image = v433:Invoke(p12.key)
            end
            v419 = v417.Container
            v419 = "#" .. v404 .. " - " .. p12.key
            v419.Username.Text = v419
            v419 = v417.Container
            v419 = v7.Commafy(p12.value) .. " Candies"
            v419.TokenCount.Text = v419
            v417.Parent = v405
            v419 = 0
            v417.Position = UDim2.new(v419, 0, 0, v407)
            v417.Name = p12.key
            table.insert(v408, v417)
            v407 = v407 + v417.AbsoluteSize.Y
            v404 = v404 + 1
        end)(v459, v461)
    end
end
v1.UpdateLeaderboard = v287
v287 = function(p13)
    local v464 = _G
    local v465 = v464.PlayerData
    local v468 = v465.Materials.Owned[p13]
    local v484 = v1
    local v485 = v484.Currency
    if p13 == v485 then
        v468 = 600
    else
        v468 = false
        v484 = v1
        v485 = v484.KeyName
        if p13 == v485 then
            v468 = 1
        end
    end
    if v468 or 0 >= v468 then
        v464 = _G
        v465 = v464.PlayerData
        v484 = v465.Materials
        v485 = v484.Owned
        v464 = _G.PlayerData.Materials.Owned
        v465 = v464[p13]
        v484 = v465 - v468
        v485[p13] = v484
        v465 = v1
        v484 = v465.GUI
        v485 = v484.Main
        v484 = false
        v485.Visible = v484
        v484 = _G
        v485 = v484.Process
        v484 = "Unboxing"
        v485(v484)
        v464 = game.ReplicatedStorage.Remotes
        v465 = v464.Shop
        v464 = "Halloween2020Box"
        local v476 = v465.OpenCrate:InvokeServer(v464, "MysteryBox", p13)
        v465 = wait
        local v477 = 0.75
        local v478 = time()
        local v479 = v478 - time()
        v465(v477 - v479)
        local v481 = _G
        v481.Process()
        if not v476 then
            v478 = game
            v479 = v478.ReplicatedStorage
            v477 = v479.Remotes
            v481 = v477.Shop
            v477 = "Halloween2020Box"
            v479 = v476
            v481.BoxController:Fire(v477, v479)
        end
    end
end
v1.OpenBox = v287
v287 = function(p14)
    v1.GUI.BoxButtonCandies.MouseButton1Click:connect(function()
        v1.OpenBox(v1.Currency)
    end)
    v1.GUI.BoxButtonKey.MouseButton1Click:connect(function()
        v1.OpenBox(v1.KeyName)
    end)
end
v1.ConnectBox = v287
v287 = {}
v283 = "Mission1"
v287.Login = v283
v283 = "Mission2"
v287.Murderer = v283
v283 = "Mission3"
v287.Innocent = v283
v283 = {}
local v509 = 0
v283.Login = v509
v509 = 6
v283.Murderer = v509
v509 = 4
v283.Innocent = v509
v509 = 0
local function v510()
    local v512 = v1.GUI
    local v513 = v512.Challenges
    local v514 = v513.Main
    local v515 = v514.Dailies
    local v516 = v515.Bones
    local v518, v519, v516 = pairs(v516.Container:GetChildren())
    for v515, v514 in v518, v519, v516 do
        local v522 = v514:IsA("Frame")
        if not v522 then
            v522 = table.insert
            v522(v512, v514)
        end
    end
    v518 = pairs
    v519 = {}
    local v525, v526, v516 = v518(v519)
    for v515, v514 in v525, v526, v516 do
        v514.Visible = false
    end
    v516 = 1
    v525 = _G.PlayerData.SkellyBones2020
    v526 = 1
    for v516 = v516, v525, v526 do
        v515 = v512[v516]
        v514 = true
        v515.Visible = v514
    end
    v525 = pairs
    v526 = _G.PlayerData.ChallengeProgress2020
    local v528, v529, v516 = v525(v526)
    for v515, v514 in v528, v529, v516 do
        local v530 = v1
        local v531 = v530.GUI
        local v532 = v531.Challenges
        local v546 = v287
        v527 = v532.Main.Dailies.Missions[v546[v515]]
        local v548 = v509
        local v549 = 1
        if v549 > v548 then
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = false
            v548.Visible = v549
        else
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Completed
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Completed
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = false
            v548.Visible = v549
            v513 = #v513
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Progress
            v546 = v514
            v532 = "/"
            v530 = v283
            v531 = v530[v515]
            v549 = v546 .. v532 .. v531
            v548.Text = v549
        end
    end
    v529 = v513.Main
    v528 = v529.Dailies
    v529 = false
    v527 = _G
    local v550 = v527.PlayerData
    v516 = v550.Halloween2020.CurrentTier
    local v552 = 30
    if v552 > v516 then
        v527 = _G
        v550 = v527.PlayerData
        v552 = v550.Halloween2020
        v516 = v552.Tutorial
        v529 = false
        v529 = true
    end
    v528.Visible = v529
    v528 = print
    v529 = "tutorial"
    v527 = _G
    v516 = v527.PlayerData.Halloween2020.Tutorial
    v528(v529, v516, "Halloween2020")
    v527 = _G
    v513.Main.BPTutorial.Visible = not v527.PlayerData.Halloween2020.Tutorial
    local v558 = v513.Main
    v527 = _G
    if 30 < v527.PlayerData.Halloween2020.CurrentTier then
        v558 = false
    end
    v558.BPComplete.Visible = true
end
v1.UpdateChallenges = v510
v510 = v8.UpdateChallenges.OnClientEvent
v510:connect(function(p15, p16)
    _G.PlayerData.ChallengeProgress2020 = p15
    _G.PlayerData.SkellyBones2020 = p16
    v1.UpdateChallenges()
end)
local v573 = {}
v573.Mission1 = "Login"
v573.Mission2 = "Murderer"
v573.Mission3 = "Innocent"
local function TimerConvert_1(p17)
    return string.format("%02i:%02i:%02i", p17 / 3600, p17 / 60 % 60, p17 % 60)
end
local v600
local v601 = 0
local v602 = {}
local function v603()
    local v604 = v600
    return 
    local v607 = v1.GUI.SantaChallenge
    local v608 = v607.Challenge
    v604 = v608.WeaponDetails
    local v609 = v1
    v607 = v609.GUI.SantaChallenge.Challenge
    local v663 = v607.Weapons
    v607 = v10.Item
    v601 = 0
    local v666 = v600
    local v610, v611, v609 = pairs(v600)
    for v614, v617 in v610, v611, v609 do
        local v616 = v608["Item" .. v614]
        v616.Container.Icon.Image = v607[v617].Image
        v616.Container.ItemName.Text = v607[v617].ItemName
        v616.Container.ItemName.TextColor3 = v10.Rarity[v607[v617].Rarity]
        local v686 = _G.PlayerData.Weapons.Owned[v617]
        v601 = v601 + 1
        v616.Container.Completed.Visible = true
        local v693 = v602[v616]
        v602[v616]:disconnect()
        v602[v616] = v616.Container.ActionButton.MouseButton1Click:connect(function()
            v604.ItemFrame.Container.Icon.Image = v607[v617].Image
            v604.ItemFrame.Container.ItemName.Text = v607[v617].ItemName
            v604.ItemFrame.Container.ItemName.TextColor3 = v10.Rarity[v607[v617].Rarity]
            v604.Description.BoxName.Text = v10.MysteryBox[(function(p18)
                local v586, v587, v588 = pairs(v10.MysteryBox)
                for v598, v591 in v586, v587, v588 do
                    local v592, v593, v594 = pairs(v591.Contents)
                    for v597, v595 in v592, v593, v594 do
                        if v595 == p18 then
                            return v596
                        end
                    end
                end
            end)(v617)].Name
            v604.Visible = true
        end)
    end
    v614 = v1
    v609 = v614.GUI
    v611 = v609.SantaChallenge
    v610 = v611.Challenge
    v611 = false
    v610.Visible = v611
    v614 = v1
    v611 = v614.GUI.SantaChallenge
    v610 = v611.Completed
    v611 = true
    v610.Visible = v611
    v616 = v1
    v617 = v616.GUI
    v614 = v617.SantaChallenge
    v611 = v614.Challenge.Complete
    v610 = v611.Progress
    v614 = "/10 Weapons Owned"
    v611 = v601 .. v614
    v610.Text = v611
    v616 = v1
    v617 = v616.GUI
    v614 = v617.SantaChallenge
    v611 = v614.Challenge.Complete
    v610 = v611.Confirm
    v614 = 10
    if v614 > v601 then
        v611 = Enum.ButtonStyle.RobloxRoundButton
        if v611 then
            v611 = Enum.ButtonStyle.RobloxRoundDefaultButton
        end
        v610.Style = v611
        return 
    end
end
v1.UpdateSantasChallenge = v603
v603 = function()
    local v709 = v1.GUI.SantaChallenge.Challenge.WeaponDetails
    v600 = v8.GetSantaChallenges:InvokeServer()
    local v753 = v600
    v1.UpdateSantasChallenge()
    v1.GUI.SantaChallenge.Challenge.Visible = false
    v1.GUI.SantaChallenge.Completed.Visible = true
    local v765 = _G
    local v766 = v765.PlayerData
    local v767 = v766.Halloween2020
    local v768 = v767.ChallengeTutorial
    if v768 then
        v765 = v1
        v766 = v765.GUI
        v767 = v766.SantaChallenge
        v768 = v767.Challenge
        v767 = false
        v768.Visible = v767
        v765 = v1
        v766 = v765.GUI
        v767 = v766.SantaChallenge
        v768 = v767.Tutorial
        v767 = true
        v768.Visible = v767
    end
    v1.GUI.SantaChallenge.Tutorial.Confirm.MouseButton1Click:connect(function()
        v1.GUI.SantaChallenge.Challenge.Visible = true
        v1.GUI.SantaChallenge.Tutorial.Visible = false
        _G.PlayerData.Halloween2020.ChallengeTutorial = true
        v8.CompleteChallengeTutorial:FireServer()
    end)
    v709.Description.Close.MouseButton1Click:connect(function()
        v709.Visible = false
    end)
    v1.GUI.SantaChallenge.Challenge.Complete.Confirm.MouseButton1Click:connect(function()
        local v737 = v601
        local v738 = 10
        if v737 >= v738 then
            v738 = v1.GUI.SantaChallenge
            v737 = v738.Challenge
            v738 = false
            v737.Visible = v738
            v738 = v1.GUI.SantaChallenge
            v737 = v738.Confirm
            v738 = true
            v737.Visible = v738
        end
    end)
    v1.GUI.SantaChallenge.Confirm.Confirm.MouseButton1Click:connect(function()
        local v745 = v601
        local v746 = 10
        if v745 >= v746 then
            v746 = v1.GUI.SantaChallenge
            v745 = v746.Confirm
            v746 = false
            v745.Visible = v746
            v746 = v1.GUI.SantaChallenge
            v745 = v746.Completed
            v746 = true
            v745.Visible = v746
            v746 = _G
            v745 = v746.PlayerData
            v746 = "Completed"
            v745.SantasList2019 = v746
            v746 = v8
            v745 = v746.ConfirmSantasChallenge
            v745:FireServer()
        end
    end)
end
v1.GenerateSantasChallenge = v603
v603 = function()
    local v866 = v8
    local v789, v786 = v866.GetChallengeTimer:InvokeServer()
    v509 = v866
    local v792 = v1.GUI.Challenges.Main.Dailies
    local v794, v795, v792 = pairs(v792.Missions:GetChildren())
    for v791, v797 in v794, v795, v792 do
        v797.Icon.Claim.MouseButton1Click:connect(function()
            local v800 = _G
            local v801 = v800.PlayerData
            local v803 = v801.ChallengeProgress2020.Day
            local v814 = v789
            if v803 == v814 then
                v803 = v509
                v814 = 1
                if v814 > v803 then
                    return 
                end
                v814 = v573
                v800 = v797
                v801 = v800.Name
                v803 = v814[v801]
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Claim
                v801 = false
                v814.Visible = v801
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Completed
                v801 = true
                v814.Visible = v801
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Progress
                v801 = false
                v814.Visible = v801
                v800 = _G
                v801 = v800.PlayerData
                v814 = v801.ChallengeProgress2020
                v801 = "Claimed"
                v814[v803] = v801
                v800 = v573
                v801 = v800[v797.Name]
                v814 = 2
                v814 = 1
                v800 = _G
                v801 = v800.PlayerData
                local v806 = _G
                local v815 = v806.PlayerData
                v800 = v815.SkellyBones2020 + v814
                v801.SkellyBones2020 = v800
                local v817 = _G
                v800 = v817.PlayerData
                v801 = v800.SkellyBones2020
                v800 = 4
                if v801 >= v800 then
                    v817 = _G
                    v800 = v817.PlayerData
                    v801 = v800.Halloween2020
                    v806 = _G.PlayerData
                    v815 = v806.Halloween2020
                    v817 = v815.CurrentTier
                    v800 = v817 + 1
                    v801.CurrentTier = v800
                    v800 = v1
                    v801 = v800.GenerateTiers
                    v817 = v1
                    v800 = v817.NewPassTierRewardObject
                    v815 = v1
                    v817 = v815.NewPassPageObject
                    v806 = v1
                    v815 = v806.PassTierRewardObjectFunction
                    v806 = true
                    v801(v800, v817, v815, v806)
                end
                local v808 = _G
                local v810 = v808.PlayerData.SkellyBones2020
                local v818 = 4
                if v810 > v818 then
                    v818 = _G
                    v810 = v818.PlayerData
                    v808 = _G.PlayerData.SkellyBones2020
                    v818 = v808 - 4
                    v810.SkellyBones2020 = v818
                end
                v1.UpdateChallenges()
                v8.ClaimChallenge:FireServer(v803)
                return 
            end
        end)
    end
    v798 = v1
    v797 = v798.GUI.Challenges
    v792 = v797.Main.Dailies
    v795 = v792.Timer
    v794 = v795.MainTimer
    local v870 = v509
    v797 = "%02i:%02i:%02i"
    v798 = v870 / 60 % 60
    v795 = string.format(v797, v870 / 3600, v798, v870 % 60)
    v794.Text = v795
    v794 = spawn
    v795 = function()
        while true do
            local v828 = wait(1)
            if not v828 then
                break
            end
            v828 = v509 - 1
            v509 = v828
            local v844 = v509
            local v836 = string.format("%02i:%02i:%02i", v844 / 3600, v844 / 60 % 60, v844 % 60)
            v1.GUI.Challenges.Main.Dailies.Timer.MainTimer.Text = v836
            local v851 = v509
            local v852 = 1
            if v852 >= v851 then
                v836 = v1.GUI.Challenges.Main
                v844 = v836.Dailies
                v852 = v844.Timer
                v851 = v852.MainTimer
                v852 = "Now! Reset"
                v851.Text = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission1
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission2
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission3
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
            end
        end
    end
    v794(v795)
end
v1.ConnectChallengeClaims = v603
return v1
