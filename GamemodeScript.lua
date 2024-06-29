local v1 = script
local v3 = v1.Parent.Game
v1 = v3.Settings
v1 = v3.ChangeGameMode
v1.GameMode.MouseButton1Click:connect(function()
    v1.Visible = not v1.Visible
end)
local v10 = true
local v11 = game
local v12 = v11.PlaceId
v11 = game
v12 = v11.PlaceId
if not v3 then
end
v10 = false
v10 = true
v11 = game.PlaceId
v12 = false
v12 = true
v11 = true
local v14 = game
local v95 = v14.PlaceId
v14 = game
local v96 = v14.PlaceId
v11 = false
v11 = true
local v97 = true
local v15 = game
v14 = v15.PlaceId
local v98 = true
v15 = game
v14 = v15.PlaceId
local v99 = true
v15 = game
v14 = v15.PlaceId
v15 = game
v14 = v15.PlaceId
if not v3 then
end
local v100 = false
local v101 = true
if not v101 then
    v14 = 188331334
else
    v14 = 142823291
end
if not v101 then
    v15 = 333740520
else
    v15 = 335132309
end
if not v101 then
    local v16 = 594100598
else
    v16 = 636649648
end
v1.Casual.Play.MouseButton1Click:connect(function()
    local v20 = v10
    if v20 then
        v20 = v12
        if v20 then
            v20 = v11
            if not v20 then
                v20 = game.ReplicatedStorage.Remotes.Extras.ChangeGameMode
                v20:FireServer("Casual")
                local v34 = {}
                v34.MenuModeSwitch = true
                (game:GetService("TeleportService")):Teleport(v14, game.Players.LocalPlayer, v34)
                v1.Loading.Visible = true
                return 
            end
            v30 = v1
            v24 = false
            v30.Visible = v24
            return 
        end
    end
end)
v1.Hardcore.Play.MouseButton1Click:connect(function()
    local v40 = v10
    if v40 then
        v40 = game.ReplicatedStorage.Remotes.Extras.ChangeGameMode
        v40:FireServer("Hardcore")
        (game:GetService("TeleportService")):Teleport(v15, game.Players.LocalPlayer)
        v1.Loading.Visible = true
        return 
    end
    v50 = v1
    v44 = false
    v50.Visible = v44
end)
local v105 = v1.Assassin.Play
v105.MouseButton1Click:connect(function()
    local v58 = v11
    if v58 then
        v58 = game.ReplicatedStorage.Remotes.Extras.ChangeGameMode
        v58:FireServer("Assassin")
        local v72 = {}
        v72.MenuModeSwitch = true
        (game:GetService("TeleportService")):Teleport(v16, game.Players.LocalPlayer, v72)
        v1.Loading.Visible = true
        return 
    end
    v68 = v1
    v62 = false
    v68.Visible = v62
end)
if not v12 then
    v105 = v1.Minigames.Play
    v105.MouseButton1Click:connect(function()
        local v78 = v12
        if v78 then
            v78 = game.ReplicatedStorage.Remotes.Extras.ChangeGameMode
            v78:FireServer("Minigames")
            local v92 = {}
            v92.MenuModeSwitch = true
            (game:GetService("TeleportService")):Teleport(450611752, game.Players.LocalPlayer, v92)
            return 
        end
        v82 = false
        v1.Visible = v82
    end)
end
