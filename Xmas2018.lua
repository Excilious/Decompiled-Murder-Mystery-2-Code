local v1 = {}
local v4 = game.ReplicatedStorage
local v7 = require(v4.Modules.GridCreator)
v4 = game
local v8 = v4.ReplicatedStorage.ChristmasEvents2018
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.CurrentTierBuy = 1
v1.BuyTiersFrame = nil
v4 = game.ReplicatedStorage
local v9 = v4.GetSyncData:InvokeServer()
v4 = nil
v1.NewPassTierRewardObject = v4
v4 = nil
v1.NewPassPageObject = v4
v4 = nil
v1.PassTierRewardObjectFunction = v4
v4 = function(p1, p2, p3, p4)
    v9 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v37 = v9.ChristmasPass2018
    v7.CreatePass(p3, p1, v37, v1.BattlePassFrame, p2)
    local v22 = _G.PlayerData
    local v23 = v22.Christmas2018
    v1.YourTier.Text = "Your Tier: " .. v23.CurrentTier
    local v47 = _G.PlayerData.Christmas2018.CurrentTier
    local v48 = v37.TotalTiers
    if v47 >= v48 then
        v47 = v47 - 1
    end
    v48 = math.floor
    local v25 = v48(v47 / 5)
    if p4 then
        v22 = v1
        v23 = v22.BattlePassFrame
        local v27, v28, v22 = pairs(v23:GetChildren())
        for v21, v30 in v27, v28, v22 do
            if v30.Name ~= "Page" .. v25 then
                local v34 = false
            end
            v34 = true
            v30.Visible = v34
        end
        v27 = v1
        v27.CurrentPassPage = v25
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
v1.GenerateTiers = v4
v4 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v54 = tostring(p7)
    local v60 = v9
    local v82 = v60.ChristmasPass2018
    local v83 = v82.Rewards
    local v84 = v83[v54]
    local v85 = false
    local v87 = p6.ItemID
    if not v87 then
        v83 = v7
        v87 = v83.MakeItemFrame
        v83 = p5
        v82 = p6
        v60 = false
        v87(v83, v82, v60)
        local v61 = v4
        local v62 = v61[p5]
        if v62 then
            v62 = v4
            v61 = p5.Claim.MouseButton1Click
            v62[p5] = v61:connect(function()
                p5.Claim.Visible = false
                local v73 = _G.PlayerData.Christmas2018.ClaimedRewards[v54]
                v1.ClaimReward(v54)
            end)
        end
    end
    v62 = p5.Locked
    v63 = _G.PlayerData.Christmas2018.CurrentTier
    if v63 <= p7 then
        v77 = false
    end
    v77 = true
    v62.Visible = v77
    v62 = p5.Next
    v63 = _G.PlayerData.Christmas2018.CurrentTier + 1
    if v63 ~= p7 then
        v77 = false
    end
    v77 = true
    v62.Visible = v77
    v62 = p5.Claim
    v77 = false
    v63 = _G.PlayerData.Christmas2018.CurrentTier
    if v63 >= p7 then
        v77 = not _G.PlayerData.Christmas2018.ClaimedRewards[v54]
        if not v77 then
            v77 = true
        end
    end
    v62.Visible = v77
    v77 = p5.Title
    v62 = v77.TierNumber
    v62.Text = p7
end
v1.ChangePage = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v108 = v1
    local v98, v99, v96 = pairs(v108.BattlePassFrame:GetChildren())
    for v95, v101 in v98, v99, v108 do
        if v101.Name ~= "Page" .. v1.CurrentPassPage then
            local v106 = false
        end
        v106 = true
        v101.Visible = v106
    end
end
v1.ChangeBuyTiers = function(p9)
    local v113 = _G.PlayerData.Christmas2018.CurrentTier
    local v125 = v9.ChristmasPass2018.TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v131 = v1.CurrentTierBuy
    local v132 = 1
    if v132 > v131 then
        v131 = v1
        v132 = 1
        v131.CurrentTierBuy = v132
    end
    local v134 = v1.CurrentTierBuy
    local v135 = v134 + v113
    if v135 > v125 then
        v135 = v1
        v134 = v125 - v113
        v135.CurrentTierBuy = v134
    end
    local v138 = v1.CurrentTierBuy
    local v139 = 1
    if v138 > v139 then
        v134 = "s"
    else
        v134 = ""
    end
    v139 = v1
    v138 = v139.BuyTiersFrame
    v138.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v134)
    local v145 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v146 = v1
    local v147 = v146.CurrentTierBuy
    local v148 = v147 * v9.ChristmasPass2018.TierCost
    v145.Text = v148
    if v113 >= v125 then
        v147 = v1
        v148 = v147.BuyTiersFrame
        v145 = v148.Parent
        v148 = false
        v145.Visible = v148
        v146 = v1
        v147 = v146.BattlePassFrame
        v148 = v147.Parent
        v145 = v148.PassComplete
        v148 = true
        v145.Visible = v148
    end
end
v1.BuyTiers = function()
    local v150 = v1.CurrentTierBuy
    local v179 = _G.PlayerData.Materials.Owned.Logs2018 or 0
    local v180 = v9
    local v183 = v180.ChristmasPass2018.TierCost * v150
    if v183 < v179 then
        v180 = false
    end
    print("Tiers To Buy: " .. v150)
    local v187 = "Current Tier: "
    local v159 = _G
    local v160 = v159.PlayerData
    local v161 = v160.Christmas2018
    local v188 = v161.CurrentTier
    print(v187 .. v188)
    if not true then
        v187 = v150
        v8.BuyTiers:FireServer(v187)
        v188 = _G
        v159 = _G
        v160 = v159.PlayerData
        v161 = v160.Materials
        v188 = v161.Owned
        v188.PlayerData.Materials.Owned.Logs2018 = v188.Logs2018 - v183
        v160 = _G
        v161 = v160.PlayerData
        v188 = v161.Christmas2018
        _G.PlayerData.Christmas2018.CurrentTier = v188.CurrentTier + v150
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v161 = v1
        v188 = v161.CurrentTierBuy
        print("Tiers To Buy: " .. v188)
        v159 = _G
        v160 = v159.PlayerData
        v161 = v160.Christmas2018
        v188 = v161.CurrentTier
        print("Current Tier: " .. v188)
        v1.UpdateCandies()
        v188 = v1
        v161 = v1
        v188 = v161.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v188.NewPassPageObject, v188)
        return true
    end
    return false, v183 - v179
end
v1.ClaimReward = function(p10)
    local v210 = tostring(p10)
    local v211 = v9
    local v212 = v211.ChristmasPass2018
    local v213 = v212.Rewards
    local v214 = v213[v210]
    if not v214 then
        v213 = v214.ItemID
        v212 = print
        v211 = v213
        v212(v211)
        local v215 = _G
        local v218 = v215.PlayerData.Christmas2018.CurrentTier
        local v219 = tonumber(v210)
        if v218 >= v219 then
            v215 = _G.PlayerData
            v219 = v215.Christmas2018.ClaimedRewards
            v218 = v219[v210]
            v215 = _G
            v219 = v215.PlayerData.Christmas2018
            v218 = v219.ClaimedRewards
            v219 = true
            v218[v210] = v219
            v218 = v214.ItemType
            v218 = v214.ItemType
            v218 = v214.ItemType
            v215 = _G.PlayerData
            v219 = v215[v214.ItemType].Owned
            v218 = v219[v213]
            v215 = _G.PlayerData
            local v235 = v214.ItemType
            local v236 = v215[v235]
            v219 = v236.Owned
            if not v218 then
                v215 = v214.Amount
                v236 = v218 + v215
                if v236 then
                    v236 = v214.Amount
                end
                v219[v213] = v236
                v235 = _G
                v215 = v235.PlayerData
                v235 = v214.ItemType
                v236 = v215[v235]
                v219 = v236.Owned
                v236 = v213
                v218 = table.insert
                v218(v219, v236)
                v215 = v1
                v235 = v1
                v215 = v235.PassTierRewardObjectFunction
                v235 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v215.NewPassPageObject, v215, v235)
                v8.ClaimReward:FireServer(v210)
                return 
                return 
            end
        end
    end
end
v1.UpdateCandies = function()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned.Logs2018 or 0)
end
return v1
