local v3 = game:GetService("TweenService")
_G.LastRound = -1
_G.PlayerIcons = {}
local function UpdateIcons_1()
    local v8 = game
    local v10, v11, v8 = pairs(v8.Players:GetPlayers())
    for v29, v14 in v10, v11, v8 do
        local v15 = _G.PlayerIcons[v14.Name]
        v15 = spawn
        v15(function()
            _G.PlayerIcons[v14.Name] = game.Players:GetUserThumbnailAsync(math.abs(v14.userId), Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size352x352)
        end)
    end
end
UpdateIcons_1()
game.Players.PlayerAdded:connect(UpdateIcons_1)
game.Players.PlayerRemoving:connect(UpdateIcons_1)
local v43 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v51 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local v54 = game.ReplicatedStorage
local v57 = require(v54.Modules.FadeModule)
local function PlayTweens_1(p1)
    local v62, v63, v64 = pairs(p1)
    for v67, v66 in v62, v63, v64 do
        v66:Play()
    end
end
local function PlayVictoryScreen_1(p2)
    local v71 = script.Victory:Clone()
    if v71:FindFirstChild(p2 .. "Victory") then
        local v77 = v71:FindFirstChild(p2)
    end
    v77.Visible = true
    v71.Parent = game.Players.LocalPlayer.PlayerGui
    wait(0.05)
    local v80 = {}
    local v83 = {}
    v83.Size = UDim2.new(1, 0, 1, 0)
    local v140 = {}
    v140.Position = UDim2.new(0.975, 0, 0.5, 0)
    v140.Rotation = 0
    local v142 = {}
    v142.Position = UDim2.new(0.025, 0, 0.5, 0)
    v142.Rotation = 0
    v80[1] = v3:Create(v77.Container, v43, v83)
    v80[2] = v3:Create(v77.KnifeRight, v43, v140)
    v80[3] = v3:Create(v77.KnifeLeft, v43, v142)
    local v111, v112, v109 = pairs(v80)
    for v110, v114 in v111, v112, v109 do
        v114:Play()
    end
    v111 = 8
    wait(v111)
    local v115 = {}
    v109 = v77
    v110 = v43
    v114 = {}
    v114.Position = UDim2.new(0.5, 0, 0, -v77.Container.AbsoluteSize.Y * 2 - 10)
    v115[2] = v112
    v115[2] = v3:Create(v109, v110, v114)
    v127 = pairs
    v112 = v115
    local v130, v131, v128 = v127(v112)
    for v129, v132 in v130, v131, v128 do
        v132:Play()
    end
end
v54 = {}
local v289 = {}
local v148 = true
v289.Time = v148
v148 = true
v289.MurdererDied = v148
v148 = true
v289.MurdererLeft = v148
v148 = true
v289.InnocentsEscaped = v148
v54.Innocent = v289
local v290 = {}
v148 = true
v290.Time = v148
v148 = true
v290.MurdererDied = v148
v148 = true
v290.MurdererLeft = v148
v54.Hero = v290
local v291 = {}
v148 = true
v291.MurdererDied = v148
v148 = true
v291.MurdererLeft = v148
v148 = true
v291.SheriffWin = v148
v54.Sheriff = v291
local v292 = {}
v148 = true
v292.MurdererWin = v148
v54.Murderer = v292
local v293 = {}
v148 = true
v293.ZombiesWin = v148
v54.Zombie = v293
local v294 = {}
v148 = true
v294.SurvivorsWin = v148
v148 = true
v294.Time = v148
v54.Survivor = v294
local function PlayFade_1()
    local v152 = script.DeathFade:Clone()
    v152.Parent = game.Players.LocalPlayer.PlayerGui
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
    local v157 = {}
    local v160 = {}
    v160.BackgroundTransparency = 0
    v157[1] = v3:Create(v152.Fade, v51, v160)
    v162 = pairs
    v163 = v157
    local v165, v166, v164 = v162(v163)
    for v168, v167 in v165, v166, v164 do
        v167:Play()
    end
end
v148 = true
local v176 = game.PlaceId
local v295 = -v3
v176 = game.PlaceId
v148 = false
v148 = true
local function PlayEndMusic_1(p3)
    local v178 = p3.Character
    v178 = p3.Character
    local v180 = v178:FindFirstChild("Radio")
    if not v180 then
        local v181 = p3.Character
        v180 = v181.Radio
        local v183 = v180:FindFirstChild("Sound")
        if not v183 then
            v181 = p3.Character.Radio.Sound
            v183 = v181.IsPlaying
            return 
        end
    end
    local v186 = game
    v184 = v186.Players
    v185 = v184.LocalPlayer
    v181 = v185.PlayerGui
    v183 = v181.MainGUI
    v181 = v148
    if not v181 then
        v186 = game.Players
        v184 = v186.LocalPlayer
        v185 = v184.PlayerGui
        v181 = v185.ScaryMode
        v183 = v181.Music
    end
    v181 = {}
    v185 = "http://www.roblox.com/asset/?id=320394794"
    v184 = "http://www.roblox.com/asset/?id=320396686"
    local v208 = "http://www.roblox.com/asset/?id=320397765"
    v187 = "http://www.roblox.com/asset/?id=320403652"
    v181[1] = v185
    v181[2] = v184
    v181[3] = v208
    v181[4] = v187
    v185 = v148
    if not v185 then
        v185 = {}
        v184 = "rbxassetid://1836013831"
        v208 = "rbxassetid://1838605064"
        v187 = "rbxassetid://1841274964"
        v185[1] = v184
        v185[2] = v208
        v185[3] = v187
        v181 = v185
        v184 = _G
        v185 = v184.HalloweenMusic
        v184 = "Murderer"
        v208 = "Stop"
        v185(v184, v208)
        _G.HalloweenMusic("Escape", "Stop")
        _G.HalloweenMusic("Lobby", "Stop")
    end
    local v197 = Instance.new("Sound", v183)
    v187 = 1
    v197.SoundId = v181[math.random(v187, #v181)]
    v197.Volume = 0.4
    v197.Looped = false
    v197.PlayOnRemove = false
    Instance.new("NumberValue", v197).Value = v197.Volume
    v197:Play()
    game.Debris:AddItem(v197)
end
game.ReplicatedStorage.Remotes.Gameplay.VictoryScreen.OnClientEvent:connect(function(p4, p5, p6, p7)
    print(p4, p5, p6, p7)
    wait(0.5)
    local v229 = game
    PlayEndMusic_1(v229.Players.LocalPlayer)
    PlayVictoryScreen_1(p7)
    return 
    local v254 = v54
    local v234 = v254[p5]
    local v235 = v234[p6]
    if not v235 then
        if not p4 then
            v235 = wait
            v234 = 0.5
            v235(v234)
            v229 = game
            v254 = v229.Players
            PlayEndMusic_1(v254.LocalPlayer)
            PlayVictoryScreen_1(p5)
            return 
        end
    end
    if not p7 then
        v229 = game.Players
        v254 = v229.LocalPlayer
        local v241 = v254.Character
        local v242 = false
        v242 = true
        v254 = v57
        v241 = v254.FadeToWinner
        v254 = p7
        v229 = v242
        v241(v254, v229)
        PlayEndMusic_1(p7)
        return 
    end
    if not p4 then
        v242 = print
        v242("Times Up!")
        wait(0.5)
        local v249 = v148
        if not v249 then
            local v250 = "InnocentsEscaped"
        else
            v250 = "TimesUp"
        end
        PlayVictoryScreen_1(v250)
        v249 = game.Players
        PlayEndMusic_1(v249.LocalPlayer)
    end
end)
local v302 = game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade
v302.OnClientEvent:connect(function(p8)
    v57.PlayCameraFade("In")
    if p8 then
        wait(0.4)
        v57.CameraFadeToLocalPlayer("Out")
        _G.ShowResults()
    end
end)
while true do
    wait()
    v302 = _G
    local v268 = v302.Database
end
v268 = require
local v270 = v268(game.ReplicatedStorage.Modules.ScoreboardModule)
_G.ShowResults = function(p9)
    local v272 = game
    local v277 = v272.ReplicatedStorage.Remotes.Gameplay.GetLastRoundRewards:InvokeServer()
    return 
    local v279 = v277.RoundCount
    local v280 = _G
    local v281 = v280.LastRound
    if v279 ~= v281 then
        v272 = game.Players
        v280 = v272.LocalPlayer
        v281 = v280.PlayerGui
        v279 = v281.Scoreboard
        v280 = v270
        v281 = v280.DisplayScoreboard
        v280 = v277
        v281(v280)
    end
end
