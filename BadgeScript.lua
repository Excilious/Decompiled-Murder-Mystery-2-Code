local v1 = script
local v3 = v1.Parent.Game
v1 = game.Players
local v99 = v1.LocalPlayer
v1 = {}
local function GetSyncData_1(p1)
    local v7 = v1[p1]
    v7 = v1
    v7[p1] = game.ReplicatedStorage.GetSyncData:InvokeServer(p1)
    return v1[p1]
end
GetSyncData = GetSyncData_1
GetSyncData_1 = game.ReplicatedStorage.UpdateSyncedData.OnClientEvent
GetSyncData_1:connect(function(p2, p3)
    v1[p2] = p3
end)
local function CreateSlots_1()
    local v21 = 1
    local v25, v26, v27 = pairs(GetSyncData("Badge"))
    for v39, v31 in v25, v26, v27 do
        local v32 = game.MarketplaceService:GetProductInfo(v31)
        local v38 = script.Slot:Clone()
        v38.Name = v39
        v38.Image = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=" .. v31
        v38.Position = UDim2.new(0, 100 * v21 - 1 % 5, 0, 100 * math.floor(v21 - 1 / 5))
        v38.Parent = v3.Badges.Items.Container
        v38.MouseEnter:connect(function()
            v3.Badges.Description.Text = v32.Description
        end)
        v21 = v21 + 1
    end
end
CreateSlots = CreateSlots_1
CreateSlots_1 = CreateSlots
CreateSlots_1()
local function ShowBadges_1(p4)
    local v68 = v3
    local v70 = v68.Badges.Items
    local v72, v73, v70 = pairs(v70.Container:GetChildren())
    for v69, v68 in v72, v73, v70 do
        local v74 = game
        local v82 = v74.MarketplaceService:PlayerOwnsAsset(p4, GetSyncData("Badge")[v68.Name])
        if not v82 then
            v82 = Color3.new
            v74 = 1
            v68.ImageColor3 = v82(v74, 1, 1)
        else
            v85 = Color3.new
            v68.ImageColor3 = v85(0, 0, 0)
        end
    end
    v73 = v3
    v72 = v73.Badges
    v73 = true
    v72.Visible = v73
end
ShowBadges = ShowBadges_1
ShowBadges_1 = v3.Badges.Close.MouseButton1Click
ShowBadges_1:connect(function()
    v3.Badges.Visible = false
end)
v3.PlayerMenu.Badges.MouseButton1Click:connect(function()
    ShowBadges(_G.MenuPlayer)
end)
