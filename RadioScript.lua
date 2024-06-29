local v2 = script.Parent
v2 = v2.Game.Settings.Mute
local v75 = _G.Mute
_G.Mute = false
local function RadioMute_1()
    local v7 = game
    local v9, v10, v7 = pairs(v7.Workspace:GetChildren())
    for v20, v13 in v9, v10, v7 do
        local v14 = v13:FindFirstChild("Radio")
        if not v14 then
            v14 = v13.Radio
            local v16 = v14:FindFirstChild("Sound")
            if not v16 then
                v16 = v13.Radio.Sound
                local v19 = _G.Mute
                local v21 = 0
                v16.Volume = 0.5
            end
        end
    end
end
game.ReplicatedStorage.PlaySong.OnClientEvent:connect(function(p1, p2, p3)
    local v26 = p1.SoundId
    if v26 == p2 then
        v26 = p1.IsPlaying
        if not v26 then
            p1:Stop()
            return 
        end
    end
    p1:Stop()
    p1.SoundId = p2
    p1:Play()
    RadioMute_1()
end)
script.Parent.ChildAdded:connect(function(p4)
    wait()
    local v35 = p4:IsA("Sound")
    if not v35 then
        v35 = _G.Mute
        v35 = 0
        p4.Volume = v35
    end
end)
local v37 = _G.Mute
v37 = v2.Icon
v37.Image = "http://www.roblox.com/asset/?id=4662727525"
v2.Icon.Image = "http://www.roblox.com/asset/?id=4662727331"
RadioMute_1()
v2.MouseButton1Click:connect(function()
    local v41 = _G.Mute
    v41 = v2.Icon
    v41.Image = "http://www.roblox.com/asset/?id=4662727525"
    _G.Mute = true
    _G.Mute = false
    v2.Icon.Image = "http://www.roblox.com/asset/?id=4662727331"
    local v42 = script
    local v43, v44, v42 = pairs(v42.Parent:GetChildren())
    for v50, v47 in v43, v44, v42 do
        local v48 = v47:IsA("Sound")
        if not v48 then
            v48 = _G.Mute
            if not v48 then
                v47:Stop()
            end
        end
    end
    v43 = RadioMute_1
    v43()
    v44 = _G
    local v51 = v44.HalloweenMute
    if not v51 then
        v44 = _G
        v51 = v44.HalloweenMute
        v51()
    end
end)
wait(0.1)
local v65 = script
local v67, v68, v65 = pairs(v65.Parent:GetChildren())
for v23, v71 in v67, v68, v65 do
    local v72 = v71:IsA("Sound")
    if not v72 then
        v72 = _G.Mute
        if not v72 then
            v71:Stop()
        end
    end
end
