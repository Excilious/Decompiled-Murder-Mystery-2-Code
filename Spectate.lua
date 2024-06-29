local v4 = game.ReplicatedStorage.Remotes.Extras
local v6 = v4.GetPlayerData:InvokeServer()
v4 = false
local v7 = game
local v8 = require(v7.ReplicatedStorage.CodeImages)
local v9 = script
v7 = v9.Parent
local v10 = v7.Parent.Game
v7 = v10.Dock
v7 = true
local v11 = game
v9 = v11.PlaceId
v11 = game
v9 = v11.PlaceId
v7 = false
v7 = true
v9 = v10.Spectate
v11 = 1
local v12
local function GetSpectatePlayers_1()
    local v15 = {}
    local v16 = v6
    if not v16 then
        v16 = pairs
        local v18, v19, v20 = v16(v6)
        for v24, v28 in v18, v19, v20 do
            local v25 = game.Players:FindFirstChild(v24)
            local v26 = game
            local v27 = v26.Players
            local v32 = v27.LocalPlayer
            if v25 == v32 then
                v32 = v28.Dead
                if v32 then
                    v32 = {}
                    return v32
                end
            end
            local v29 = v28.Dead
            if v29 then
                if not v25 then
                    v29 = v25.Character
                    if not v29 then
                        v29 = v25.Character
                        v26 = "Humanoid"
                        local v30 = v29:FindFirstChild(v26)
                        if not v30 then
                            v27 = v15
                            v30 = table.insert
                            v30(v27, v25)
                        end
                    end
                end
            end
        end
    end
    return v15
end
game.ReplicatedStorage.UpdatePlayerData.OnClientEvent:connect(function(p1)
    v6 = p1
    local v37 = v4
    if v37 then
        return 
    end
    v37 = GetSpectatePlayers_1
    local v38 = v37()
    if not v38 then
        v38 = #GetSpectatePlayers_1()
        local v54 = 0
        if v38 > v54 then
            v38 = v12
            local v42 = GetSpectatePlayers_1()
            local v43 = v12
            v54 = v42[v43]
            if v38 ~= v54 then
                v38 = pairs
                v43 = GetSpectatePlayers_1
                local v44 = v43()
                v54 = v44
                local v45, v46, v42 = v38(v54)
                for v44, v48 in v45, v46, v42 do
                    if v48 == v12 then
                        v11 = v44
                        return 
                    end
                end
                while true do
                    v46 = v11
                    v45 = v46 + 1
                    v11 = v45
                    v46 = GetSpectatePlayers_1
                    v42 = v11
                    v45 = v46()[v42]
                    if v45 then
                        break
                    end
                    v45 = v11
                    v42 = GetSpectatePlayers_1
                    if #v42() <= v45 then
                        break
                    end
                end
                v45 = v11
                v50 = GetSpectatePlayers_1
                v49 = #v50()
                if v45 > v49 then
                    v45 = 1
                    v11 = v45
                end
                v49 = GetSpectatePlayers_1
                local v52 = v49()
                local v56 = v11
                v45 = v52[v56]
                v12 = v45
                v45 = v12
                if not v45 then
                    v45 = v7
                    if not v45 then
                        v52 = v9
                        v45 = v52.CodeImage
                        v56 = v8
                        v47 = v12.Name
                        v48 = p1[v47]
                        v44 = v48.CodeName
                        v52 = v56[v44]
                        v45.Image = v52
                        v52 = v9
                        v45 = v52.CodeImage
                        v47 = v12
                        v48 = v47.Name
                        v44 = p1[v48]
                        v56 = v44.Color
                        v52 = v56.Color
                        v45.ImageColor3 = v52
                    else
                        v56 = v9
                        v52 = v56.CodeImage
                        v45 = v52.PlayerName
                        v56 = v12
                        v52 = v56.Name
                        v45.Text = v52
                    end
                    v56 = game
                    v52 = v56.Workspace
                    v45 = v52.CurrentCamera
                    v44 = v12
                    v56 = v44.Character
                    v52 = v56.Humanoid
                    v45.CameraSubject = v52
                    v52 = v10
                    v45 = v52.Waiting
                    v52 = "http://www.roblox.com/asset/?id=189842948"
                    v45.Image = v52
                    v45 = v9
                    v52 = true
                    v45.Visible = v52
                    v45 = true
                    v4 = v45
                    return 
                end
                v45 = game.Workspace.CurrentCamera
                v47 = game
                v48 = v47.Players
                v45.CameraSubject = v48.LocalPlayer.Character.Humanoid
                v45 = game.Workspace.CurrentCamera
                v45.CameraType = "Custom"
                v45 = v9
                v45.Visible = false
                v45 = v10.Waiting
                v45.Image = "http://www.roblox.com/asset/?id=189761558"
                v45 = false
                v4 = v45
                return 
                v45 = game.Workspace.CurrentCamera
                v47 = game
                v48 = v47.Players
                v45.CameraSubject = v48.LocalPlayer.Character.Humanoid
                v45 = game.Workspace.CurrentCamera
                v45.CameraType = "Custom"
                v45 = v9
                v45.Visible = false
                v45 = v10.Waiting
                v45.Image = "http://www.roblox.com/asset/?id=189761558"
                v45 = false
                v4 = v45
            end
            return 
        end
    end
end)
local function ChangeSpectate_1(p2)
    local v82 = GetSpectatePlayers_1()
    if not v82 then
        v82 = #GetSpectatePlayers_1()
        local v94 = 0
        if v82 > v94 then
            v94 = v11
            v82 = v94 + p2
            v11 = v82
            v82 = v11
            v94 = 1
            if v94 > v82 then
                v94 = GetSpectatePlayers_1
                v82 = #v94()
                v11 = v82
            else
                v82 = v11
                v85 = #GetSpectatePlayers_1()
                if v82 > v85 then
                    v82 = 1
                    v11 = v82
                end
            end
            v85 = GetSpectatePlayers_1
            v87 = v11
            v82 = v85()[v87]
            v12 = v82
            v87 = game
            v82 = v87.Workspace.CurrentCamera
            local v89 = v12
            v87 = v89.Character
            local v96 = v87.Humanoid
            v82.CameraSubject = v96
            v82 = v7
            if not v82 then
                v96 = v9
                v82 = v96.CodeImage
                v87 = v8
                v89 = v6[v12.Name].CodeName
                v96 = v87[v89]
                v82.Image = v96
                v96 = v9
                v82 = v96.CodeImage
                v89 = v6[v12.Name]
                v87 = v89.Color
                v96 = v87.Color
                v82.ImageColor3 = v96
                return 
            end
            v87 = v9
            v82 = v87.CodeImage.PlayerName
            v87 = v12
            v82.Text = v87.Name
            return 
        end
    end
    v87 = game
    v88 = v87.Workspace
    v90 = game
    v93 = v90.Players
    v89 = v93.LocalPlayer
    v87 = v89.Character
    v88 = v87.Humanoid
    v88.CurrentCamera.CameraSubject = v88
    v87 = game
    v88 = v87.Workspace
    v88 = "Custom"
    v88.CurrentCamera.CameraType = v88
    v88 = false
    v9.Visible = v88
    v88 = v10
    v88 = "http://www.roblox.com/asset/?id=189761558"
    v88.Waiting.Image = v88
    v4 = false
end
v9.Right.MouseButton1Click:connect(function()
    ChangeSpectate_1(1)
end)
v9.Left.MouseButton1Click:connect(function()
    ChangeSpectate_1(-1)
end)
v7.Spectate.MouseButton1Click:connect(function()
    local v116 = v4
    if not v116 then
        v116 = game.Workspace.CurrentCamera
        v116.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        v116 = game.Workspace.CurrentCamera
        v116.CameraType = "Custom"
        v116 = v9
        v116.Visible = false
        v116 = v10.Waiting
        v116.Image = "http://www.roblox.com/asset/?id=189761558"
        v116 = false
        v4 = v116
        return 
    end
    local v122 = GetSpectatePlayers_1()
    if not v122 then
        v118 = GetSpectatePlayers_1
        v122 = #v118()
        local v136 = 0
        if v122 > v136 then
            v122 = 1
            v11 = v122
            v136 = GetSpectatePlayers_1
            v117 = v11
            v122 = v136()[v117]
            v12 = v122
            v117 = game
            v122 = v117.Workspace.CurrentCamera
            v121 = v12
            v117 = v121.Character
            local v138 = v117.Humanoid
            v122.CameraSubject = v138
            v122 = v7
            if not v122 then
                v138 = v9
                v122 = v138.CodeImage
                v117 = v8
                v119 = v6
                v120 = v119[v12.Name]
                v121 = v120.CodeName
                v138 = v117[v121]
                v122.Image = v138
                v138 = v9
                v122 = v138.CodeImage
                v120 = v6
                v119 = v12.Name
                v121 = v120[v119]
                v117 = v121.Color
                v138 = v117.Color
                v122.ImageColor3 = v138
            else
                v117 = v9
                v138 = v117.CodeImage
                v122 = v138.PlayerName
                v117 = v12
                v138 = v117.Name
                v122.Text = v138
            end
            v122 = v10.Waiting
            v122.Image = "http://www.roblox.com/asset/?id=189842948"
            v122 = v9
            v122.Visible = true
            v122 = true
            v4 = v122
        end
    end
end)
game:GetService("UserInputService").InputBegan:connect(function(p3, p4)
    if not p4 then
        return 
    end
    local v147 = v4
    if v147 then
        return 
    end
    v147 = p3.KeyCode
    local v148 = Enum.KeyCode.Q
    if v147 == v148 then
        v147 = ChangeSpectate_1
        v148 = -1
        v147(v148)
        return 
    end
    local v149 = p3.KeyCode
    local v150 = Enum.KeyCode.E
    if v149 == v150 then
        v149 = ChangeSpectate_1
        v150 = 1
        v149(v150)
    end
end)
