local v1 = {}
local v7 = require(game.ReplicatedStorage.Modules.InventoryModule)
local v8 = {}
v8[0] = ""
v8[1] = "I"
v8[2] = "II"
v8[3] = "III"
v8[4] = "IV"
v8[5] = "V"
v8[6] = "VI"
v8[7] = "VII"
v8[8] = "VIII"
v8[9] = "IX"
v8[10] = "X"
local v10 = require(game.ReplicatedStorage.RankIconsEmpty)
local v11 = {}
v11[1] = Color3.fromRGB(255, 170, 0)
v11[2] = Color3.fromRGB(193, 218, 216)
v11[3] = Color3.fromRGB(139, 58, 0)
local v26 = require(script.Parent.ItemModule)
local v27 = {}
v1.GUI = v27
v27 = {}
v1.PlayerInventories = v27
v27 = function(p1, p2, p3, p4)
    local v30 = v1.GUI.ProfileContainer
    local v66 = v30.Character
    local v32 = v30.Profile.Season1Stats
    local v67 = v32.Container
    local v68 = v30.Profile
    local v69 = v68.Trophies
    if p2 == game.Players.LocalPlayer.Name then
        v68 = " (You)"
    else
        v68 = ""
    end
    local v37 = v30:FindFirstChild("Username")
    if v37 then
        v37 = v30.Parent
        local v39 = v37:FindFirstChild("Username")
    end
    v39.Text = p2 .. v68
    v39 = game.Players
    local v41 = game
    local v42 = v41.Players
    local v46 = v39:GetUserThumbnailAsync(math.abs(v42[p2].userId), Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size352x352)
    v66.CharacterIcon.Image = v46
    p1.Nav.Profile.Icon.Image = v46
    v66.CharacterIcon.LevelFrame.LevelContainer.Icon.Level.Text = p3.Level
    v66.CharacterIcon.LevelFrame.LevelContainer.Icon.Image = v10[p3.Level]
    local v93 = v66.CharacterIcon.LevelFrame.LevelContainer
    local v95 = p3.Prestige
    local v96 = 0
    if v96 <= v95 then
        v93 = false
    end
    v93.Prestige.Visible = true
    local v98 = p3.Prestige
    local v99 = 0
    if v98 > v99 then
        v96 = v66.CharacterIcon
        v95 = v96.LevelFrame
        v99 = v95.LevelContainer
        v98 = v99.Prestige
        v95 = v8
        v96 = p3.Prestige
        v99 = v95[v96]
        v98.Text = v99
    end
    local v101 = p3.Elite
    local v102 = false
    v66.Elite.Visible = true
    local v105 = p3.MapBuilder
    local v106 = false
    v66.Builder.Visible = true
    local v109 = p3.WeaponDesigner
    local v110 = false
    v66.WeaponDesigner.Visible = true
    local v113 = p3.Nikilis
    local v114 = false
    v66.MM2Creator.Visible = true
    local v117 = p3.BetaTester
    local v118 = false
    v66.BetaTester.Visible = true
    local v121 = p3.Clown
    local v122 = false
    v66.Clown.Visible = true
    v67.Eliminations.Amount.Text = p3.Eliminations
    v67.Saves.Amount.Text = p3.Victories
    v67.Survivals.Amount.Text = p3.Survivals
    local v133 = p3.Trophies
    local v134 = false
    v69.Visible = true
    v69.Container:ClearAllChildren()
    local v50 = p3.Trophies
    if not v50 then
        v133 = script
        v50 = v133.TrophyGridLayout
        v133 = v69.Container
        v50:Clone().Parent = v133
        v133 = p3.Trophies
        local v52, v53, v47 = pairs(v133)
        for v49, v42 in v52, v53, v121 do
            v41 = script.TrophyItem
            local v55 = v41:Clone()
            local v138 = v42.ItemID
            local v56 = v42.Rank
            v55.Container.Icon.Image = v26.GetImage(_G.Database.Weapons[v138].Image)
            local v143 = _G
            local v144 = v143.Database
            v55.Container.Year.YearText.Text = v144.Weapons[v138].Year
            local v150 = v42.Rank
            local v151 = "Rank #"
            local v152 = v42.Rank
            local v153 = v151 .. v152
            if v153 then
                v143 = _G
                v144 = v143.Database
                v152 = v144.Weapons
                v151 = v152[v138]
                v153 = v151.ItemName
            end
            v55.ItemName.Label.Text = v153
            local v154 = v11
            local v155 = v154[v56]
            if not v155 then
                v155 = v55.ItemName
                v151 = v11
                v154 = v151[v56]
                v155.BackgroundColor3 = v154
            end
            v55.Parent = v32.Container
        end
        v53 = v1
        v52 = v53.DisplayInventory
        v53 = p1
        v121 = p2
        v96 = p4
        v52(v53, v121, v96)
        return 
        if not v65 then
        end
    end
end
v1.GenerateProfile = v27
v27 = nil
v1.DisplayInventory = function(p5, p6, p7)
    local v158 = {}
    local v160 = "Effects"
    local v161 = "Perks"
    local v162 = "Emotes"
    local v163 = "Radios"
    local v164 = "Pets"
    v158[1] = "Weapons"
    v158[2] = v160
    v158[3] = v161
    v158[4] = v162
    v158[5] = v163
    v158[6] = v164
    local v165, v166, v167 = pairs(v158)
    for v159, v160 in v165, v166, v167 do
        v161 = p5.Main
        v163 = v160
        local v170 = (v161:FindFirstChild(v163)):FindFirstChild("Title")
        if not v170 then
            v162 = v170.Username
            v164 = p6
            v162.Text = v164 .. "'s " .. v160
        end
        v162 = pairs
        v172 = v7
        v171 = v172.CreateBlankInventoryTable
        local v174 = v171()
        v173 = v174[v160]
        local v175, v176, v164 = v162(v173)
        for v174, v172 in v175, v176, v164 do
            local v180 = p5.Main:FindFirstChild(v160).Items
            local v182 = v180.Container:FindFirstChild(v174)
            if v182 then
                v180 = p5.Main:FindFirstChild(v160).Items.Container
                v182 = v180:FindFirstChild("Holiday").Container
                local v188 = v182:FindFirstChild(v174)
            end
            v187 = v188.Container
            v187:ClearAllChildren()
        end
    end
    v167 = game.ReplicatedStorage.Remotes
    v166 = v167.Extras
    v165 = v166.GetFullInventory
    v167 = p6
    v166 = v7.GenerateInventory
    v170 = p7
    local v191 = v166(p5, v165:InvokeServer(v167), nil, v170)
    v1.PlayerInventories[p6] = v191
    local v253 = v27
    if not v253 then
        v253 = v27
        v253:disconnect()
    end
    local v195 = v1.GUI.SearchFrameTextBox
    v27 = (v195:GetPropertyChangedSignal("Text")):connect(function()
        local v200 = v195.Text
        local v236 = string.gsub(v200, "S", "")
        local v205 = v191
        local v208, v209, v210 = pairs(v205.Data.Weapons)
        for v206, v205 in v208, v209, v210 do
            local v213, v214, v215 = pairs(v205)
            for v234, v217 in v213, v214, v215 do
                v217.Frame.Visible = string.find(string.lower(v217.Name), string.lower(v200))
                local v238 = v217.Frame.Parent
                local v226 = v238.Parent:IsA("ScrollingFrame")
                if not v226 then
                    v238 = v217.Frame.Parent
                    v226 = v238.Parent
                    v238 = Vector2.new
                    v226.CanvasPosition = v238(0, 0)
                else
                    v229 = v217.Frame.Parent.Parent.Parent
                    v226 = v229.Parent
                    v229 = Vector2.new
                    v226.CanvasPosition = v229(0, 0)
                end
            end
        end
    end)
end
v1.DisplayInventoryFromData = function(p8, p9, p10)
    local v256 = {}
    local v258 = "Effects"
    local v259 = "Perks"
    local v260 = "Emotes"
    local v261 = "Radios"
    local v262 = "Pets"
    v256[1] = "Weapons"
    v256[2] = v258
    v256[3] = v259
    v256[4] = v260
    v256[5] = v261
    v256[6] = v262
    local v263, v264, v265 = pairs(v256)
    for v257, v258 in v263, v264, v265 do
        v259 = p8.Main
        v261 = v258
        local v268 = (v259:FindFirstChild(v261)):FindFirstChild("Title")
        if not v268 then
            v260 = v268.Username
            v262 = p9
            v260.Text = v262 .. "'s " .. v258
        end
        v260 = pairs
        v270 = v7
        v269 = v270.CreateBlankInventoryTable
        local v272 = v269()
        v271 = v272[v258]
        local v273, v274, v262 = v260(v271)
        for v272, v270 in v273, v274, v262 do
            local v278 = p8.Main:FindFirstChild(v258).Items
            local v280 = v278.Container:FindFirstChild(v272)
            if v280 then
                v278 = p8.Main:FindFirstChild(v258).Items.Container
                v280 = v278:FindFirstChild("Holiday").Container
                local v286 = v280:FindFirstChild(v272)
            end
            v285 = v286.Container
            v285:ClearAllChildren()
        end
    end
    v264 = v7
    v263 = v264.GenerateInventory
    v264 = p8
    v265 = p10
    v1.PlayerInventories[p9] = v263(v264, v265)
end
v1.DisplayInventoryFromProfile = function()
end
v1.ConnectViewProfile = function(p11)
    v7.ConnectNavButtons(p11.Nav, p11.Main)
    v7.ConnectTabButtons(p11, "Weapons")
end
return v1
