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
