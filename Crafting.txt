local v1 = {}
local v2 = {}
v2.Classic = 1
v2.Common = 2
v2.Uncommon = 3
v2.Rare = 4
v2.Legendary = 5
v2.Godly = 6
v2.Victim = 7
v2.Unique = 7
v2.Christmas = 1.5
v2.Halloween = 1.6
v2.Ancient = 6.5
local v6 = game.ReplicatedStorage.GetSyncData:InvokeServer("Rarity")
local v8 = game.ReplicatedStorage
local v9 = v8.Modules
local v11 = require(v9.GridCreator)
local v12
v1.GUI = v12
v12 = "Craft"
v1.Mode = v12
v12 = nil
v9 = nil
v8 = nil
local v14 = game.ReplicatedStorage
v14 = {}
local v18, v19, v20 = pairs(v14.GetSyncData:InvokeServer("Codes"))
for v24, v22 in v18, v19, v20 do
    v14[v22.Prize] = true
end
v18 = function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
    v1.GUI = p1
    v1.RecipesFrame = p2
    v1.NewRecipeFrame = p3
    v1.ActionNav = p4
    v1.SalvageInventoryFrame = p5
    v1.NewItemFrame = p6
    v1.SalvageConfirmFrame = p7
    v1.SalvageGUI = p8
    v1.SalvageConfirmButton = p9
    v9 = nil
    v12 = nil
    v8 = v1.SalvageConfirmButton.MouseButton1Click:connect(v1.ActionConfirmButtonFunction)
end
v1.SetCraftGUI = v18
v18 = function()
end
v1.CraftConfirm = v18
v18 = function()
end
v1.SalvageConfirm = v18
v18 = function(p10)
    v1.CraftConfirm = p10
end
v1.SetCraftConfirmButton = v18
v18 = function(p11)
    v1.SalvageConfirm = p11
end
v1.SetSalvageConfirmButton = v18
v18 = function(p12, p13)
    local v44 = v1
    v44.Mode = p12
    if not p13 then
        local v46 = v1.ActionNav
        v44 = v46.Confirm
        local v47 = v9
        if not v47 then
            v46 = Enum.ButtonStyle.RobloxRoundDefaultButton
            if v46 then
                v46 = Enum.ButtonStyle.RobloxRoundButton
                if v46 then
                    v47 = v12
                    if not v47 then
                        v46 = Enum.ButtonStyle.RobloxRoundDefaultButton
                        if v46 then
                            v46 = Enum.ButtonStyle.RobloxRoundButton
                        end
                        v44.Style = v46
                        return 
                    end
                end
            end
        end
    end
end
v1.ChangeMode = v18
v18 = function(p14)
    local v48 = _G
    local v49 = v48.Database
    local v73 = 0
    local v50 = 0
    local v51 = 0
    local v52 = {}
    local v53 = v49.Recipes
    local v54 = v53[p14]
    local v55 = v54.CombinationRecipe
    if not v55 then
        v55 = false
        v54 = pairs
        v53 = v49.Recipes
        local v56, v57, v58 = v54(v53)
        for v62, v60 in v56, v57, v58 do
            local v59 = v60.CombinedRecipe
            if v59 == p14 then
                v59 = v1.CheckHasRecipe
                local v63, v64 = v59(v62)
                if not v63 then
                    return true, true
                end
                if not v55 then
                    v55 = true
                end
            end
        end
        v56 = false
        v57 = v55
        return v56, v57
    end
    v62 = v49.Recipes
    v58 = v62[p14]
    local v68, v69, v70 = pairs(v58.Materials)
    for v58, v62 in v68, v69, v70 do
        v51 = v51 + 1
        local v71 = _G
        local v72 = v71.PlayerData
        v64 = v72.Materials
        v63 = v64.Owned
        v60 = v63[v58]
        if not v60 then
            v71 = _G
            v72 = v71.PlayerData
            v64 = v72.Materials
            v63 = v64.Owned
            v60 = v63[v58]
            v63 = 0
            if v60 > v63 then
                v48 = v48 + 1
                v60 = "Has"
                v52[v58] = v60
                v71 = _G
                v72 = v71.PlayerData
                v64 = v72.Materials
                v63 = v64.Owned
                v60 = v63[v58]
                if v60 >= v62 then
                    v50 = v50 + 1
                    v60 = "Completed"
                    v52[v58] = v60
                end
            end
        end
    end
    if v51 < v50 then
        v68 = false
    end
    v68 = true
    v70 = 0
    if v70 <= v73 then
        v69 = false
    end
    v69 = true
    v70 = false
    v58 = 0
    if v73 > v58 then
        if v51 < v50 then
            v58 = false
        end
        v58 = true
        v70 = not v58
    end
    v58 = v52
    return v68, v69, v70, v58
end
v1.CheckHasRecipe = v18
v18 = function()
    local v76 = _G
    local v77 = v76.Database
    local v80, v81, v82 = pairs(v77.Recipes)
    for v86, v84 in v80, v81, v82 do
        local v83 = v84.CombinedRecipe
        if not v83 then
            local v85 = v84.CombinedRecipe
            v83 = v76[v85]
            if not v83 then
                v85 = v84.CombinedRecipe
                v83 = v76[v85]
                v83[v86] = v84
            else
                v83 = v84.CombinedRecipe
                v85 = {}
                v85[v86] = v84
                v76[v83] = v85
            end
        end
    end
    v80 = {}
    v81 = pairs
    v82 = v77.Recipes
    local v87, v88, v86 = v81(v82)
    for v84, v83 in v87, v88, v86 do
        v85 = v83.CombinedRecipe
        if v85 then
            local v89 = {}
            v89.ID = v84
            v89.Data = v83
            v85 = table.insert
            v85(v80, v89)
        end
    end
    v87 = pairs
    v88 = {}
    local v91, v92, v86 = v87(v88)
    for v84, v83 in v91, v92, v86 do
        local v95, v96, v97 = pairs(v80)
        for v114, v99 in v95, v96, v97 do
            local v98 = v99.ID
            v98 = {}
            local v102, v103, v104 = pairs(v83)
            for v106, v107 in v102, v103, v104 do
                local v105 = {}
                v105.ID = v106
                v105.Data = v107
                table.insert(v98, v105)
            end
            v102 = table.sort
            v103 = v98
            v104 = function(p15, p16)
                if p15.ID <= p16.ID then
                    local v112 = false
                end
                v112 = true
                return v112
            end
            v102(v103, v104)
            v80[v114].Data.RecipeList = v98
        end
        if v98 == v84 then
        end
    end
    v91 = table.sort
    v92 = v80
    v86 = function(p17, p18)
        local v118, v119, v120 = v1.CheckHasRecipe(p17.ID)
        local v123, v124, v125 = v1.CheckHasRecipe(p18.ID)
        if p18.Data.SortPriority <= p17.Data.SortPriority then
            local v129 = false
        end
        v129 = true
        return v129
    end
    v91(v92, v86)
    return v80
end
v1.GetRecipes = v18
v18 = function(p19, p20, p21, p22, p23)
    p21.Visible = true
    local v165 = p21:FindFirstChild("Container") or p21
    local v166 = v165.Icon
    local v138 = p20.Image
    v166.Image = v138
    if not p23 then
        v138 = v1
        v166 = v138.CheckHasRecipe
        v138 = p23
        local v139, v140, v141, v142 = v166(v138)
        local v143 = _G
        local v144 = v143.PlayerData
        local v145 = v144.Materials
        local v146 = v145.Owned
        local v147 = v146[p19]
        if not v147 then
            v143 = _G.PlayerData
            v144 = v143.Materials
            v145 = v144.Owned
            v146 = v145[p19]
            v145 = 0
            if v145 <= v146 then
                v147 = false
            end
            v147 = true
        end
        v146 = v165.Amount
        if not v147 then
            v144 = _G.PlayerData.Materials.Owned[p19]
            v143 = "/"
            v148 = p22
            v145 = v144 .. v143 .. v148
            if v145 then
                v144 = "x"
                v143 = p22
                v145 = v144 .. v143
            end
            v146.Text = v145
            v145 = v142[p19]
            v146 = Color3.new
            v145 = 0
            v144 = 140
            v143 = 0
            local v153 = v146(v145, v144, v143)
            if v153 then
                local v154 = v142[p19]
                p19 = p19[129]
                v153 = Color3.new
                v154 = 1
                local v157 = v153(v154, 1, 0)
                if v157 then
                    v157 = Color3.new
                    local v161 = v157(0, 0, 0)
                end
            end
            v165.BorderColor3 = v161
            if not v142[p19] then
                v161 = 2
            else
                v161 = 0
            end
            v165.BorderSizePixel = v161
            return 
            v139 = tonumber
            v140 = p22
            local v163 = v139(v140)
            if not v163 then
                v163 = v165.Amount
                v141 = "x"
                v142 = p22
                v163.Text = v141 .. v142
                return 
            end
            v141 = p22[1]
            v142 = p22[2]
            if v141 ~= v142 then
                v141 = p22[1]
                v142 = "-"
                v147 = p22[2]
                v164 = v141 .. v142 .. v147
                if v164 then
                    v164 = p22[1]
                end
                v165.Amount.Text = v164
                return 
            end
        end
    end
end
v1.MakeMaterialFrame = v18
v18 = function(p24, p25, p26)
    local v170 = _G.Database.Recipes
    local v185 = 1
    local v172, v173, v174 = pairs(v170[p24].Materials)
    for v180, v183 in v172, v173, v174 do
        local v184 = p24
        if v184 then
            v184 = nil
        end
        v1.MakeMaterialFrame(v180, _G.Database.Materials[v180], p25["Material" .. v170], v183, v184)
        v170 = v170 + 1
    end
    return 
    if not p26 then
    end
end
v1.MakeMaterialFrames = v18
v18 = function()
    print("pressed")
    local v198 = v1.Mode
    v199 = v199 ^ "print"
    v199 = false
    v199 = true
    v198 = nil
    if not v199 then
        v198 = v12
    else
        v198 = v9
    end
    print(v198, v12, v9, v1.Mode)
    if not v198 then
        v1[v1.Mode](v198)
    end
end
v1.ActionConfirmButtonFunction = v18
v18 = function(p27, p28, p29)
    local v211 = v1
    local v213 = v211.GUI.Action
    local v229 = v213.Craft
    if not p27 then
        if not p29 then
            v211 = pairs
            local v215, v216, v217 = v211(v229.Recipe:GetChildren())
            for v221, v219 in v215, v216, v217 do
                v219.Container.Icon.Image = ""
                v219.Container.Amount.Text = ""
            end
            v217 = v229.Reward
            v216 = v217.Container
            v215 = v216.Icon
            v216 = ""
            v215.Image = v216
            v217 = v229.Reward
            v216 = v217.Container
            v215 = v216.Amount
            v216 = ""
            v215.Text = v216
            v217 = v229.Reward
            v216 = v217.Container
            v215 = v216.ItemName
            v216 = ""
            v215.Text = v216
            v215 = v213.Confirm
            v216 = Enum.ButtonStyle.RobloxRoundButton
            v215.Style = v216
            v215 = nil
            v12 = v215
            return 
        end
        v221 = _G
        v217 = v221.Database
        v216 = v217.Recipes
        v215 = v216[p27]
        v217 = v1
        v216 = v217.CheckHasRecipe
        v217 = p27
        local v222 = v216(v217)
        v221 = v1
        v221 = p27
        v219 = v229.Recipe
        v221.MakeMaterialFrames(v221, v219)
        local v224 = {}
        v224.ItemID = v215.RewardItem or v215
        v220 = v229.Reward
        v220 = v224
        v11.MakeItemFrame(v220.Container, v220)
        v213.Confirm.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
        v12 = p27
        return 
    end
end
v1.UpdateCraftConfirm = v18
v18 = {}
v19 = function(p30, p31, p32)
    p32 = not p31.Result.Confirm.Visible
    local v240 = v1
    local v254 = v240.RecipesFrame
    local v241, v242, v237 = pairs(v254.Container:GetChildren())
    for v240, v243 in v241, v242, v254 do
        if v243 ~= p31 then
            v1.UpdateCraftConfirmMobile(nil, v243, false)
        end
    end
    if not p31 then
        v242 = p31.Result
        v241 = v242.Confirm
        v241.Visible = p32
        v254 = p31.Result
        v242 = v254.Container
        v241 = v242.Craft
        if not p32 then
            v242 = "Cancel"
        else
            v242 = "Craft"
        end
        v241.Text = v242
        v254 = p31.Result
        v242 = v254.Container
        v241 = v242.Craft
        if not p32 then
            v242 = Color3.new
            v254 = 1
            v240 = 1
            v243 = 1
            local v248 = v242(v254, v240, v243)
            if v248 then
                v248 = Color3.fromRGB
                local v252 = v248(159, 255, 130)
            end
            v241.TextColor3 = v252
            return 
        end
    end
end
v1.UpdateCraftConfirmMobile = v19
v19 = function(p33)
    if p33 then
        return false
    end
    local v258 = _G
    local v259 = v258.Database
    local v260 = v259.SalvageRewards
    local v261 = v260[p33]
    if v261 then
        v258 = _G
        v259 = v258.Database
        v260 = v259.SalvageRewards
        v258 = _G.Database.Item[p33]
        v259 = v258.Rarity
        v261 = v260[v259]
    end
    local v266 = v261
    if not v266 then
        v266 = v261.Rewards
    end
    v264 = v14
    local v267 = v264[p33]
    local v268 = not v267
    if not v268 then
        v262 = _G.Database
        v263 = v262.Item
        v264 = v263[p33]
        v267 = v264.Event
        v268 = false
        v262 = _G
        v263 = v262.Database
        v264 = v263.SalvageRewards
        v267 = v264[p33]
        v268 = false
        v262 = _G.Database
        v263 = v262.Item
        v264 = v263[p33]
        v267 = v264.Season
        v268 = false
        v262 = _G.Database
        v263 = v262.Item
        v264 = v263[p33]
        v267 = v264.ItemType
        v268 = v266
    end
    if not v268 then
        v267 = v266
        if v267 then
            v267 = false
        end
        return v267
    end
end
v1.CheckSalvageable = v19
v19 = function(p34)
    local v273 = v1.CheckSalvageable(p34)
    local v316 = {}
    v316.ItemID = p34
    v11.MakeItemFrame(v1.SalvageConfirmFrame, v316)
    local v277 = v1
    local v278 = v277.SalvageConfirmFrame
    local v279 = v278.Icon
    local v280 = v279.ItemName
    if not v273 then
        v278 = v6
        local v281 = _G
        local v282 = v281.Database
        local v283 = v282.Item
        local v284 = v283[p34]
        v277 = v284.Rarity
        v279 = v278[v277]
        if v279 then
            v279 = Color3.new
            v278 = 0.5
            v277 = 0.5
            v284 = 0.5
            local v285 = v279(v278, v277, v284)
        end
        v280.TextColor3 = v285
        local v286 = v1
        v285 = v286.SalvageConfirmFrame
        v280 = v285.Icon
        if not v273 then
            v285 = Color3.new
            v286 = 1
            local v289 = v285(v286, 1, 1)
            if v289 then
                v289 = Color3.new
                local v293 = v289(0.2, 0.2, 0.2)
            end
            v280.ImageColor3 = v293
            v293 = v1
            v280 = v293.SalvageConfirmFrame
            local v295 = v280:FindFirstChild("Rewards")
            if v295 then
                v293 = v1
                v295 = v293.SalvageConfirmFrame
            end
            v293 = pairs
            local v297, v298, v299 = v293(v295:GetChildren())
            for v300, v283 in v297, v298, v299 do
                v282 = false
                v283.Visible = v282
            end
            v297 = print
            v298 = tostring
            v299 = v273
            v297(v298(v299))
            if not v273 then
                v9 = p34
                local v301 = 1
                local v304, v305, v300 = pairs(v273)
                for v283, v282 in v304, v305, v300 do
                    v281 = v295["Material" .. v301]
                    v1.MakeMaterialFrame(v283, _G.Database.Materials[v283], v281, v282.Amount)
                    v301 = v301 + 1
                end
                v304 = print
                v305 = tostring
                v300 = v9
                v304(v305(v300))
            else
                v301 = nil
                v9 = v301
            end
            local v312 = v1
            v301 = v312.SalvageConfirmButton
            if not v9 then
                v312 = Enum.ButtonStyle.RobloxRoundDefaultButton
                if v312 then
                    v312 = Enum.ButtonStyle.RobloxRoundButton
                end
                v301.Style = v312
                return 
            end
        end
    end
end
v1.ShowSalvageRewards = v19
v19 = function(p35, p36)
    local v325 = not p36.Cancel.Visible
    local v326 = v1
    local v327 = v326.SalvageInventoryFrame
    local v328, v329, v327 = pairs(v327.Container:GetChildren())
    for v326, v331 in v328, v329, v327 do
        v331.Container.Cancel.Visible = false
        v331.Container.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
    end
    v328 = p36.Cancel
    v328.Visible = v325
    if not v325 then
        v328 = Color3.fromRGB
        v329 = 130
        v327 = 130
        v326 = 130
        local v337 = v328(v329, v327, v326)
        if v337 then
            v337 = Color3.fromRGB
            local v341 = v337(54, 54, 54)
        end
        p36.BackgroundColor3 = v341
        if not v325 then
            v341 = v1.ShowSalvageRewards
            v341(p35)
        else
            v1.ShowSalvageRewards(nil)
        end
        v1.SalvageConfirmFrame.Visible = v325
        return 
    end
end
v1.SalvageConfirmMobile = v19
v19 = function(p37, p38)
    v11.MakeItemFrame(p37, p38)
    local v357 = p38.ItemID
    local v389 = not v1.CheckSalvageable(v357)
    p37.Container.Cover.Visible = v389
    local v364 = p37.Container:FindFirstChild("Cancel")
    if not v364 then
        v389 = p37.Container.Cancel
        v364 = v389.MouseButton1Click
        v364:connect(function()
            p37.Container.Cancel.Visible = false
            p37.Container.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
            v1.SalvageConfirmFrame.Visible = false
        end)
    end
    p37.Container.Button.MouseButton1Click:connect(function()
        v1.SalvageConfirm(v357, p37.Container)
    end)
end
v1.MakeSalvageItemFrame = v19
v19 = function(p39, p40, p41)
    local v394 = p40.Data
    local v395 = p40.ID
    local v396 = _G
    local v398 = v396.Database.Materials
    local v423 = v394.CombinationRecipe
    if v423 then
        v423 = p39.RecipeName
        v396 = v394.Name
        v423.Text = v396
        v423 = p39.RecipeName
        v396 = v6[v394.Rarity]
        v423.TextColor3 = v396
        v396 = p39.Result.Container
        v423 = v396.Icon
        v396 = v394.Image
        v423.Image = v396
        v396 = v1
        v423 = v396.MakeMaterialFrames
        v396 = v395
        v423(v396, p39.Materials, true)
        local v403, v404, v405 = v1.CheckHasRecipe(v395)
        if not v403 then
            p39.Complete.Visible = true
            p39.Result.Container.Craft.Visible = true
            p39.Result.Container.Craft.MouseButton1Click:connect(function()
                v1.CraftConfirm(v395, p39)
            end)
        else
            if not v404 then
                v407 = true
                p39.InProgress.Visible = v407
            end
        end
        v414 = p39.Result
        local v416 = v414:FindFirstChild("Confirm")
        if not v416 then
            v407 = p39.Result.Confirm
            v416 = v407.MouseButton1Click
            v416:connect(function()
                v1.Craft(v395, true)
            end)
        end
        v407 = not v404
        p39.Missing.Visible = v407
    end
end
v1.CreateRecipeFrame = v19
v19 = function()
    v11.CreateGrid(v1.MakeSalvageItemFrame, v1.NewItemFrame, v11.GetSortedInventory(), v1.SalvageInventoryFrame)
end
v1.GenerateSalvageInventory = v19
v19 = function()
    v11.CreateList(v1.CreateRecipeFrame, v1.NewRecipeFrame, v1.GetRecipes(), v1.RecipesFrame)
end
v1.GenerateRecipes = v19
v22 = game
v24 = v22.ReplicatedStorage
v20 = v24.UpdateSalvageClient
v19 = v20.Event
v24 = function()
    v1.GenerateSalvageInventory()
end
v19:connect(v24)
local function v460()
    local v462 = v1.SalvageGUI
    v462.Claim.Style = Enum.ButtonStyle.RobloxRoundButton
    v462.Claim.Text = "Salvaging..."
    v1.GUI.Visible = false
    _G.Process("Salvaging")
    local v471 = game.ReplicatedStorage.Remotes.Inventory.Salvage:InvokeServer(v9)
    local v577 = v9
    v9 = nil
    v1.ShowSalvageRewards(nil)
    v1.GenerateSalvageInventory()
    v1.GenerateRecipes()
    local v478 = v462.Main.Item1.Container
    local v584 = v462.Main.Item2.Container
    local v587 = v462.Main.Item3.Container
    v478.Icon.Image = ""
    v478.ItemName.Text = ""
    v584.Icon.Image = ""
    v584.ItemName.Text = ""
    v587.Icon.Image = ""
    v587.ItemName.Text = ""
    local v479 = 0.75
    local v481 = time()
    local v482 = v481 - time()
    wait(v479 - v482)
    if not v471 then
        _G.Process(nil)
        v479 = v11
        v481 = _G.Database.Item
        v482 = v481[v577]
        v479 = v482.Image
        v478.Icon.Image = v479.GetImage(v479)
        v481 = _G.Database
        v482 = v481.Item
        v478.ItemName.Text = v482[v577].ItemName
        local v491 = _G
        v481 = v491.Database.Item[v577]
        v482 = v481.Rarity
        v478.ItemName.TextColor3 = v6[v482]
        v462.Visible = true
        wait(0.5)
        v482 = 0
        v481 = 0
        v478.Slider:TweenPosition(UDim2.new(v482, v481, 0, 0), "Out", "Quad", 0.2)
        v584.Slider:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2)
        v587.Slider:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2)
        wait(0.5)
        local v521, v522, v523 = pairs(v471)
        for v526, v531 in v521, v522, v523 do
            v491 = v462.Main
            local v529 = v491["Item" .. v526].Container
            v491 = _G.Database.Materials[v531.ID].Image
            v529.Icon.Image = v491
            v491 = _G.Database.Materials[v531.ID].Name .. " [x" .. v531.Amount .. "]"
            v529.ItemName.Text = v491
            v491 = v6[_G.Database.Materials[v531.ID].Rarity]
            v529.ItemName.TextColor3 = v491
        end
        v521 = v478.Slider
        v523 = UDim2.new
        v526 = 0
        v531 = 0
        v529 = -1
        v528 = 0
        v521:TweenPosition(v523(v526, v531, v529, v528), "Out", "Quad", 0.2)
        v584.Slider:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 0.2)
        v587.Slider:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 0.2)
        v522 = 0.4
        wait(v522)
        v462.Claim.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
        v462.Claim.Text = "Claim!"
        require(script.Parent.Christmas2018).GenerateInventory()
    end
end
v1.Salvage = v460
v460 = function(p42, p43)
    v1.GUI.Visible = false
    _G.Process("Crafting")
    local v649, v647, v650 = game.ReplicatedStorage.Remotes.Inventory.Craft:InvokeServer(p42)
    v1.GenerateRecipes()
    if v1.CheckHasRecipe(p42) then
        v1.CraftConfirm(nil, nil, true)
    end
    local v658 = 0.75
    local v660 = time()
    local v661 = v660 - time()
    wait(v658 - v661)
    _G.Process(nil)
    v1.GUI.Visible = true
    local v685 = _G.ViewLobbyFrame
    _G.ViewLobbyFrame("Inventory")
    if not v649 then
        v658 = "You Crafted..."
        v660 = v1
        v661 = v660.GUI
        v660 = v650
        _G.NewItem(v649, v658, v661, v660)
    end
    game.ReplicatedStorage.UpdateSalvageClient:Fire()
end
v1.Craft = v460
v22 = game
v20 = v22.ReplicatedStorage.UpdateSync
v460 = v20.OnClientEvent
v460:connect(function()
    Refresh()
end)
return v1
