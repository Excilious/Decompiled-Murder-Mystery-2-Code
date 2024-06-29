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
