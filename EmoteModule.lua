local v1 = {}
local v2 = {}
local v5 = game:GetService("UserInputService")
local v6 = v5.KeyboardEnabled
local v9 = game:GetService("UserInputService")
v5 = v9.GamepadEnabled
v9 = {}
local v10 = {}
_G.EmotePages = {}
_G.CurrentPage = ""
v1.EmoteGUI = nil
v1.GeneratePage = function(p2, p3, p4, p5, p6)
    local v33 = script.Page:Clone()
    local v34 = script
    local v35 = v34.Container:Clone()
    v35.Parent = v33
    v33.Name = p4
    v33.Parent = p3.EmotePages
    local v104 = {}
    local v38, v39, v40 = pairs(p2)
    for v42, v41 in v38, v39, v40 do
        v34[v42] = v41
    end
    v39 = v104
    v40 = 1
    v42 = ""
    v38 = table.insert
    v38(v39, v40, v42)
    table.insert(v104, 2, "")
    local v47 = v9
    v47[p4] = {}
    local v106 = #v104 - 2
    v41 = 1
    v35.Size = UDim2.new(v106, 0, v41, 0)
    v35:ClearAllChildren()
    local v53 = 3
    local v56, v57, v58 = pairs(v104)
    for v88, v63 in v56, v57, v58 do
        local v59 = _G
        local v60 = v59.Database
        local v61 = v60.Emotes
        local v62 = v61[v63]
        if not v62 then
            v61 = script
            v62 = v61.Emote
            local v64 = v62:Clone()
            v61 = UDim2.new
            v59 = 1
            v60 = v59 / v47
            v59 = 0
            v64.Size = v61(v60, v59, 1, 0)
            v64.Position = UDim2.new(1 / v47 * v53 - 1 - 1 - 1, 0, 0, 0)
            v64.Name = v63
            v64.Parent = v35
            v64.Container.Icon.Image = (function(p1)
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
            end)(_G.Database.Emotes[v63].Image)
            v64.Container.EmoteName.Text = _G.Database.Emotes[v63].Name
            v64.Container.Hotkey.Text = v53
            v64.Container.Hotkey.Visible = v6
            v64.Container.Button.MouseButton1Click:connect(function()
                game.ReplicatedStorage.Remotes.Misc.PlayEmote:Fire(v63)
            end)
            v9[p4][v53] = v63
            v53 = v53 + 1
        end
    end
    v58 = _G
    v57 = v58.EmotePages
    v58 = p4
    v56 = table.insert
    v56(v57, v58)
    local v91 = script.Back:Clone()
    v88 = 1
    v88 = 0
    v63 = 1
    v64 = 0
    v91.Size = UDim2.new(v88 / v106, v88, v63, v64)
    v87 = "UserInputService"
    v91.Container.Icon.Visible = not game:GetService(v87).GamepadEnabled
    v91.Container.BButton.Visible = game:GetService("UserInputService").GamepadEnabled
    v91.Container.Hotkey.Visible = game:GetService("UserInputService").KeyboardEnabled
    v91.Parent = v35
end
v1.ShowPage = function(p7)
    local v161 = {}
    v161[1] = nil
    local v162 = "Back"
    v161[2] = v162
    _G.EmoteController.Emotes = v161
    local v146 = v9
    local v147, v148, v145 = pairs(v146[p7])
    for v146, v152 in v147, v148, v162 do
        _G.EmoteController.Emotes[v146] = v152
    end
    v147 = pairs
    v162 = v1.EmoteGUI
    v148 = v162.EmotePages
    local v153, v154, v145 = v147(v148:GetChildren())
    for v146, v152 in v153, v154, v162 do
        v150 = v152.Name
        if v150 ~= p7 then
            v151 = false
        end
        v151 = true
        v152.Visible = v151
    end
    v153 = _G
    v153.CurrentPage = p7
    v162 = v1
    v154 = v162.EmoteGUI
    v153 = v154.PageName
    v153.Text = p7
    v154 = game
    local v155 = v154:GetService("UserInputService")
    v153 = v155.GamepadEnabled
    if not v153 then
        v162 = v1
        v155 = v162.EmoteGUI
        v153 = v155.Visible
        if not v153 then
            v153 = game
            v162 = "GuiService"
            v149 = v1.EmoteGUI
            v150 = v149.EmotePages
            v151 = v150[p7]
            v152 = v151.Container
            v155 = v152:GetChildren()[1].Container.Button
            v153:GetService(v162).SelectedObject = v155
        end
    end
end
local function v167(p8)
    local v169 = _G
    local v171, v172, v173 = pairs(v169.EmotePages)
    for v169, v176 in v171, v172, v173 do
        if v169 == p8 then
            v1.ShowPage(v176)
        end
    end
end
_G.ChangePage = v167
v1.GenerateEmotes = function(p9, p10)
    v9 = {}
    local v179 = {}
    _G.EmotePages = v179
    _G.CurrentPage = ""
    p10.EmotePages:ClearAllChildren()
    local v180 = #p9
    local v239 = 0
    if v180 > v239 then
        v180 = #p9
        v239 = 6
        if v180 > v239 then
            v180 = {}
            v239 = 0
            local v183, v184, v185 = pairs(p9)
            for v186, v193 in v183, v184, v185 do
                local v190 = math.floor(v186 / 6) + 1
                local v240 = v180[v190]
                if v240 then
                    v240 = {}
                end
                v180[v190] = v240
                table.insert(v180[v190], v193)
                v179 = v190
            end
            v183 = nil
            v184 = pairs
            v185 = v180
            local v194, v195, v186 = v184(v185)
            for v193, v190 in v194, v195, v186 do
                local v201 = "Your Emotes (" .. v193 .. "/" .. v179 .. ")"
                v1.GeneratePage(v190, p10, v201)
                v183 = v201
            end
            v195 = v1
            v194 = v195.GeneratePage
            v195 = {}
            v186 = "wave"
            v193 = "cheer"
            v190 = "laugh"
            v201 = "dance1"
            v195[1] = v186
            v195[2] = v193
            v195[3] = v190
            v195[4] = v201
            v195[5] = "dance2"
            v195[6] = "dance3"
            v186 = p10
            v193 = "Roblox Emotes"
            v194(v195, v186, v193)
            v1.ShowPage(v183, p10)
        else
            v239 = v1
            v180 = v239.GeneratePage
            v239 = p9
            v183 = p10
            v180(v239, v183, "Your Emotes")
            local v248 = {}
            v190 = "dance3"
            v248[1] = "wave"
            v248[2] = "cheer"
            v248[3] = "laugh"
            v248[4] = "dance1"
            v248[5] = "dance2"
            v248[6] = v190
            v1.GeneratePage(v248, p10, "Roblox Emotes")
            v1.ShowPage("Your Emotes", p10)
            local v252 = {}
            v190 = "dance3"
            v252[1] = "wave"
            v252[2] = "cheer"
            v252[3] = "laugh"
            v252[4] = "dance1"
            v252[5] = "dance2"
            v252[6] = v190
            v1.GeneratePage(v252, p10, "Roblox Emotes")
            v1.GeneratePage(p9, p10, "Your Emotes")
            v1.ShowPage("Roblox Emotes", p10)
        end
        v10 = {}
        local v231, v232, v233 = pairs(p9)
        for v234, v212 in v231, v232, v233 do
            v213 = v10
            v214 = true
            v213[v212] = v214
        end
        return 
    end
end
v1.SetupPageButtons = function()
    local v261 = v5
    if not v261 then
        local v262 = "< LB"
    else
        v261 = v6
        if not v261 then
            v262 = "< Q"
        else
            v262 = "<"
        end
    end
    local v263 = v5
    if not v263 then
        v261 = "RB >"
    else
        v263 = v6
        if not v263 then
            v261 = "E >"
        else
            v261 = ">"
        end
    end
    v263 = v1.EmoteGUI.Left
    v263.Text = v262
    v1.EmoteGUI.Right.Text = v261
    v1.EmoteGUI.Left.MouseButton1Click:connect(_G.EmotePageLeft)
    v1.EmoteGUI.Right.MouseButton1Click:connect(_G.EmotePageRight)
end
v167 = game.ReplicatedStorage.UpdateDataClient
v167.Event:connect(function(p11)
    if not p11 then
        return 
    end
    local v283 = _G
    local v287, v288, v283 = pairs(v283.PlayerData.Emotes.Owned)
    for v295, v291 in v287, v288, v283 do
        local v290 = v10[v291]
        v290 = v1.GenerateEmotes
        v290(_G.PlayerData.Emotes.Owned, v1.EmoteGUI)
        return 
    end
end)
return v1
