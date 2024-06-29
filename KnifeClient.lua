wait(0.5)
local v3 = script
local v4 = v3.Parent
v3 = v4.Handle
local v7 = game.Players.LocalPlayer
local v449 = v7.Character
if v449 then
    v449 = v7.CharacterAdded
    local v8 = v449:wait()
end
local v12 = script
local v14 = require(v12.CheckTapPosition)
v12 = game.ReplicatedStorage.Remotes.Gameplay
local v18 = v12.FakeGun
local v451 = game.ReplicatedStorage
v12 = v451.Remotes.Gameplay.Stealth
local v456 = game:GetService("UserInputService").TouchEnabled
local v457
while true do
    v451 = game.Players.LocalPlayer.PlayerGui
    v457 = v451:FindFirstChild("MainGUI")
    wait()
    if v457 then
        break
    end
end
if not v456 then
    local v27 = v457.Game:FindFirstChild("Knife")
    if not v27 then
        v23 = v457.Game
        v27 = v23.Knife
        v23 = true
        v27.Visible = v23
        v23 = v457.Game
        v27 = v23.Throw
        v23 = true
        v27.Visible = v23
        v23 = v457.Game
        v27 = v23.Gun
        v23 = false
        v27.Visible = v23
    end
end
local v28 = v7:GetMouse()
v23 = 0
local v29 = 0
v21 = false
local v30 = false
local v31 = {}
local v32 = 1
local v33 = 1
local v36 = v4:FindFirstChild("DualEffect")
if not v36 then
    v36 = v4.Animations.Slash
    v36.AnimationId = v4.Animations.Dual.DualSlash.AnimationId
    v36 = v4.Animations.Down
    v36.AnimationId = v4.Animations.Dual.DualStab.AnimationId
end
v37 = pairs
local v87, v88, v39 = v37(v4:GetDescendants())
for v38, v91 in v87, v88, v39 do
    local v92 = v91:IsA("Animation")
    if not v92 then
        v92 = function(p1)
            v31[p1.Name] = {}
            v31[p1.Name].Name = p1.Name
            v31[p1.Name].Track = (v7.Character:WaitForChild("Humanoid")):LoadAnimation(p1)
            v31[p1.Name].Object = p1
            v31[p1.Name].Play = function(p2, p3)
                p2.Track:Play()
            end
            v31[p1.Name].Stop = function(p4, p5)
                p4.Track:Stop()
            end
            v31[p1.Name].Speed = function(p6, p7)
                p6.Track:AdjustSpeed(p7)
            end
            v31[p1.Name].Track.KeyframeReached:connect(function(p8)
                v31[p1.Name]:Stop()
            end)
        end
        v92(v91)
    end
end
v39 = "CustomAnimations"
local v94 = v4:FindFirstChild(v39)
if not v94 then
    v94 = v4.CustomAnimations
    local v96 = v94:FindFirstChild("CustomIdle")
    if not v96 then
        v88 = v4.CustomAnimations
        v96 = v88.CustomIdle
        local v97 = v96:Clone()
        v88 = "Override"
        v97.Name = v88
        v88 = v7.Character.Animate
        v97.Parent = v88
    end
end
v97 = false
local function StabKnife_1()
    local v100 = v30
    if v100 then
        return 
    end
    v100 = v97
    if not v100 then
        return 
    end
    local v103 = v23
    v100 = time() - v103
    local v117 = 1
    if v100 >= v117 then
        v117 = time
        v103 = v29
        v100 = v117() - v103
        local v118 = 2
        if v100 >= v118 then
            v100 = v21
            if v100 then
                v100 = v18
                v103 = false
                v100:FireServer(v103)
                v12:FireServer(false)
                v21 = false
                v118 = v31
                v118.ThrowCharge:Speed(v32)
                v23 = time()
                v118 = math.random
                local v113 = v118(1, 2)
                v113 = v31
                local v120 = v113.Slash
                if v120 then
                    v113 = v31
                    v120 = v113.Down
                end
                v120:Play()
                script.Parent.Stab:FireServer(v120.Name)
            end
        end
    end
end
v91 = script.Parent
v38 = v91.End
v98 = v38.OnClientEvent
v91 = function()
    v97 = true
end
v98:connect(v91)
local v124 = false
local function ThrowKnife_1()
    local v126 = v30
    if v126 then
        return 
    end
    v126 = v8
    local v128 = v126:GetAttribute("Zombie")
    return 
    local v131 = v23
    v128 = time() - v131
    local v173 = 1
    if v128 >= v173 then
        v173 = time
        v131 = v29
        v128 = v173() - v131
        local v174 = 2
        if v128 >= v174 then
            v128 = v18
            v131 = false
            v128:FireServer(v131)
            v12:FireServer(false)
            v124 = true
            v29 = time()
            v174 = v31
            v174.ThrowCharge:Speed(v32)
            v174 = v31
            v174.ThrowCharge:Play()
            v174 = v33
            wait(v174)
            local v178
            local v143
            local v144 = {}
            v144[1] = game.Players.LocalPlayer.Character
            local v149 = game.Workspace.CurrentCamera:ScreenPointToRay(v28.X, v28.Y)
            local v153 = Ray.new(v149.Origin, v149.Direction * 900)
            local v154 = game
            local v157, v154 = v154.Workspace:FindPartOnRayWithIgnoreList(v153, v144)
            local v186 = v157
            v143 = v154
            if not v186 then
                break
            end
            local v159 = v186:IsA("BasePart")
            if not v159 then
                break
            end
            v159 = v186.Transparency
            while true do
                v154 = v144
                v159 = table.insert
                v159(v154, v186)
                local v161 = game
                local v165, v161 = v161.Workspace:FindPartOnRayWithIgnoreList(v153, v144)
                v186 = v165
                v143 = v161
                v165 = v186.Transparency
            end
            v165 = v124
            if not v165 then
                v161 = script.Parent
                v165 = v161.Throw
                v165:FireServer(CFrame.new(v143), v3.Position)
                v161 = v31
                v161.Throw:Play()
            end
            v161 = 1
            wait(v161)
        end
    end
end
local function MobileThrow_1(p9)
    local v210 = v21
    if not v210 then
        v210 = v30
        if not v210 then
            v210 = v18
            v210:FireServer(false)
            v12:FireServer(false)
            v21 = false
            v31.ThrowCharge:Stop()
            v31.ThrowCharge:Speed(v32)
            script.Parent.Throw:FireServer(p9, v3.Position)
            v29 = time() - 1
            wait(0.95)
        end
    end
end
local v231 = 0
if v456 then
    v28.Button1Down:connect(StabKnife_1)
end
v28.Button2Down:connect(function()
    v231 = time()
end)
v28.Button2Up:connect(function()
    local v243 = time() - v231
    if 0.3 >= v243 then
        v243 = ThrowKnife_1
        v243()
    end
end)
v28.KeyDown:connect(function(p10)
    ThrowKnife_1()
end)
local v250 = game:GetService("UserInputService")
v250.InputBegan:connect(function(p11)
    local v253 = p11.KeyCode
    local v254 = Enum.KeyCode.ButtonR2
    if v253 == v254 then
        v253 = v4
        local v256 = v253:FindFirstChild("DisableMelee")
        if v256 then
            v256 = StabKnife_1
            v256()
            return 
        end
    end
    local v257 = p11.KeyCode
    v254 = Enum.KeyCode.ButtonL2
    if v257 == v254 then
        v257 = v4
        local v259 = v257:FindFirstChild("DisableThrowing")
        if v259 then
            v259 = v30
            if not v259 then
                v259 = ThrowKnife_1
                v259()
            end
        end
    end
end)
if not v456 then
    v250 = v457.Game.Throw
    v250.MouseButton1Click:connect(function()
        local v190 = v30
        if v190 then
            return 
        end
        local v193 = v23
        v190 = time() - v193
        local v206 = 1
        if v190 >= v206 then
            v206 = time
            v193 = v29
            v190 = v206() - v193
            local v207 = 2
            if v190 >= v207 then
                v190 = v21
                if v190 then
                    v190 = v18
                    v193 = false
                    v190:FireServer(v193)
                    v12:FireServer(false)
                    v29 = time()
                    v207 = v31
                    v207.ThrowCharge:Speed(v32)
                    v207 = v31
                    v207.ThrowCharge:Play()
                    v207 = v33
                    wait(v207)
                    v31.ThrowCharge:Speed(0)
                    v21 = true
                end
            end
        end
    end)
    game:GetService("UserInputService").TouchTap:connect(function(p12)
        local v266 = v14(p12)
        if not v266 then
            local v271 = game.Workspace.CurrentCamera:ScreenPointToRay(v266.X, v266.Y)
            local v275 = Ray.new(v271.Origin, v271.Direction * 900)
            local v276 = {}
            v276[1] = game.Players.LocalPlayer.Character
            local v313 = game
            local v280, v281, v278 = pairs(v313.Workspace:GetChildren())
            for v277, v285 in v280, v281, v313 do
                local v282 = game
                local v286 = v282.Players:GetPlayerFromCharacter(v285)
                if v286 then
                    v282 = v276
                    v286 = table.insert
                    v286(v282, v285)
                end
            end
            v281 = game
            v280 = v281.Workspace
            v313 = v275
            local v288, v281 = v280:FindPartOnRayWithIgnoreList(v313, v276)
            v285 = v275
            local v291 = game
            local v292 = v291.Players
            local v293 = v292.LocalPlayer
            local v295, v289 = game.Workspace:FindPartOnRay(v285, v293.Character)
            if not v288 then
                local v296 = v288.Parent
                if not v296 then
                    local v297 = v288.Parent
                    v296 = v297.Parent
                    if not v296 then
                        v297 = game
                        v296 = v297.Players
                        v293 = v288.Parent
                        local v298 = v296:GetPlayerFromCharacter(v293)
                        if v298 then
                            v297 = game
                            v298 = v297.Players
                            v292 = v288.Parent
                            local v300 = v298:GetPlayerFromCharacter(v292.Parent)
                        end
                        v297 = nil
                        if not v295 then
                            local v301 = v295.Parent
                            if not v301 then
                                v292 = v295.Parent
                                v301 = v292.Parent
                                if not v301 then
                                    v292 = game
                                    v301 = v292.Players
                                    v291 = v295.Parent
                                    local v302 = v301:GetPlayerFromCharacter(v291)
                                    if v302 then
                                        v292 = game
                                        v302 = v292.Players
                                        local v305 = v302:GetPlayerFromCharacter(v295.Parent.Parent)
                                    end
                                    v297 = v305
                                end
                            end
                        end
                        if not v300 then
                            v305 = v7
                            if v300 ~= v305 then
                                v303 = v300.Character
                                local v306 = v303.UpperTorso
                                v292 = v306.Target
                                v305 = v292.Enabled
                                if not v305 then
                                    v305 = MobileThrow_1
                                    v303 = v300.Character
                                    v306 = v303.HumanoidRootPart
                                    v292 = v306.CFrame
                                    v305(v292)
                                    return 
                                end
                            end
                        end
                        if not v297 then
                            local v307 = v7
                            if v297 ~= v307 then
                                v307 = MobileThrow_1
                                v303 = v297.Character
                                v306 = v303.HumanoidRootPart
                                v307(v306.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end)
    local v317 = game
    v250 = v317.Workspace
    local v318, v319, v317 = pairs(v250:GetChildren())
    for v332, v322 in v318, v319, v317 do
        if not v322:FindFirstChild("Humanoid") then
            local v325 = v322:FindFirstChild("UpperTorso")
            if not v325 then
                v325 = v322.Name
                local v326 = v7.Name
                if v325 ~= v326 then
                    v326 = script
                    v325 = v326.Target
                    v326 = v322.UpperTorso
                    v325:Clone().Parent = v326
                    v326 = v322.UpperTorso.Target
                    v326 = Color3.new
                    v326.Icon.ImageColor3 = v326(0, 1, 0)
                end
            end
        end
    end
    v318 = game
    v317 = "RunService"
    v332 = 1
    v322 = function()
        local v336 = game
        local v338, v339, v336 = pairs(v336.Workspace:GetChildren())
        for v371, v342 in v338, v339, v336 do
            local v343 = v342:FindFirstChild("Humanoid")
            local v345 = v342:FindFirstChild("UpperTorso")
            v345 = v342.UpperTorso
            local v347 = v345:FindFirstChild("Target")
            v347 = v342.Name
            local v349 = v7.Name
            v349 = game
            v347 = v349.Players
            local v350 = v347:GetPlayerFromCharacter(v342)
            v350 = v342.UpperTorso.Target
            v350.Enabled = false
            v342.UpperTorso.Target.AlwaysOnTop = false
            local v378 = v21
            local v379 = game.Workspace
            local v353, v349 = v379.CurrentCamera:WorldToScreenPoint(v342.UpperTorso.Position)
            local v356 = v7.Character.Head.Position
            local v364 = game.Workspace:FindPartOnRay(Ray.new(v356, v342.UpperTorso.Position - v356.unit * 300), v7.Character)
            local v389 = v364.Parent
            local v365 = v364.Parent
            local v390 = v365.Parent
            if v390 == v342 then
                v365 = v342.UpperTorso
                v390 = v365.Target
                v365 = true
                v390.Enabled = v365
                v365 = v342.UpperTorso
                v390 = v365.Target
                v365 = true
                v390.AlwaysOnTop = v365
                v356 = "UpperTorso"
                if not v342:FindFirstChild(v356) then
                    local v370 = (v342:FindFirstChild("UpperTorso")):FindFirstChild("Target")
                    if not v370 then
                        v379 = v342.UpperTorso
                        v370 = v379.Target
                        v370:Destroy()
                    end
                end
            end
        end
        return 
        if not v343 then
            if v362 ~= v342 then
            end
            if not v349 then
            end
            if not v345 then
                if not v350 then
                end
                if not v350 then
                end
                if v347 ~= v349 then
                end
                if not v347 then
                end
            end
        end
    end
    (v318:GetService(v317)):BindToRenderStep("Thrower", v332, v322)
    (game:GetService("RunService")):BindToRenderStep("Stabber", 1, function()
        local v397 = v30
        if not v397 then
            v397 = pairs
            local v398 = game
            local v400, v401, v398 = v397(v398.Workspace:GetChildren())
            for v412, v404 in v400, v401, v398 do
                if not v404:FindFirstChild("Humanoid") then
                    local v407 = v404:FindFirstChild("HumanoidRootPart")
                    if not v407 then
                        v407 = v404.Name
                        local v408 = v7
                        local v409 = v408.Name
                        if v407 ~= v409 then
                            v409 = v404.Humanoid
                            v407 = v409.Health
                            v409 = 0
                            if v407 > v409 then
                                v407 = v7
                                v408 = v404.HumanoidRootPart.Position
                                v409 = 7
                                if v409 >= v407:DistanceFromCharacter(v408) then
                                    v409 = StabKnife_1
                                    v409()
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end
v319 = script
local v414 = v319.HasteTrail:Clone()
v319 = v8.UpperTorso
v414.Parent = v319
v319 = v8.UpperTorso.NeckAttachment
v414.Attachment0 = v319
v319 = v8.UpperTorso.WaistRigAttachment
v414.Attachment1 = v319
v319 = v4.Equipped
v319:connect(function()
    v30 = true
    local v420 = _G.Sleight
    if not v420 then
        v420 = 1.53
        v32 = v420
        v420 = 0.6
        v33 = v420
    end
    local v421 = _G
    local v422 = v421.Haste
    if not v422 then
        v422 = v414
        v421 = true
        v422.Enabled = v421
        v421 = v7.Character
        v422 = v421.Humanoid
        v421 = 18
        v422.WalkSpeed = v421
    end
end)
v4.Unequipped:connect(function()
    local v425 = _G
    local v426 = v425.Haste
    if not v426 then
        v425 = v7.Character
        v426 = v425.Humanoid
        v425 = 16
        v426.WalkSpeed = v425
        v426 = v414
        v425 = false
        v426.Enabled = v425
    end
    v30 = false
    v21 = false
    v31.ThrowCharge:Stop()
    v427 = v32
    v31.ThrowCharge:Speed(v427)
    spawn(function()
        wait(0.1)
        v124 = false
    end)
end)
v331 = game.Players
v327 = v331.LocalPlayer
v331 = "TouchInteractButtons"
v327.PlayerGui:WaitForChild(v331).Phone.TouchInteractKnife.MouseButton1Click:connect(StabKnife_1)
v327 = game.Players.LocalPlayer
v327.PlayerGui:WaitForChild("TouchInteractButtons").Tablet.TouchInteractKnife.MouseButton1Click:connect(StabKnife_1)
print("Knife Loaded!")
