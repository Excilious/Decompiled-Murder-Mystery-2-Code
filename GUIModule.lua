local v1 = {}
local v4 = game:GetService("TweenService")
local v11 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false)
local v18 = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)
local function PlayTweens_1(p1)
    local v23, v24, v25 = pairs(p1)
    for v28, v27 in v23, v24, v25 do
        v27:Play()
    end
end
local v29 = {}
local v30 = 0
v29.In = v30
v30 = 1
v29.Out = v30
v30 = {}
v30.In = false
v30.Out = true
v1.PlayCameraFade = function(p2)
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, v30[p2])
    local v41 = {}
    local v43 = {}
    v43.BackgroundTransparency = v29[p2]
    v41[1] = v4:Create(game.Players.LocalPlayer.PlayerGui:WaitForChild("CameraFade").Fade, v11, v43)
    v46 = pairs
    v47 = v41
    local v50, v51, v48 = v46(v47)
    for v49, v52 in v50, v51, v48 do
        v52:Play()
    end
end
local function PlayDeathFade_1(p3)
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, v30[p3])
    local v68 = {}
    local v70 = {}
    v70.BackgroundTransparency = v29[p3]
    v68[1] = v4:Create(game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpawnFade").Fade, v11, v70)
    v73 = pairs
    v74 = v68
    local v77, v78, v75 = v73(v74)
    for v76, v79 in v77, v78, v75 do
        v79:Play()
    end
end
local function v85()
    local v102 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpawnFade").Fade
    v102.BackgroundTransparency = 0
    v102.BackgroundColor3 = Color3.new(1, 1, 1)
    wait(0.1)
    v102.BackgroundColor3 = Color3.new(0, 0, 0)
end
v1.DeathFlash = v85
v85 = function(p4, p5)
    if not p5 then
        v1.PlayCameraFade("In")
        wait(0.3)
    end
    game.Workspace.CurrentCamera.CameraSubject = p4.Character.Humanoid
    v1.PlayCameraFade("Out")
    PlayDeathFade_1("Out")
    wait(0.4)
end
v1.FadeToWinner = v85
v85 = function()
    wait(0.5)
    local v144 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpawnFade").Fade
    v144.BackgroundTransparency = 0
    v144.BackgroundColor3 = Color3.new(0, 0, 0)
    PlayDeathFade_1("Out")
    v1.PlayCameraFade("Out")
    game.Workspace.CurrentCamera.CameraType = "Custom"
    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end
v1.SpawnFade = v85
v85 = function()
    local v158 = game.Players.LocalPlayer.Character
    v158 = game.Workspace.CurrentCamera
    v158.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    v1.PlayCameraFade("Out")
end
v1.CameraFadeToLocalPlayer = v85
return v1
