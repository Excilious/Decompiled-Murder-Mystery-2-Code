local v1 = {}
local v4 = game.ReplicatedStorage.Christmas2022Events
local v7 = game.ReplicatedStorage.Modules
local v8 = require(v7.GridCreator)
v7 = 0
_G.EventCurrencyGained = v7
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.Currency = nil
EventCurrentTierBuy = 1
v1.BuyTiersFrame = nil
v1.LeaderboardFrames = {}
v1.EventPass = nil
v7 = game.ReplicatedStorage
local v10 = v7.GetSyncData:InvokeServer()
v7 = nil
v1.NewPassTierRewardObject = v7
v7 = nil
v1.NewPassPageObject = v7
v7 = nil
v1.PassTierRewardObjectFunction = v7
v7 = function(p1, p2, p3, p4)
    v10 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v17 = v1
    v8.CreatePass(p3, p1, v1.EventPass, v17.BattlePassFrame.Pass, p2)
    local v42 = _G.PlayerData.Christmas2022.CurrentTier
    local v23 = v1
    local v44 = v23.EventPass.TotalTiers
    if v42 >= v44 then
        v42 = v42 - 1
    end
    v44 = math.floor
    local v24 = v44(v42 / 5)
    if p4 then
        v17 = v1
        local v26 = v17.BattlePassFrame
        v23 = v26.Pass
        local v27, v28, v26 = pairs(v23:GetChildren())
        for v17, v30 in v27, v28, v26 do
            if v30.Name ~= "Page" .. v24 then
                local v34 = false
            end
            v34 = true
            v30.Visible = v34
        end
        v27 = v1
        v27.CurrentPassPage = v24
    end
    v27 = v1
    v28 = 1
    v27.CurrentTierBuy = v28
    v28 = v1
    v27 = v28.ChangeBuyTiers
    v28 = 0
    v27(v28)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v7
v7 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v48 = p6.Traveller
    v48 = p5.Container.Icon
    v48.Image = p6.Image
    p5.Title.TierNumber.Text = "???"
    local v97 = true
    p5.Enter.Visible = v97
    local v54 = _G.PlayerData.Christmas2022.CurrentTier + 1
    if v54 ~= p7 then
        v97 = false
    end
    local v99 = true
    p5.Next.Visible = v99
    v54 = _G.PlayerData.Christmas2022.CurrentTier
    if v54 <= p7 then
        v99 = false
    end
    p5.Locked.Visible = true
    p5.Claim.Visible = false
    v54 = function()
        v1.GUI.BattlePassFrame.Visible = false
        v1.GUI.FinalRewards.Visible = true
        v1.GUI.FinalRewardFrame.Visible = true
    end
    p5.Enter.MouseButton1Click:connect(v54)
    return 
    local v68 = tostring(p7)
    local v113 = v1
    local v114 = v113.EventPass
    local v115 = v114.Rewards
    local v116 = v115[v68]
    local v117 = false
    local v118 = true
    local v119 = p6.ItemID
    if not v119 then
        v115 = v8
        v119 = v115.MakeItemFrame
        v115 = p5
        v114 = p6
        v113 = false
        v119(v115, v114, v113)
        local v71 = v7
        local v72 = v71[p5]
        if v72 then
            v72 = v7
            v71 = p5.Claim.MouseButton1Click
            v72[p5] = v71:connect(function()
                p5.Claim.Visible = false
                local v83 = _G.PlayerData.Christmas2022.ClaimedRewards[v68]
                v1.ClaimReward(v68)
            end)
        end
    end
    v72 = p5.Locked
    v73 = _G.PlayerData.Christmas2022.CurrentTier
    if v73 <= p7 then
        v87 = false
    end
    v87 = true
    v72.Visible = v87
    v72 = p5.Next
    v73 = _G.PlayerData.Christmas2022.CurrentTier + 1
    if v73 ~= p7 then
        v87 = false
    end
    v87 = true
    v72.Visible = v87
    v72 = p5.Claim
    v87 = false
    local v124 = _G.PlayerData
    local v125 = v124.Christmas2022
    v73 = v125.CurrentTier
    if v73 >= p7 then
        v87 = not _G.PlayerData.Christmas2022.ClaimedRewards[v68]
        if not v87 then
            v87 = v118
        end
    end
    v72.Visible = v87
    if not v118 then
        v124 = v1
        v125 = v124.EventPass
        v73 = v125.Rewards
        v87 = v73[v68]
        v72 = v87.Team
        if not v72 then
            v87 = p5[v72]
            v73 = true
            v87.Visible = v73
        end
    end
    v87 = p5.Title
    v72 = v87.TierNumber
    v72.Text = p7
end
v1.ChangePage = function(p8)
end
v1.ChangeBuyTiers = function(p9)
    local v129 = _G.PlayerData.Christmas2022.CurrentTier
    local v141 = v1.EventPass.TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v147 = v1.CurrentTierBuy
    local v148 = 1
    if v148 > v147 then
        v147 = v1
        v148 = 1
        v147.CurrentTierBuy = v148
    end
    local v150 = v1.CurrentTierBuy
    local v151 = v150 + v129
    if v151 > v141 then
        v151 = v1
        v150 = v141 - v129
        v151.CurrentTierBuy = v150
    end
    local v154 = v1.CurrentTierBuy
    local v155 = 1
    if v154 > v155 then
        v150 = "s"
    else
        v150 = ""
    end
    v155 = v1
    v154 = v155.BuyTiersFrame
    v154.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v150)
    local v161 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v163 = v1.CurrentTierBuy
    local v164 = v163 * v1.EventPass.TierCost
    v161.Text = v164
    if v129 >= v141 then
        v163 = v1
        v164 = v163.BuyTiersFrame
        v161 = v164.Parent
        v164 = false
        v161.Visible = v164
        v163 = v1
        v164 = v163.BattlePassFrame
        v161 = v164.PassComplete
        v164 = true
        v161.Visible = v164
    end
end
v1.ClaimReward = function(p10)
    local v167 = tostring(p10)
    local v168 = v1
    local v169 = v168.EventPass
    local v170 = v169.Rewards
    local v171 = v170[v167]
    if not v171 then
        v170 = v171.ItemID
        v169 = print
        v168 = v170
        v169(v168)
        local v172 = _G
        local v175 = v172.PlayerData.Christmas2022.CurrentTier
        local v176 = tonumber(v167)
        if v175 >= v176 then
            v172 = _G.PlayerData
            v176 = v172.Christmas2022.ClaimedRewards
            v175 = v176[v167]
            v172 = _G
            v176 = v172.PlayerData.Christmas2022
            v175 = v176.ClaimedRewards
            v176 = true
            v175[v167] = v176
            v175 = v171.ItemType
            v175 = v171.ItemType
            v175 = v171.ItemType
            v172 = _G.PlayerData
            v176 = v172[v171.ItemType].Owned
            v175 = v176[v170]
            v172 = _G.PlayerData
            local v192 = v171.ItemType
            local v193 = v172[v192]
            v176 = v193.Owned
            if not v175 then
                v172 = v171.Amount
                v193 = v175 + v172
                if v193 then
                    v193 = v171.Amount
                end
                v176[v170] = v193
                v192 = _G
                v172 = v192.PlayerData
                v192 = v171.ItemType
                v193 = v172[v192]
                v176 = v193.Owned
                v193 = v170
                v175 = table.insert
                v175(v176, v193)
                v172 = v1
                v192 = v1
                v172 = v192.PassTierRewardObjectFunction
                v192 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v172.NewPassPageObject, v172, v192)
                v4.ClaimReward:FireServer(v167)
                return 
                return 
            end
        end
    end
end
v1.UpdateGUI = function()
    v1.GUI.PumpkinKeyDisplayBox.Text = "You have " .. v8.Commafy(_G.PlayerData.Materials.Owned[v1.KeyName] or 0) .. " Reaver Keys"
    local v216 = v1.GUI
    local v224 = _G.PlayerData.Materials.Owned[v1.KeyName] or 0
    local v225 = 0
    if v225 <= v224 then
        v216 = false
    end
    v216.PumpkinKeyDisplayBox.Visible = true
    v224 = v1
    local v227 = v224.GUI
    v225 = _G.PlayerData.Materials.Owned[v1.KeyName]
    if 0 <= v225 or 0 then
        v227 = false
    end
    v227.BoxButtonKey.Visible = true
end
v1.TotalCurrency = 0
v1.UpdateTotalCandies = function()
    v1.GUI.TotalCandies.Text = "You have earned " .. v1.TotalCurrency + _G.EventCurrencyGained .. " candies total."
end
local function ConvertTimestamp_1(p11)
    local v252 = math.floor(p11 / 86400)
    local v256 = math.floor(p11 % 86400 / 3600)
    local v257 = "d, "
    local v260 = v252 .. v257 .. v256 .. "h"
    local v262 = 1
    if v262 > v252 then
        v262 = v256
        v257 = "h"
        v260 = v262 .. v257
        v260 = "Less than 2 hours"
    end
    local v263 = 3600
    if v263 >= p11 then
        v260 = "Less than 1 hour!"
    end
    v263 = 0
    if v263 >= p11 then
        v260 = "ENDED!"
    end
    return v260
end
v1.UpdateLeaderboard = function()
    local v264 = v4
    local v266, v264 = v264.GetTopPlayersLeaderboard:InvokeServer()
    local v267 = v1
    local v268 = v267.GUI
    local v269 = v268.LeaderboardTimeLeft
    if not v269 then
        v267 = v1
        v268 = v267.GUI
        v269 = v268.LeaderboardTimeLeft
        v267 = "Time Left: "
        local v272 = math.floor(v264 / 86400)
        local v276 = math.floor(v264 % 86400 / 3600)
        local v277 = "d, "
        local v280 = v272 .. v277 .. v276 .. "h"
        local v330 = 1
        if v330 > v272 then
            v330 = v276
            v277 = "h"
            v280 = v330 .. v277
            v280 = "Less than 2 hours"
        end
        local v331 = 3600
        if v331 >= v264 then
            v280 = "Less than 1 hour!"
        end
        v331 = 0
        if v331 >= v264 then
            v280 = "ENDED!"
        end
        v268 = v267 .. v280
        v269.Text = v268
    end
    v267 = v1
    v268 = v267.GUI
    v268 = v268.LeaderboardTokens.Container
    v267 = 0
    v281 = {}
    v268:ClearAllChildren()
    v276 = pairs
    v280 = v266
    local v325, v326, v273 = v276(v280)
    for v277, v278 in v325, v326, v273 do
        v279 = function(p12, p13)
            local v285 = v1.LeaderboardFrames
            local v286 = "Place"
            local v287 = p12
            local v303 = v286 .. v287
            local v288 = v285[v303]
            if v288 then
                v303 = v1
                v285 = v303.LeaderboardFrames
                v288 = v285.Place
            end
            local v289 = v288:Clone()
            local v304 = 4
            if v304 > p12 then
                v286 = v289.Container
                v304 = v286.PlayerImage
                v287 = game.ReplicatedStorage
                v286 = v287.GetPlayerImage
                v304.Image = v286:Invoke(p13.username)
            end
            v291 = v289.Container
            v291 = "#" .. p12 .. " - " .. p13.username
            v291.Username.Text = v291
            v291 = v289.Container
            v291 = v8.Commafy(p13.candies) .. " Candies"
            v291.TokenCount.Text = v291
            v291 = v289.Container
            local v315 = p13.team
            v291 = false
            v291 = true
            v291.Zombies.Visible = v291
            v291 = v289.Container
            local v317 = p13.team
            v291 = false
            v291 = true
            v291.Survivors.Visible = v291
            v289.Parent = v268
            v291 = 0
            v289.Position = UDim2.new(v291, 0, 0, v267)
            v289.Name = p13.username
            table.insert(v281, v289)
            v267 = v267 + v289.AbsoluteSize.Y
            p12 = p12 + 1
        end
        v279(v278.rank, v278)
    end
end
v1.UpdateFriendsLeaderboard = function()
    local v333 = v4
    local v335, v333 = v333.GetFriendsLeaderboard:InvokeServer()
    v1.TotalCurrency = v333
    local v337 = v1
    v337.UpdateTotalCandies()
    local v338 = v1
    v337 = v338.GUI
    v337 = v337.LeaderboardFriends.Container
    v338 = 0
    local v340 = {}
    v337:ClearAllChildren()
    local v387, v388, v389 = pairs(v335)
    for v392, v394 in v387, v388, v389 do
        (function(p14, p15)
            local v345 = v1.LeaderboardFrames
            local v346 = "Place"
            local v347 = p14
            local v363 = v346 .. v347
            local v348 = v345[v363]
            if v348 then
                v363 = v1
                v345 = v363.LeaderboardFrames
                v348 = v345.Place
            end
            local v349 = v348:Clone()
            local v364 = 4
            if v364 > p14 then
                v346 = v349.Container
                v364 = v346.PlayerImage
                v347 = game.ReplicatedStorage
                v346 = v347.GetPlayerImage
                v364.Image = v346:Invoke(p15.username)
            end
            v351 = v349.Container
            v351 = "#" .. p14 .. " - " .. p15.username
            v351.Username.Text = v351
            v351 = v349.Container
            v351 = v8.Commafy(p15.candies) .. " Candies"
            v351.TokenCount.Text = v351
            v351 = v349.Container
            local v375 = p15.team
            v351 = false
            v351 = true
            v351.Zombies.Visible = v351
            v351 = v349.Container
            local v377 = p15.team
            v351 = false
            v351 = true
            v351.Survivors.Visible = v351
            v349.Parent = v337
            v351 = 0
            v349.Position = UDim2.new(v351, 0, 0, v338)
            v349.Name = p15.username
            table.insert(v340, v349)
            v338 = v338 + v349.AbsoluteSize.Y
            p14 = p14 + 1
        end)(v392, v394)
    end
end
v1.OpenBox = function(p16)
    local v396 = _G
    local v397 = v396.PlayerData
    local v400 = v397.Materials.Owned[p16]
    local v416 = v1
    local v417 = v416.Currency
    if p16 == v417 then
        v400 = 600
    else
        v400 = false
        v416 = v1
        v417 = v416.KeyName
        if p16 == v417 then
            v400 = 1
        end
    end
    if v400 or 0 >= v400 then
        v396 = _G
        v397 = v396.PlayerData
        v416 = v397.Materials
        v417 = v416.Owned
        v396 = _G.PlayerData.Materials.Owned
        v397 = v396[p16]
        v416 = v397 - v400
        v417[p16] = v416
        v397 = v1
        v416 = v397.GUI
        v417 = v416.Main
        v416 = false
        v417.Visible = v416
        v416 = _G
        v417 = v416.Process
        v416 = "Unboxing"
        v417(v416)
        v396 = game.ReplicatedStorage.Remotes
        v397 = v396.Shop
        v396 = "Christmas2022Box"
        local v408 = v397.OpenCrate:InvokeServer(v396, "MysteryBox", p16)
        v397 = wait
        local v409 = 0.75
        local v410 = time()
        local v411 = v410 - time()
        v397(v409 - v411)
        local v413 = _G
        v413.Process()
        if not v408 then
            v410 = game
            v411 = v410.ReplicatedStorage
            v409 = v411.Remotes
            v413 = v409.Shop
            v409 = "Christmas2022Box"
            v411 = v408
            v413.BoxController:Fire(v409, v411)
        end
    end
end
v1.ConnectBox = function(p17)
    v1.GUI.BoxButtonCandies.MouseButton1Click:connect(function()
        v1.OpenBox(v1.Currency)
    end)
    v1.GUI.BoxButtonKey.MouseButton1Click:connect(function()
        v1.OpenBox(v1.KeyName)
    end)
end
local v494 = {}
v494.Login = "Mission1"
v494.Murderer = "Mission2"
v494.Innocent = "Mission3"
local v497 = {}
v497.Login = 0
v497.Murderer = 6
v497.Innocent = 4
local v500 = {}
v500.Mission1 = "Login"
v500.Mission2 = "Murderer"
v500.Mission3 = "Innocent"
local function TimerConvert_1(p18)
    return string.format("%02i:%02i:%02i", p18 / 3600, p18 / 60 % 60, p18 % 60)
end
local function GetBoxFromItem_1(p19)
    local v456, v457, v458 = pairs(v10.MysteryBox)
    for v468, v461 in v456, v457, v458 do
        local v462, v463, v464 = pairs(v461.Contents)
        for v467, v465 in v462, v463, v464 do
            if v465 == p19 then
                return v466
            end
        end
    end
end
return v1
