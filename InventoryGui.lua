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
