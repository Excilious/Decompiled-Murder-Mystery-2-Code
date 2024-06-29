local v2 = script.Parent
local v4 = v2.Parent.Game
v2 = v4.Settings
v2 = v4.Radio
_G.Windows.Frames[v2] = true
local v7 = game.Players.LocalPlayer:GetAttribute("Radio")
local v344 = true
local v8 = game
local v9 = v8.PlaceId
v8 = game
v9 = v8.PlaceId
local v345 = false
local v346 = true
v9 = true
local v10 = game
v8 = v10.PlaceId
v10 = game
v8 = v10.PlaceId
local v347 = v4[1]
v9 = false
v9 = true
local v11 = v2.Main
v10 = v11.MySongs
v8 = v10.ScrollFrame
local v12 = v2.Main
v11 = v12.MySongs
v10 = v11.Adder
v12 = v2.Main
v11 = v12.Search
local v14 = v2.Main.Search
v12 = v14.ScrollFrame
local v15 = v2.Main
local v349 = v15.Search.Searcher
local function unescape_1(p1)
    p1 = string.gsub(p1, "&lt;", "<")
    p1 = string.gsub(p1, "&gt;", ">")
    p1 = string.gsub(p1, "&quot;", '"')
    p1 = string.gsub(p1, "&apos;", "'")
    p1 = string.gsub(p1, "&#(%d+);", function(p2)
        local v39 = tonumber(p2)
        if not v39 then
            v39 = tonumber
            local v41 = v39(p2)
            local v42 = 126
            if v42 > v41 then
                v42 = tonumber
                v41 = string.char
                return v41(v42(p2))
            end
        end
        return ""
    end)
    p1 = string.gsub(p1, "&#x(%d+);", function(p3)
        local v51 = tonumber(p3)
        if not v51 then
            v51 = tonumber
            local v53 = v51(p3)
            local v54 = 126
            if v54 > v53 then
                v54 = tonumber
                v53 = string.char
                return v53(v54(p3))
            end
        end
        return ""
    end)
    p1 = string.gsub(p1, ".", function(p4)
        local v63 = string.byte(p4)
        if not v63 then
            if 126 > v63 then
                return p4
            end
        end
        v64 = ""
        return v64
    end)
    p1 = string.gsub(p1, "&amp;", "&")
    return p1
end
unescape = unescape_1
if v346 then
    if v9 then
        v15 = {}
        local v77 = game
        local v78 = v77.ReplicatedStorage
        local v80 = v78.Remotes.Extras
        v15[2] = v80
        v15[4] = v78
        v15[5] = v77
        v15[4] = v80.GetData:InvokeServer("RadioSongs")
        unescape_1 = unpack
        local v92 = unescape_1(v15)
        v82 = v2.Nav
        local v94, v95, v80 = pairs(v82:GetChildren())
        for v83, v78 in v94, v95, v80 do
            v77 = v78.MouseButton1Click
            v85 = function()
                script.Preview:Stop()
                script.Preview.SoundId = ""
                local v99 = v2
                local v100, v101, v99 = pairs(v99.Nav:GetChildren())
                for v105, v103 in v100, v101, v99 do
                    local v102 = v78
                    local v104 = Enum.ButtonStyle.RobloxRoundDefaultButton
                    if v104 then
                        v104 = Enum.ButtonStyle.RobloxRoundButton
                    end
                    v103.Style = v104
                end
                if v103 == v102 then
                    v100 = pairs
                    v99 = v2
                    v101 = v99.Main
                    local v106, v107, v99 = v100(v101:GetChildren())
                    for v105, v103 in v106, v107, v99 do
                        v102 = v103.Name
                        if v102 ~= v78.Name then
                            v104 = false
                        end
                        v104 = true
                        v103.Visible = v104
                    end
                    return 
                end
            end
            v77:connect(v85)
        end
        v94 = false
        v78 = game
        v83 = v78.ReplicatedStorage
        v80 = v83.RoleSelect
        v95 = v80.OnClientEvent
        v83 = function(p5, p6, p7, p8)
            v94 = true
        end
        v95:connect(v83)
        v84 = game
        v84.ReplicatedStorage.Remotes.Shop.GetRadio.OnClientEvent:connect(function()
            v94 = true
        end)
        local function UpdateSongList_1()
            v8:ClearAllChildren()
            local v124, v125, v126 = pairs(v92)
            for u1, v131 in v124, v125, v126 do
                local v129 = script.Song:Clone()
                v129.Container.SongName.Text = v131.Name
                v129.Container.Play.MouseButton1Click:connect(function()
                    local v133 = v94
                    if not v133 then
                        local v134 = game
                        local v135 = v134.Players
                        local v136 = v135.LocalPlayer
                        v133 = v136.Character
                        if not v133 then
                            local v138 = game.Players
                            v134 = v138.LocalPlayer
                            v135 = v134.Character
                            v136 = v135.Humanoid
                            v133 = v136.Health
                            v136 = 0
                            if v133 > v136 then
                                v133 = v7
                                if not v133 then
                                    v135 = game
                                    v136 = v135.ReplicatedStorage
                                    v133 = v136.PlaySong
                                    v134 = v131
                                    v135 = v134.ID
                                    v133:FireServer(v135)
                                    return 
                                end
                                v138 = game
                                v134 = v138.ReplicatedStorage
                                v136 = v134.Remotes.Shop
                                v136.GetRadio:FireServer()
                                return 
                            end
                        end
                    end
                    v134 = v2
                    v139 = v134.Main
                    v136 = v139.MySongs
                    v136 = true
                    v136.Wait.Visible = v136
                    v136 = 2
                    wait(v136)
                    v134 = v2
                    v139 = v134.Main
                    v139.MySongs.Wait.Visible = false
                end)
                v129.Container.Delete.MouseButton1Click:connect(function()
                    table.remove(v92, u1)
                    game.ReplicatedStorage.RemoveSong:FireServer(u1)
                    UpdateSongList_1()
                end)
                v129.Position = UDim2.new(0, 0, 0, u1 - 1 * v129.Size.Y.Offset)
                v129.Parent = v8
            end
        end
        local function AddSong_1(p9, p10)
            local v175
            pcall(function()
                local v180 = tonumber(p9)
                if not v180 then
                    v180 = game
                    local v184 = (v180:GetService("MarketplaceService")):GetProductInfo(p9)
                    if not v184 then
                        local v185 = v184.AssetTypeId
                        v185 = "https://www.roblox.com/asset/?id=" .. p9
                        v175 = v185
                        p10 = unescape(v184.Name)
                    end
                end
            end)
            local v191 = "https://www.roblox.com/asset/?id="
            local v192 = p9
            v175 = v191 .. v192
            if not v175 then
                v191 = pairs
                v192 = v92
                local v193, v194, v195 = v191(v192)
                for v198, v197 in v193, v194, v195 do
                    if v197.ID == v175 then
                        return 
                    end
                end
                v194 = v92
                v195 = 1
                v198 = {}
                v198.ID = v175
                v198.Name = p10
                v193 = table.insert
                v193(v194, v195, v198)
                local v200 = #v92
                local v208 = 30
                if v200 >= v208 then
                    v200 = table.remove
                    v208 = v92
                    v200(v208, 30)
                end
                game.ReplicatedStorage.SaveSong:FireServer(v175, p10)
                UpdateSongList_1()
            else
                v203 = v10
                v203 = "Invalid ID!"
                v203.ID.Text = v203
            end
        end
        v2.Radio.MouseButton1Click:connect(function()
            _G.Windows.ViewFrame(v2)
        end)
        local function SearchSongs_1(p11)
            local v217 = v7
            if v217 then
                if p11 then
                    v217 = game.ReplicatedStorage.GetRadio
                    v217:FireServer()
                    return 
                end
            end
            v219 = script
            v219.Preview:Stop()
            v219 = script
            v219 = ""
            v219.Preview.SoundId = v219
            v219 = v11
            local v222, v223, v218 = pairs(v219:GetChildren())
            for v226, v225 in v222, v223, v218 do
                local v224 = v225.Name
                v224 = false
                v225.Visible = v224
            end
            v223 = v11
            v222 = v223.Processing
            v223 = true
            v222.Visible = v223
            v223 = v11
            v222 = v223.Processing
            v223 = "Searching."
            v222.Text = v223
            v222 = spawn
            v223 = function()
                local v227 = 1
                while true do
                    local v230 = v11.Processing.Visible
                    if not v230 then
                        break
                    end
                    v230 = v11.Processing
                    v230.Text = "Searching"
                    local v231 = v227 - 1
                    local v240 = v231 % 4
                    local v241 = 1
                    for v228 = 1, v240, v241 do
                        v231 = v11.Processing
                        v231.Text = v11.Processing.Text .. "."
                    end
                    v227 = v227 + 1
                    v240 = wait
                    v241 = 0.25
                    v240(v241)
                end
            end
            v222(v223)
            v225 = game
            v226 = v225.ReplicatedStorage
            v218 = v226.Remotes
            local v243 = v218.Extras
            if p11 then
                v225 = v14
                v226 = v225.ID
                v218 = v226.Text
                if v218 then
                    v218 = ""
                end
                local v245 = v243.SearchSongs:InvokeServer(v218)
                v243 = v11.Processing
                local v313 = false
                v243.Visible = v313
                if not v245 then
                    p11 = #p11
                    v243 = v12
                    v243:ClearAllChildren()
                    local v247 = {}
                    v313 = 0
                    v247.ID = v313
                    v313 = ""
                    v247.Name = v313
                    v313 = 0
                    v247.Takes = v313
                    v313 = 0
                    v247.Index = v313
                    v313 = pairs
                    v226 = v245
                    local v248, v249, v225 = v313(v226)
                    for v224, v251 in v248, v249, v225 do
                        local v250 = v251.AssetId
                        local v252 = v251.Sales
                        local v253 = v247.Takes
                        if v252 > v253 then
                            v253 = v251.AssetId
                            v247.ID = v253
                            v247.Takes = v252
                            v247.Index = v224
                            v253 = v251.Name
                            v247.Name = v253
                        end
                    end
                    v248 = table.remove
                    v249 = v245
                    v225 = v247.Index
                    v248(v249, v225)
                    v224 = {}
                    v251 = v247.ID
                    v224.AssetId = v251
                    v251 = v247.Name
                    v224.Name = v251
                    table.insert(v245, 1, v224)
                    local v259, v260, v261 = pairs(v245)
                    for v304, v251 in v259, v260, v261 do
                        v252 = script
                        v250 = v252.SearchedSong
                        local v262 = v250:Clone()
                        v253 = v262.Container
                        v252 = v253.SongName
                        v253 = tostring
                        v252.Text = v253(v251.Name)
                        v252 = pairs
                        local v265, v266, v267 = v252(v92)
                        for v273, v269 in v265, v266, v267 do
                            local v268 = v269.ID
                            local v272 = "https://www.roblox.com/asset/?id=" .. v251.AssetId
                            if v268 == v272 then
                                v272 = v262.Container
                                v268 = v272.Add
                                v272 = "Added"
                                v268.Text = v272
                                v272 = v262.Container
                                v268 = v272.Add
                                v272 = Enum.ButtonStyle.RobloxRoundButton
                                v268.Style = v272
                            end
                        end
                        v265 = nil
                        v273 = v262.Container
                        v267 = v273.Add
                        v266 = v267.MouseButton1Click
                        v273 = function()
                            v265:disconnect()
                            v262.Container.Add.Text = "Added"
                            v262.Container.Add.Style = Enum.ButtonStyle.RobloxRoundButton
                            AddSong_1(v251.AssetId, v251.Name)
                        end
                        v265 = v266:connect(v273)
                        v267 = v262.Container.Preview
                        v267.MouseButton1Click:connect(function()
                            local v292, v293, v294 = pairs(v12:GetChildren())
                            for v298, v296 in v292, v293, v294 do
                                v296.Container.Preview.Text = "Preview"
                            end
                            v293 = script
                            v292 = v293.Preview
                            v292:Stop()
                            v293 = "https://www.roblox.com/asset/?id="
                            v298 = v251
                            v294 = v298.AssetId
                            v298 = script
                            v294 = v298.Preview
                            v293 = v294.SoundId
                            v298 = script
                            v294 = v298.Preview
                            v294.SoundId = v293 .. v294
                            v296 = script
                            v298 = v296.Preview
                            v294 = v298.SoundId
                            if v294 ~= v293 then
                                v296 = v262
                                v298 = v296.Container
                                v294 = v298.Preview
                                v298 = "Stop"
                                v294.Text = v298
                                v298 = script
                                v294 = v298.Preview
                                v294:Play()
                                return 
                            end
                            v298 = script
                            v298 = ""
                            v298.Preview.SoundId = v298
                        end)
                        v267 = 0
                        v269 = 0
                        v272 = v304 - 1
                        v271 = v262.Size.Y
                        v270 = v271.Offset
                        v268 = v272 * v270
                        v262.Position = UDim2.new(v267, 0, v269, v268)
                        v271 = v262.Size.Y
                        v270 = v271.Offset
                        v272 = v270 * v304
                        v12.CanvasSize = UDim2.new(0, 0, 0, v272)
                        v262.Parent = v12
                    end
                    v259 = v12
                    v260 = true
                    v259.Visible = v260
                    return 
                    v259 = v11
                    v259 = true
                    v259.Empty.Visible = v259
                    return 
                end
                v259 = v11
                v247 = v259.Error
                v259 = true
                v247.Visible = v259
                return 
            end
        end
        v84 = SearchSongs_1
        v349.Add.MouseButton1Click:connect(v84)
        v349.ID.FocusLost:connect(function(p12)
            if not p12 then
                SearchSongs_1()
            end
        end)
        v10.Add.MouseButton1Click:connect(function()
            AddSong_1(v10.ID.Text)
        end)
        SearchSongs_1(true)
        UpdateSongList_1()
        return 
    end
end
if not v346 then
    v92 = pcall
    v94 = function()
        game.Workspace.Lobby.RadioGamepass:Destroy()
    end
    v92(v94)
end
