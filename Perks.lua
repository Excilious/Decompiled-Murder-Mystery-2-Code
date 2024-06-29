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
