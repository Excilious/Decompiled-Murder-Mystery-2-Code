local v4 = game.ReplicatedStorage.Remotes.Extras
local v6, v4 = v4.GetServerSettings:InvokeServer()
local v312 = game.Players.LocalPlayer:GetAttribute("Radio")
local v11 = workspace.GameSettings:GetAttribute("Disguises")
local v315 = false
v11 = script.Parent.Game
local v319 = v11.Settings.VIPSettings
local v321 = true
if not v321 then
    v321 = not (require(game.ReplicatedFirst:WaitForChild("ChinaPolicyService"))):IsActive()
end
local v19 = true
local v21 = game.PlaceId
v6 = #v6
local v322 = game
v21 = v322.PlaceId
v19 = false
v19 = true
if not v19 then
    v312 = false
end
if not v321 then
    v21 = v11.Settings
    v322 = UDim2.new
    v21.Size = v322(0, 150, 0, 50)
    v21 = v11.Settings.Radio
    v21.Visible = true
else
    v26 = v11.Settings
    v21 = v26.Radio
    v26 = false
    v21.Visible = v26
    v26 = v11.Settings
    v21 = v26.VIPSettings
    v26 = v11.Settings.Radio.Position
    v21.Position = v26
end
local v325 = _G
v28 = _G
v26 = v28.Data1v1
if v26 then
    v26 = {}
    v28 = nil
    v26.Murderer = v28
    v28 = nil
    v26.Sheriff = v28
    v28 = false
    v26.Started = v28
end
v325.Data1v1 = v26
if not v6 then
    v325 = v6["1v1ModeAuto"]
    if not v325 then
        v325 = v11.Show1v1
        v26 = true
        v325.Visible = v26
        v28 = v11.Show1v1
        v26 = v28.GameMode
        v325 = v26.MouseButton1Click
        v28 = function()
            game.Players.LocalPlayer.PlayerGui.CustomGames["Mode1v1-Auto"].Visible = not game.Players.LocalPlayer.PlayerGui.CustomGames["Mode1v1-Auto"].Visible
        end
        v325:Connect(v28)
    end
end
if not v6 then
    if not v4 then
        local v43 = v11.SettingsFrame
        local v44 = v11.SettingsFrame
        v26 = v44["1v1Frame"]
        if not v321 then
            v44 = v11.Settings
            v27 = UDim2.new
            v44.Size = v27(0, 200, 0, 50)
        else
            v44 = v11.Settings
            v49 = UDim2.new
            v44.Size = v49(0, 150, 0, 50)
        end
        v319.Visible = true
        v319.MouseButton1Click:connect(function()
            v43.Visible = not v43.Visible
        end)
        v54 = v43.Close
        v54.MouseButton1Click:connect(function()
            v43.Visible = false
        end)
        local function UpdateSettings_1()
            local v68, v69, v70 = pairs(v43:GetChildren())
            for v77, v73 in v68, v69, v70 do
                local v74 = v73:FindFirstChild("Button")
                if not v74 then
                    v74 = v6[v73.Name]
                    v74 = v73.Button
                    v74.Text = "On"
                    v74 = v73.Button
                    v74.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
                    v74 = v73.Button
                    v74.Text = "Off"
                    v74 = v73.Button
                    v74.Style = Enum.ButtonStyle.RobloxRoundButton
                end
            end
            v68 = v26
            v70 = v6
            v69 = v70["1v1Mode"]
            v68.Visible = v69
        end
        v54 = pairs
        local v83, v84, v85 = v54(v43:GetChildren())
        for v109, v87 in v83, v84, v85 do
            local v88 = v6[v87.Name]
            v88 = v87.Button.MouseButton1Click
            v88:connect(function()
                v6[v87.Name] = not v6[v87.Name]
                local v100 = v87.Name
                local v101 = v6
                local v104 = v101[v87.Name]
                if not v104 then
                    v104 = v6
                    v101 = false
                    v104.Assassin = v101
                    v104 = v6
                    v101 = false
                    v104.LobbyMode = v101
                end
                UpdateSettings_1()
                game.ReplicatedStorage.UpdateServerSettings:FireServer(v6)
            end)
        end
        v83 = UpdateSettings_1
        v83()
        local function Update1v1State_1()
            local v112 = _G
            local v113 = v112.Data1v1
            local v114 = v113.Murderer
            if not v114 then
                v112 = _G
                v113 = v112.Data1v1
                v114 = v113.Sheriff
                if not v114 then
                    v113 = v26
                    v114 = v113.Murderer
                    v113 = false
                    v114.Visible = v113
                    v113 = v26
                    v114 = v113.Sheriff
                    v113 = false
                    v114.Visible = v113
                    v113 = v26
                    v114 = v113.Confirm
                    v113 = true
                    v114.Visible = v113
                else
                    v112 = _G
                    v113 = v112.Data1v1
                    v114 = v113.Murderer
                    if not v114 then
                        v113 = v26
                        v114 = v113.Murderer
                        v113 = false
                        v114.Visible = v113
                        v113 = v26
                        v114 = v113.Sheriff
                        v113 = true
                        v114.Visible = v113
                        v113 = v26
                        v114 = v113.Confirm
                        v113 = false
                        v114.Visible = v113
                    else
                        v113 = v26
                        v114 = v113.Murderer
                        v113 = true
                        v114.Visible = v113
                        v113 = v26
                        v114 = v113.Sheriff
                        v113 = false
                        v114.Visible = v113
                        v113 = v26
                        v114 = v113.Confirm
                        v113 = false
                        v114.Visible = v113
                    end
                end
                v112 = _G
                v113 = v112.Data1v1
                v114 = v113.Started
                if not v114 then
                    v113 = v26
                    v114 = v113.Murderer
                    v113 = false
                    v114.Visible = v113
                    v113 = v26
                    v114 = v113.Sheriff
                    v113 = false
                    v114.Visible = v113
                    v113 = v26
                    v114 = v113.Confirm
                    v113 = false
                    v114.Visible = v113
                    v113 = v26
                    v114 = v113.Started
                    v113 = true
                    v114.Visible = v113
                else
                    v113 = v26
                    v114 = v113.Started
                    v113 = false
                    v114.Visible = v113
                end
                v112 = v26
                v113 = v112.Confirm
                v114 = v113.Murderer
                v112 = _G.Data1v1.Murderer
                v113 = v112 or ""
                v114.Text = v113
                v112 = v26
                v113 = v112.Confirm
                v114 = v113.Sheriff
                v112 = _G.Data1v1.Sheriff
                v113 = v112 or ""
                v114.Text = v113
                v112 = v26
                v113 = v112.Started
                v114 = v113.Murderer
                v112 = _G.Data1v1.Murderer
                v113 = v112 or ""
                v114.Text = v113
                v112 = v26
                v113 = v112.Started
                v114 = v113.Sheriff
                v112 = _G.Data1v1.Sheriff
                v113 = v112 or ""
                v114.Text = v113
                v114 = v26
                v112 = v6
                v113 = v112["1v1Mode"]
                v114.Visible = v113
                return 
            end
        end
        local function Update1v1Players_1()
            local v125 = v26
            local v127 = v125.Murderer.List
            local v129, v130, v127 = pairs(v127.Container:GetChildren())
            for v126, v125 in v129, v130, v127 do
                if not v125:IsA("Frame") then
                    v125:Destroy()
                end
            end
            v129 = pairs
            v127 = game
            v130 = v127.Players
            local v134, v135, v127 = v129(v130:GetPlayers())
            for v126, v125 in v134, v135, v127 do
                local v138 = script.Player1v1Frame:Clone()
                v138.Username.Text = v125.Name
                v138.Select.MouseButton1Click:connect(function()
                    _G.Data1v1.Murderer = v125.Name
                    Update1v1State_1()
                    Update1v1Players_1()
                end)
                v138.Parent = v26.Murderer.List.Container
            end
            v127 = v26
            v135 = v127.Murderer
            v134 = v135.List
            v135 = UDim2.new
            v149 = 46
            v147 = game
            v148 = v147.Players
            v139 = #v148:GetPlayers()
            v138 = v149 * v139
            v134.CanvasSize = v135(0, 0, 0, v138)
            v134 = v26.Sheriff.List
            v149 = 46
            v147 = game
            local v155 = v147.Players:GetPlayers()
            v139 = #v155
            v134.CanvasSize = UDim2.new(0, 0, 0, v149 * v139)
            v134 = pairs
            local v158 = v26
            local v159 = v158.Sheriff
            local v160 = v159.List
            local v161, v162, v160 = v134(v160.Container:GetChildren())
            for v159, v158 in v161, v162, v160 do
                v139 = "Frame"
                if not v158:IsA(v139) then
                    v158:Destroy()
                end
            end
            v161 = pairs
            v160 = game
            v162 = v160.Players
            local v165, v166, v160 = v161(v162:GetPlayers())
            for v159, v158 in v165, v166, v160 do
                local v167 = v158.Name
                v155 = _G
                local v168 = v155.Data1v1
                v149 = v168.Murderer
                if v167 ~= v149 then
                    v149 = script
                    v167 = v149.Player1v1Frame
                    local v169 = v167:Clone()
                    v149 = v169.Username
                    v168 = v158.Name
                    v149.Text = v168
                    v168 = v169.Select
                    v149 = v168.MouseButton1Click
                    v155 = function()
                        _G.Data1v1.Sheriff = v158.Name
                        Update1v1State_1()
                    end
                    v149:connect(v155)
                    v147 = v26
                    v168 = v147.Sheriff.List
                    v169.Parent = v168.Container
                end
            end
            v160 = _G
            v166 = v160.Data1v1
            v165 = v166.Murderer
            if not v165 then
                v166 = game
                v165 = v166.Players
                v158 = _G
                v159 = v158.Data1v1
                v160 = v159.Murderer
                local v177 = v165:FindFirstChild(v160)
                v177 = _G
                v166 = {}
                v166.Murderer = nil
                v166.Sheriff = nil
                v166.Started = false
                v177.Data1v1 = v166
            end
            v178 = _G
            v166 = v178.Data1v1
            v177 = v166.Sheriff
            if not v177 then
                v166 = game
                v177 = v166.Players
                v158 = _G
                v159 = v158.Data1v1
                v178 = v159.Sheriff
                local v179 = v177:FindFirstChild(v178)
                v179 = _G
                v166 = {}
                v166.Murderer = nil
                v166.Sheriff = nil
                v166.Started = false
                v179.Data1v1 = v166
            end
            v179 = Update1v1State_1
            v179()
        end
        v85 = Update1v1Players_1
        v85()
        v87 = v26.Confirm
        v109 = v87.Start
        v87 = function()
            local v198 = _G
            local v199 = v198.Data1v1
            local v200 = v199.Murderer
            if not v200 then
                v199 = game
                v200 = v199.Players
                v198 = _G.Data1v1.Murderer
                local v203 = v200:FindFirstChild(v198)
                v199 = _G
                v203 = v199.Data1v1
                v199 = nil
                v203.Murderer = v199
            else
                local v204 = _G
                v199 = v204.Data1v1
                v203 = v199.Sheriff
                if not v203 then
                    v199 = game
                    v203 = v199.Players
                    v201 = _G
                    v202 = v201.Data1v1
                    v204 = v202.Sheriff
                    local v205 = v203:FindFirstChild(v204)
                    v199 = _G
                    v205 = v199.Data1v1
                    v199 = nil
                    v205.Sheriff = v199
                end
            end
            local v206 = _G
            local v209 = v206.Data1v1
            v205 = v209.Murderer
            if not v205 then
                v206 = _G
                v209 = v206.Data1v1
                v205 = v209.Sheriff
                if not v205 then
                    v209 = _G
                    v205 = v209.Data1v1
                    v209 = true
                    v205.Started = v209
                    v206 = game
                    v209 = v206.ReplicatedStorage
                    v205 = v209.Start1v1
                    v201 = _G
                    v202 = v201.Data1v1
                    v206 = v202.Murderer
                    v201 = _G.Data1v1
                    v202 = v201.Sheriff
                    v205:FireServer(v206, v202)
                end
            end
            Update1v1State_1()
        end
        v109.MouseButton1Click:connect(v87)
        v109 = v26.Confirm.Cancel
        v109.MouseButton1Click:connect(function()
            local v213 = {}
            v213.Murderer = nil
            v213.Sheriff = nil
            _G.Data1v1 = v213
            game.ReplicatedStorage.Start1v1:FireServer(nil)
            Update1v1State_1()
            Update1v1Players_1()
        end)
        v109 = game.Players
        v109.PlayerAdded:Connect(Update1v1Players_1)
        v109 = game.Players
        v109.PlayerRemoving:Connect(Update1v1Players_1)
        v86 = game.ReplicatedStorage
        v109 = v86.Remotes.CustomGames.Clear1v1
        v109.OnClientEvent:Connect(function()
            v11.Waiting.VIP.Waiting.Visible = false
            v11.Waiting.VIP.Selected.Visible = false
            local v242 = {}
            v242.Murderer = nil
            v242.Sheriff = nil
            _G.Data1v1 = v242
            Update1v1Players_1()
            Update1v1State_1()
        end)
    else
        if v321 then
            v43 = v11.Settings
            v26 = UDim2.new
            UpdateSettings_1 = 0
            Update1v1State_1 = 100
            Update1v1Players_1 = 0
            v43.Size = v26(UpdateSettings_1, Update1v1State_1, Update1v1Players_1, 50)
        end
    end
    v247 = game.ReplicatedStorage.Remotes.CustomGames.Cancelled1v1
    v43 = v247.OnClientEvent
    v43:Connect(function()
        v11.Waiting.VIP.Waiting.Visible = false
        v11.Waiting.VIP.Selected.Visible = false
    end)
    v247 = game.ReplicatedStorage.Remotes.CustomGames.Started1v1
    v247.OnClientEvent:Connect(function(p1, p2)
        v11.Waiting.VIP.Waiting.Visible = false
        v11.Waiting.VIP.Selected.Visible = true
        v11.Waiting.VIP.Selected.Murderer.Text = p1
        v11.Waiting.VIP.Selected.Sheriff.Text = p2
    end)
    v247 = game.ReplicatedStorage.Remotes.CustomGames.Waiting1v1
    v247.OnClientEvent:Connect(function()
        v11.Waiting.VIP.Waiting.Visible = true
        v11.Waiting.VIP.Waiting.TextLabel.Text = "Server set to 1v1 Mode. Waiting for owner to select players..."
    end)
    v247 = game.ReplicatedStorage.Remotes.CustomGames.Waiting1v1Queue
    v247.OnClientEvent:Connect(function()
        v11.Waiting.VIP.Waiting.Visible = true
        v11.Waiting.VIP.Waiting.TextLabel.Text = "Server set to 1v1 Mode. Waiting for two players to join queue..."
    end)
    return 
end
