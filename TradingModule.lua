local v1 = {}
local v4 = game.ReplicatedStorage.Trade
local v5 = script
local v7 = require(v5.Parent.InventoryModule)
v5 = game.ReplicatedStorage.Modules
local v11 = require(v5.ItemModule)
v1.GUI = {}
v1.RequestsEnabled = true
v1.TradeInventory = nil
v5 = function()
end
_G.NewTradeRequest = v5
v1.SendTradeRequest = function(p1)
    local v13 = v4
    local v15 = game
    local v16 = v15.Players
    if v13.SendRequest:InvokeServer(v16[p1]) then
        v13 = v1.UpdateTradeRequestWindow
        v16 = {}
        v15 = {}
        v15.Name = p1
        v16.Receiver = v15
        v13("SendingRequest", v16)
    end
end
v1.UpdateTradeRequestWindow = function(p2, p3)
    local v23 = v1.GUI.RequestFrame
    local v24, v25, v26 = pairs(v23:GetChildren())
    for v30, v28 in v24, v25, v26 do
        if v28.Name ~= p2 then
            local v29 = false
        end
        v29 = true
        v28.Visible = v29
    end
    v24 = true
    v23.Visible = v24
    v25 = _G
    v24 = v25.NewTradeRequest
    v25 = false
    v24(v25)
    local v32 = v23.SendingRequest.Username
    v26 = p3.Receiver
    local v35 = v26.Name
    v32.Text = v35
    return 
    if not p2 then
        v35 = v23.ReceivingRequest
        v32 = v35.Username
        v26 = p3.Sender
        v35 = v26.Name
        v32.Text = v35
        v35 = _G
        v32 = v35.NewTradeRequest
        v35 = true
        v32(v35)
        return 
        v23.Visible = false
        return 
    end
end
v1.ConnectRequestWindow = function()
    v1.GUI.RequestFrame.SendingRequest.Cancel.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.CancelRequest:FireServer()
    end)
    v1.GUI.RequestFrame.ReceivingRequest.Accept.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.AcceptRequest:FireServer()
        _G.NewTradeRequest(false)
    end)
    v1.GUI.RequestFrame.ReceivingRequest.Decline.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.DeclineRequest:FireServer()
        _G.NewTradeRequest(false)
    end)
end
v5 = v4.DeclineRequest
v5.OnClientEvent:connect(function()
    v1.UpdateTradeRequestWindow()
    _G.NewTradeRequest(false)
end)
v5 = v4.CancelRequest
v5.OnClientEvent:Connect(function()
    v1.UpdateTradeRequestWindow()
end)
v5 = v4.SendRequest
v5.OnClientInvoke = function(p4)
    local v92 = v1
    local v93 = v92.RequestsEnabled
    if not v93 then
        v92 = v1
        v93 = v92.UpdateTradeRequestWindow
        v92 = "ReceivingRequest"
        local v94 = {}
        local v95 = {}
        v95.Name = p4.Name
        v94.Sender = v95
        v93(v92, v94)
    end
    return v1.RequestsEnabled
end
local function GetTradePlayers_1(p5)
    local v101 = p5.Player1.Player
    local v106 = game.Players.LocalPlayer
    if v101 == v106 then
        v101 = "Player1"
        v106 = "Player2"
        return v101, v106
    end
    local v105 = p5.Player2.Player
    local v109 = game.Players.LocalPlayer
    if v105 == v109 then
        v105 = "Player2"
        v109 = "Player1"
        return v105, v109
    end
end
v5 = {}
local function ClearOfferFrame_1(p6)
    local v114, v115, v116 = pairs(p6:GetChildren())
    for v122, v119 in v114, v115, v116 do
        local v120 = v119:IsA("Frame")
        if not v120 then
            v120 = false
            v119.Visible = v120
            local v121 = v5
            v120 = v121[v119]
            if not v120 then
                v121 = v5
                v120 = v121[v119]
                v120:disconnect()
            end
        end
    end
end
local function DisplayOffer_1(p7, p8)
    local v126, v127, v128 = pairs(p8)
    for v142, v130 in v126, v127, v128 do
        local v132 = v130[3]
        local v133 = {}
        local v136 = _G.Database
        local v137 = v136[v132]
        local v139, v140, v141 = pairs(v137[v130[1]])
        for v137, v136 in v139, v140, v141 do
            v133[v137] = v136
        end
        v133.DataType = v132
        v133.Amount = v130[2]
        v140 = p7.Container
        v141 = "NewItem" .. v142
        v139 = v140[v141]
        v141 = v11
        v140 = v141.DisplayItem
        v141 = v139
        v140(v141, v133)
        local v143 = v5
        local v144 = v143[v139]
        if not v144 then
            v143 = v5
            v144 = v143[v139]
            v144:disconnect()
        end
        v5[v139] = v139.Container.ActionButton.MouseButton1Click:connect(function()
            v4.RemoveOffer:FireServer(v130[1], v130[3])
        end)
        v139.Visible = true
    end
end
local v161 = "Accept"
local function v162(p9)
    local v164 = p9.Player1.Player
    local v165 = game
    local v166 = v165.Players
    local v184 = v166.LocalPlayer
    if v164 == v184 then
        local v167 = "Player1"
        local v168 = "Player2"
    else
        v184 = p9.Player2
        v164 = v184.Player
        v165 = game
        v166 = v165.Players
        v184 = v166.LocalPlayer
        if v164 == v184 then
            v167 = "Player2"
            v168 = "Player1"
        else
            v167 = nil
            v168 = nil
        end
    end
    v184 = p9[v167]
    v164 = v184.Offer
    local v186 = p9[v168].Offer
    ClearOfferFrame_1(v1.GUI.YourOffer.Container)
    ClearOfferFrame_1(v1.GUI.TheirOffer.Container)
    DisplayOffer_1(v1.GUI.YourOffer, v164)
    DisplayOffer_1(v1.GUI.TheirOffer, v186)
    v161 = "Accept"
    v1.GUI.YourOffer.Accepted.Visible = false
    v1.GUI.TheirOffer.Accepted.Visible = false
    v1.GUI.Actions.Accept.Confirm.Visible = false
    v1.GUI.Actions.Accept.Cancel.Visible = false
    local v222 = false
    local v223 = #v164
    local v224 = 1
    if v224 > v223 then
        v223 = #v186
        v224 = 1
        if v223 <= v224 then
            v222 = false
        end
        v222 = true
    end
    v1.GUI.Actions.Accept.AddItem.Visible = v222
    v1.UpdateTradeInventory(p9)
    local v228 = false
    v223 = #v164
    v224 = 1
    if v224 > v223 then
        v223 = #v186
        v224 = 1
        if v223 <= v224 then
            v228 = false
        end
        v228 = true
    end
    v1.ResetCooldown(v228)
end
v1.UpdateTrade = v162
v162 = v4.UpdateTrade.OnClientEvent
v162:connect(v1.UpdateTrade)
local v231
local v232 = v4.StartTrade
v232.OnClientEvent:connect(function(p10, p11)
    local v235 = {}
    local v237 = "Pets"
    v235[1] = "Weapons"
    v235[2] = v237
    local v238, v239, v240 = pairs(v235)
    for v236, v237 in v238, v239, v240 do
        local v244 = v7.CreateBlankTradeInventoryTable()
        local v246, v247, v248 = pairs(v244[v237])
        for v244, v242 in v246, v247, v248 do
            v1.GUI.TradeGUI.Container.Items.Main:FindFirstChild(v237).Items.Container:FindFirstChild(v244).Container:ClearAllChildren()
        end
    end
    v238 = v1
    v240 = v7
    v239 = v240.GenerateInventory
    v247 = v1
    v246 = v247.GUI
    v240 = v246.TradeGUI.Container.Items
    v248 = v1
    v247 = v248.GUI
    v246 = v247.ItemsLayout
    v238.TradeInventory = v239(v240, _G.PlayerData, "Trading", v246)
    v238 = v1.ConnectOfferButtons
    v238(v1.TradeInventory)
    v1.UpdateTrade(p10)
    v1.GUI.TheirOffer.Username.Text = "(" .. p11 .. ")"
    v1.GUI.TradeGUI.Enabled = true
    v1.GUI.RequestFrame.Visible = false
    local v340 = v231
    if not v340 then
        v340 = v231
        v340:disconnect()
    end
    v244 = v1
    v248 = v244.GUI
    v247 = v248.TradeGUI
    local v268 = v247.Container.Items.Tabs.Search.Container.SearchText
    v231 = (v268:GetPropertyChangedSignal("Text")):connect(function()
        local v272 = v268.Text
        local v308 = string.gsub(v272, "S", "")
        local v277 = v1
        local v280, v281, v282 = pairs(v277.TradeInventory.Data)
        for v278, v277 in v280, v281, v282 do
            local v285, v286, v287 = pairs(v277.Current)
            for v306, v289 in v285, v286, v287 do
                v289.Frame.Visible = string.find(string.lower(v289.Name), string.lower(v272))
                local v310 = v289.Frame.Parent
                local v298 = v310.Parent:IsA("ScrollingFrame")
                if not v298 then
                    v310 = v289.Frame.Parent
                    v298 = v310.Parent
                    v310 = Vector2.new
                    v298.CanvasPosition = v310(0, 0)
                else
                    v301 = v289.Frame.Parent.Parent.Parent
                    v298 = v301.Parent
                    v301 = Vector2.new
                    v298.CanvasPosition = v301(0, 0)
                end
            end
        end
    end)
end)
local function v346(p12)
    local v348 = p12.Player1.Player
    local v349 = game
    local v350 = v349.Players
    local v384 = v350.LocalPlayer
    if v348 == v384 then
        local v351 = "Player1"
        local v352 = "Player2"
    else
        v384 = p12.Player2
        v348 = v384.Player
        v349 = game
        v350 = v349.Players
        v384 = v350.LocalPlayer
        if v348 == v384 then
            v351 = "Player2"
            v352 = "Player1"
        else
            v351 = nil
            v352 = nil
        end
    end
    v384 = p12[v351]
    v348 = v384.Offer
    local v386 = p12[v352].Offer
    local v353 = v1
    local v354 = v353.TradeInventory
    local v355, v356, v357 = pairs(v354.Data)
    for v354, v353 in v355, v356, v357 do
        local v360, v361, v362 = pairs(v353)
        for v383, v365 in v360, v361, v362 do
            local v366, v367, v368 = pairs(v365)
            for v381, v370 in v366, v367, v368 do
                local v369 = v370.Frame
                local v371 = v370.Amount
                local v374, v375, v376 = pairs(v348)
                for v382, v378 in v374, v375, v376 do
                    if v378[1] == v381 then
                        if v378[3] == v354 then
                            v371 = v371 - v378[2]
                        end
                    end
                end
                v375 = v369.Container
                v374 = v375.Amount
                v375 = ""
                v374.Text = v375
                v374 = true
                v369.Visible = v374
                v374 = 1
                if v371 > v374 then
                    v375 = v369.Container
                    v374 = v375.Amount
                    v376 = "x"
                    v382 = v371
                    v375 = v376 .. v382
                    v374.Text = v375
                    v374 = true
                    v369.Visible = v374
                else
                    v374 = 1
                    if v374 > v371 then
                        v374 = false
                        v369.Visible = v374
                    end
                end
            end
        end
    end
    return 
    if not p12 then
    end
end
v1.UpdateTradeInventory = v346
v346 = function(p13)
    local v391, v392, v393 = pairs(p13.Data)
    for u2, v396 in v391, v392, v393 do
        local v397, v398, v399 = pairs(v396)
        for v415, v402 in v397, v398, v399 do
            local v403, v404, v405 = pairs(v402)
            for u1, v407 in v403, v404, v405 do
                local v406 = v407.Frame
                if not v406 then
                    v406.Container.ActionButton.MouseButton1Click:connect(function()
                        v4.OfferItem:FireServer(u1, u2)
                    end)
                end
            end
        end
    end
end
v1.ConnectOfferButtons = v346
v346 = false
v232 = 6
local function v417(p14)
    if not p14 then
        v1.GUI.Actions.Accept.Cooldown.Visible = false
        v232 = 0
        v346 = false
        return 
    end
    v418 = v1
    v419 = v418.GUI
    v420 = v419.Actions
    v421 = v420.Accept
    v422 = v421.Cooldown
    v421 = true
    v422.Visible = v421
    v422 = 6
    v232 = v422
    local v423 = v1
    v418 = v423.GUI
    v419 = v418.Actions
    v420 = v419.Accept
    v421 = v420.Cooldown
    v422 = v421.Title
    v420 = " Please wait ("
    v419 = v232
    v418 = ") before accepting."
    v421 = v420 .. v419 .. v418
    v422.Text = v421
    v422 = v346
    if v422 then
        v418 = v1
        v419 = v418.GUI
        v420 = v419.Actions
        v421 = v420.Accept
        v422 = v421.Cooldown
        v421 = true
        v422.Visible = v421
        v422 = true
        v346 = v422
        while true do
            v422 = wait
            v421 = 1
            v422(v421)
            v232 = v232 - 1
            v423 = v1
            v418 = v423.GUI
            v419 = v418.Actions
            v420 = v419.Accept
            v420 = " Please wait ("
            v419 = v232
            v418 = ") before accepting."
            v420.Cooldown.Title.Text = v420 .. v419 .. v418
            if v232 < 0 then
                break
            end
        end
        v425 = false
        v346 = v425
        v418 = v1
        v419 = v418.GUI
        v420 = v419.Actions
        v424 = v420.Accept
        v425 = v424.Cooldown
        v424 = false
        v425.Visible = v424
        return 
    end
    v425 = 6
    v232 = v425
end
v1.ResetCooldown = v417
v417 = time
local v434 = v417()
local function v435()
    v1.GUI.Actions.Accept.ActionButton.MouseButton1Click:connect(function()
        local v442 = v232
        local v443 = 0
        if v443 >= v442 then
            v442 = v161
            v442 = "Confirm"
            v161 = v442
            v442 = time
            v434 = v442()
            v443 = v1.GUI.Actions.Accept
            v443 = true
            v443.Confirm.Visible = v443
        end
    end)
    v1.GUI.Actions.Accept.Confirm.ActionButton.MouseButton1Click:connect(function()
        local v452 = v232
        local v453 = 0
        if v453 >= v452 then
            v453 = time
            local v455 = v434
            v452 = v453() - v455
            local v458 = 0.4
            if v452 >= v458 then
                v452 = v161
                v452 = "Waiting"
                v161 = v452
                v455 = v1.GUI
                v458 = v455.YourOffer
                v452 = v458.Accepted
                v458 = true
                v452.Visible = v458
                v455 = v1.GUI.Actions
                v458 = v455.Accept
                v452 = v458.Cancel
                v458 = true
                v452.Visible = v458
                v458 = v4
                v452 = v458.AcceptTrade
                v452:FireServer()
            end
        end
    end)
    local v500 = v1
    v500.GUI.Actions.Accept.Cancel.ActionButton.MouseButton1Click:connect(function()
        v4.CancelAccept:FireServer()
    end)
    local v506 = v1
    local v507 = v506.GUI
    local v508 = v507.Actions
    v508.Decline.ActionButton.MouseButton1Click:connect(function()
        v4.DeclineTrade:FireServer()
        v1.GUI.TradeGUI.Enabled = false
        v1.TradeInventory = nil
    end)
    local v511 = v1.GUI
    local v476 = v511.Actions:FindFirstChild("AddItems")
    if not v476 then
        v506 = v1
        v507 = v506.GUI
        v508 = v507.Actions
        v511 = v508.AddItems.ActionButton
        v476 = v511.MouseButton1Click
        v476:connect(function()
            v1.GUI.TradeGUI.Container.Items.Visible = true
        end)
        v500 = v1.GUI.TradeGUI
        v506 = v500.Container
        v507 = v506.Items
        v508 = v507.Tabs
        v511 = v508.Close.ActionButton
        v511.MouseButton1Click:connect(function()
            v1.GUI.TradeGUI.Container.Items.Visible = false
        end)
    end
end
v1.ConnectActions = v435
v435 = v4.AcceptTrade.OnClientEvent
v435:connect(function(p15, p16)
    if not p15 then
        local v517 = v1
        local v519 = v517.GUI.TradeGUI
        local v533 = false
        v519.Enabled = v533
        if not p16 then
            v519 = pairs
            v533 = p16
            local v520, v521, v517 = v519(v533)
            for v532, v523 in v520, v521, v517 do
                _G.NewItem(v523[1], nil, nil, v523[3], v523[2])
            end
            return 
            v532 = v1
            v517 = v532.GUI
            v521 = v517.TheirOffer
            v520 = v521.Accepted
            v521 = true
            v520.Visible = v521
        end
        return 
    end
end)
v4.DeclineTrade.OnClientEvent:connect(function()
    v1.GUI.TradeGUI.Enabled = false
    v1.TradeInventory = nil
end)
v1.ConnectTabButtons = function()
    v7.ConnectTabButtons(nil, nil, v1.GUI.TradeGUI.Container.Items, v1.GUI.TradeGUI.Container.Items.Main)
end
return v1
