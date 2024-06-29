local v2 = time()
local v3
while true do
    wait()
    if game.Players.LocalPlayer.Character then
        break
    end
end
while true do
    v8 = wait
    v8()
    v5 = game
    v6 = v5.Players
    v7 = v6.LocalPlayer
    v6 = "HumanoidRootPart"
    if v7.Character:FindFirstChild(v6) then
        break
    end
end
v5 = game
v7 = v5.Players.LocalPlayer
v10 = v7.PlayerGui
local v12 = v10:WaitForChild("InteractGUI")
v7 = game
v5 = "TweenService"
local v13 = v7:GetService(v5)
local v18 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v19
local v20
local v21 = false
local v24 = game:GetService("UserInputService")
local v27 = game:GetService("CollectionService")
local v33 = UDim2.new(1.2, 0, 1.3, 0)
local function CheckIfMurderer_1()
    local v36 = false
    local v37 = {}
    local v42 = game
    local v60 = v42.Players.LocalPlayer
    v37[1] = game.Players.LocalPlayer.Backpack
    v37[2] = v60.Character
    local v43, v44, v39 = pairs(v37)
    for v38, v42 in v43, v44, v60 do
        local v47, v48, v49 = pairs(v42:GetChildren())
        for v58, v52 in v47, v48, v49 do
            if not v52:IsA("Tool") then
                if not v52:FindFirstChild("Stab") then
                    if not v52:FindFirstChild("KnifeClient") then
                        v36 = true
                    end
                end
            end
        end
    end
    return v36
end
local v68 = game.Players.LocalPlayer.PlayerGui:WaitForChild("TouchInteractButtons")
local v69 = v68:WaitForChild("Phone")
local v72 = v68:WaitForChild("Tablet")
local v73
local v74
game:GetService("RunService").Stepped:connect(function()
    local v83 = time() - v2
    local v192 = 0.1
    if v192 > v83 then
        return 
    end
    v192 = game.Players.LocalPlayer
    v83 = v192.Character
    return 
    v83 = game.Players.LocalPlayer.Character
    v12 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("InteractGUI")
    local v201 = v12
    v19 = nil
    local v203
    v20 = v203
    return 
    local v87 = v24:GetLastInputType()
    local v88 = Enum.UserInputType.Gamepad1
    if v87 ~= v88 then
        v203 = false
    end
    v88 = v24
    local v89 = v88:GetLastInputType()
    local v206 = Enum.UserInputType.Touch
    if v89 ~= v206 then
        v87 = false
    end
    v87 = true
    v206 = v12
    v89 = v206.Gamepad
    v89.Visible = false
    v12.Keyboard.Visible = false
    local v212 = v12.Mobile
    local v213 = false
    v212.Visible = v213
    if not true then
        v213 = v12
        v212 = v213.Gamepad
        if v212 then
            if not v87 then
                v213 = v12
                v212 = v213.Mobile
                if v212 then
                    v213 = v12
                    v212 = v213.Keyboard
                end
                v213 = true
                v212.Visible = v213
                v213 = v212.Use
                local v90 = v212.Cooldown
                local v91 = v68
                v91.Enabled = v87
                if not v87 then
                    v91 = _G.MobileDevice
                    v91 = v68:FindFirstChild(_G.MobileDevice).TouchInteract
                    v73 = v91
                    v91 = v68:FindFirstChild(_G.MobileDevice).TouchInteractKnife
                    v74 = v91
                end
                local v217 = v19
                v93 = {}
                v93.Size = v33
                v93.Enabled = true
                v19 = v13:Create(v12, v18, v93)
                local v104 = {}
                local v109 = UDim2.new(0, 0, 0, 0)
                v104.Size = v109
                v104.Enabled = false
                local v110 = v13:Create(v12, v18, v104)
                v20 = v110
                v97 = pairs
                local v113, v114, v115 = v97(v27:GetTagged("InteractiveBox"))
                for v119, v109 in v113, v114, v115 do
                    table.insert(v110, v109)
                end
                v113 = 1000
                v114 = nil
                v115 = {}
                v119 = pairs
                local v120, v121, v122 = v119({})
                for v133, v124 in v120, v121, v122 do
                    local v123 = v124.Position
                    local v130 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local v225 = 6
                    if v225 >= v123 - v130.magnitude then
                        v123 = v115
                        v130 = v124
                        v225 = table.insert
                        v225(v123, v130)
                    end
                end
                v120 = pairs
                v121 = v115
                local v134, v135, v122 = v120(v121)
                for v133, v124 in v134, v135, v122 do
                    v125 = game
                    v126 = v125.Players
                    v127 = v126.LocalPlayer
                    v128 = v127.Character
                    v129 = v128.HumanoidRootPart
                    v132 = v124.Position - v129.Position.magnitude
                    local v226 = false
                    v129 = "KnifeBox"
                    local v139 = v124:FindFirstChild(v129)
                    v139 = v124.KnifeBox.Value
                    local v228 = false
                    local v229 = true
                    v139 = Ray.new
                    v128 = v83.HumanoidRootPart
                    v125 = v124.CFrame
                    v126 = v125.p
                    local v141 = v83.HumanoidRootPart
                    v125 = v141.CFrame.p
                    v127 = v126 - v125
                    v128 = v127.unit
                    v128 = v139(v128.CFrame.p, v128 * v132)
                    v127 = v83
                    local v232 = {}
                    v125 = "IsDisabled"
                    local v148 = v124:FindFirstChild(v125)
                    if not v148 then
                        local v149 = true
                        v126 = v124.IsDisabled
                        v148 = v126.Value
                    end
                    local v151 = v124:FindFirstChild("IsDisabled")
                    v149 = false
                    v149 = true
                    v232.BoxDisabled = v149
                    local v153 = v124:FindFirstChild("KeyToPickupColor")
                    v153 = CheckIfMurderer_1
                    v149 = not v153()
                    if v149 then
                        local v156 = v124:FindFirstChild("KeyToPickupColor")
                        v149 = false
                        v149 = true
                    end
                    v232.KeyDoorInnocents = v149
                    local v158 = v124:FindFirstChild("PerPlayerUse")
                    v158 = CheckIfMurderer_1
                    v149 = not v158()
                    if v149 then
                        local v161 = v124:FindFirstChild("PerPlayerUse")
                        v149 = false
                        v149 = true
                    end
                    v232.GunSafe = v149
                    local v163 = v124:FindFirstChild("PerPlayerUse")
                    v163 = v124.PerPlayerUse
                    v149 = not v163:FindFirstChild(game.Players.LocalPlayer.Name)
                    if v149 then
                        local v168 = v124:FindFirstChild("PerPlayerUse")
                        v149 = false
                        v149 = true
                    end
                    v232.PerUseUsedAlready = v149
                    v149 = true
                    v168 = CheckIfMurderer_1
                    local v169 = v168()
                    v149 = false
                    v149 = true
                    v232.MurdererOnlyInteract = v149
                    local v171 = v124:FindFirstChild("RequireVision")
                    local v172 = v124:FindFirstChild("RequireVision")
                    v171 = v172.Value
                    v149 = true
                    if game.Workspace:FindPartOnRay(v128, v127) ~= v124 then
                        v149 = true
                        v172 = v124.RequireVision
                        v171 = v172.Value
                        local v174 = v124:FindFirstChild("RequireVision")
                        v149 = false
                        v149 = true
                    end
                    v232.RequiresVision = v149
                    v149 = true
                    v174 = pairs
                    local v175, v176, v177 = v174(v232)
                    for v178, v141 in v175, v176, v177 do
                        if v141 then
                            v149 = false
                        end
                    end
                    if not v149 then
                        v113 = v132
                        v114 = v124
                    end
                end
                if not v114 then
                    v135 = v114.InUse
                    v134 = v135.Value
                    v135 = v12
                    v135.Adornee = v114
                    v3 = v114
                    v133 = "KnifeBox"
                    local v179 = v114:FindFirstChild(v133)
                    if not v179 then
                        v122 = v114.KnifeBox.Value
                        v179 = false
                        v179 = true
                    end
                    if not v179 then
                        v213 = v212.KnifeUse
                        v90 = v212.KnifeCooldown
                    end
                    v122 = pairs
                    local v181, v182, v124 = v122(v212:GetChildren())
                    for v132, v138 in v181, v182, v124 do
                        v143 = false
                        v138.Visible = v143
                    end
                    v124 = "KeyRequired"
                    local v183 = v114:FindFirstChild(v124)
                    if not v183 then
                        v90 = v212.KeyRequired
                        v182 = v183.KeyType.Value
                        v132 = v183.KeyColor
                        v132 = v90.UseText
                        v143 = "Need "
                        v146 = v212:GetChildren()
                        v144 = "!"
                        v138 = v143 .. v146 .. v144
                        v132.Text = v138
                        v132 = false
                        v144 = game
                        v146 = v144.Players
                        v143 = v146.LocalPlayer
                        v138 = v143.Character
                        v146 = v212:GetChildren()
                        local v185 = v138:FindFirstChild(v146)
                        if not v185 then
                            v143 = v185.KeyColor.Value
                            if v143 == v132.Value then
                                v132 = true
                            end
                        end
                        v134 = not v132
                    end
                    v182 = not v134
                    v213.Visible = v182
                    v90.Visible = v134
                    if v87 then
                        if v179 then
                            v132 = "UseName"
                            local v187 = v114:FindFirstChild(v132)
                            if not v187 then
                                v187 = v213.UseText
                                v184 = v114.UseName.Value
                                v187.Text = v184
                            else
                                v187 = v213.UseText
                                v184 = "Activate"
                                v187.Text = v184
                                v187 = v73
                                v187 = v73
                                v184 = not v179
                                v187.Visible = v184
                                v184 = v73
                                v187 = v184.Use
                                v184 = not v134
                                v187.Visible = v184
                                v184 = v73
                                v187 = v184.Cooldown
                                v187.Visible = v134
                                v187 = v74
                                v187.Visible = v179
                            end
                            local v238 = v21
                            v184 = true
                            v12.Enabled = v184
                            v20:Cancel()
                            v19:Play()
                            v134 = nil
                            v3 = v134
                            v134 = v21
                            v134 = v20
                            v134:Play()
                            v19:Cancel()
                            local v191 = v73
                            v191 = v73
                            v179 = false
                            v191.Visible = v179
                            v179 = false
                            v74.Visible = v179
                            v179 = v12
                            v21 = v179.Enabled
                            return 
                        end
                    end
                end
                if not v171 then
                end
                if not v163 then
                end
                if not v158 then
                end
                if not v153 then
                end
                if v113 > v132 then
                end
            end
        end
    end
end)
local v244 = time()
local function PressInteractButton_1(p1, p2, p3)
    local v247 = v24:GetLastInputType()
    local v248 = Enum.UserInputType.Keyboard
    if v247 == v248 then
        v247 = Enum.UserInputState.Begin
        if p2 ~= v247 then
            return 
        end
    end
    v247 = v3
    if not v247 then
        v248 = time
        local v250 = v244
        v247 = v248() - v250
        local v256 = 0.1
        if v247 >= v256 then
            v247 = v3
            v250 = "KnifeBox"
            local v251 = v247:FindFirstChild(v250)
            if not v251 then
                v256 = v3.KnifeBox
                v251 = v256.Value
                return 
            end
            v256 = v3
            v251 = v256.Interact
            v251:FireServer()
            v244 = time()
            v252 = "InteractClient"
            local v255 = v3:FindFirstChild(v252)
            if not v255 then
                v256 = v3
                v255 = v256.InteractClient
                v255:Fire()
            end
        end
    end
end
(game:GetService("ContextActionService")):BindAction("InteractKey", PressInteractButton_1, false, Enum.KeyCode.F)
(game:GetService("ContextActionService")):BindAction("InteractGamepadButton", PressInteractButton_1, false, Enum.KeyCode.ButtonY)
v68.Phone.TouchInteract.MouseButton1Click:connect(PressInteractButton_1)
v68.Tablet.TouchInteract.MouseButton1Click:connect(PressInteractButton_1)
