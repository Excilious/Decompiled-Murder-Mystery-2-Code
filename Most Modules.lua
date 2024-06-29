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

//
return function(p1)
    return math.floor(375 + math.sqrt(9375 + 4500 * p1) / 750)
    return 1
end

//

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

//

local v1 = {}
local v4 = game:GetService("ContextActionService")
local function v5(p1, p2, p3)
    v4:BindAction(p1, function(p4, p5)
        local v7 = Enum.UserInputState.Begin
        if p5 == v7 then
            v7 = _G.PauseBinds
            if v7 then
                v7 = p3
                v7()
            end
        end
    end, false, p2)
end
v1.Bind = v5
v5 = function(p6, p7, p8)
    v4:UnbindAction(p6)
end
v1.Unbind = v5
return v1

//

local v1 = {}
local v4 = game.ReplicatedStorage
local v7 = require(v4.Modules.GridCreator)
v4 = game
local v8 = v4.ReplicatedStorage.ChristmasEvents2018
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.CurrentTierBuy = 1
v1.BuyTiersFrame = nil
v4 = game.ReplicatedStorage
local v9 = v4.GetSyncData:InvokeServer()
v4 = nil
v1.NewPassTierRewardObject = v4
v4 = nil
v1.NewPassPageObject = v4
v4 = nil
v1.PassTierRewardObjectFunction = v4
v4 = function(p1, p2, p3, p4)
    v9 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v37 = v9.ChristmasPass2018
    v7.CreatePass(p3, p1, v37, v1.BattlePassFrame, p2)
    local v22 = _G.PlayerData
    local v23 = v22.Christmas2018
    v1.YourTier.Text = "Your Tier: " .. v23.CurrentTier
    local v47 = _G.PlayerData.Christmas2018.CurrentTier
    local v48 = v37.TotalTiers
    if v47 >= v48 then
        v47 = v47 - 1
    end
    v48 = math.floor
    local v25 = v48(v47 / 5)
    if p4 then
        v22 = v1
        v23 = v22.BattlePassFrame
        local v27, v28, v22 = pairs(v23:GetChildren())
        for v21, v30 in v27, v28, v22 do
            if v30.Name ~= "Page" .. v25 then
                local v34 = false
            end
            v34 = true
            v30.Visible = v34
        end
        v27 = v1
        v27.CurrentPassPage = v25
    end
    v27 = v1
    v28 = 1
    v27.CurrentTierBuy = v28
    v28 = v1
    v27 = v28.ChangeBuyTiers
    v28 = 0
    v27(v28)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v4
v4 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v54 = tostring(p7)
    local v60 = v9
    local v82 = v60.ChristmasPass2018
    local v83 = v82.Rewards
    local v84 = v83[v54]
    local v85 = false
    local v87 = p6.ItemID
    if not v87 then
        v83 = v7
        v87 = v83.MakeItemFrame
        v83 = p5
        v82 = p6
        v60 = false
        v87(v83, v82, v60)
        local v61 = v4
        local v62 = v61[p5]
        if v62 then
            v62 = v4
            v61 = p5.Claim.MouseButton1Click
            v62[p5] = v61:connect(function()
                p5.Claim.Visible = false
                local v73 = _G.PlayerData.Christmas2018.ClaimedRewards[v54]
                v1.ClaimReward(v54)
            end)
        end
    end
    v62 = p5.Locked
    v63 = _G.PlayerData.Christmas2018.CurrentTier
    if v63 <= p7 then
        v77 = false
    end
    v77 = true
    v62.Visible = v77
    v62 = p5.Next
    v63 = _G.PlayerData.Christmas2018.CurrentTier + 1
    if v63 ~= p7 then
        v77 = false
    end
    v77 = true
    v62.Visible = v77
    v62 = p5.Claim
    v77 = false
    v63 = _G.PlayerData.Christmas2018.CurrentTier
    if v63 >= p7 then
        v77 = not _G.PlayerData.Christmas2018.ClaimedRewards[v54]
        if not v77 then
            v77 = true
        end
    end
    v62.Visible = v77
    v77 = p5.Title
    v62 = v77.TierNumber
    v62.Text = p7
end
v1.ChangePage = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v108 = v1
    local v98, v99, v96 = pairs(v108.BattlePassFrame:GetChildren())
    for v95, v101 in v98, v99, v108 do
        if v101.Name ~= "Page" .. v1.CurrentPassPage then
            local v106 = false
        end
        v106 = true
        v101.Visible = v106
    end
end
v1.ChangeBuyTiers = function(p9)
    local v113 = _G.PlayerData.Christmas2018.CurrentTier
    local v125 = v9.ChristmasPass2018.TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v131 = v1.CurrentTierBuy
    local v132 = 1
    if v132 > v131 then
        v131 = v1
        v132 = 1
        v131.CurrentTierBuy = v132
    end
    local v134 = v1.CurrentTierBuy
    local v135 = v134 + v113
    if v135 > v125 then
        v135 = v1
        v134 = v125 - v113
        v135.CurrentTierBuy = v134
    end
    local v138 = v1.CurrentTierBuy
    local v139 = 1
    if v138 > v139 then
        v134 = "s"
    else
        v134 = ""
    end
    v139 = v1
    v138 = v139.BuyTiersFrame
    v138.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v134)
    local v145 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v146 = v1
    local v147 = v146.CurrentTierBuy
    local v148 = v147 * v9.ChristmasPass2018.TierCost
    v145.Text = v148
    if v113 >= v125 then
        v147 = v1
        v148 = v147.BuyTiersFrame
        v145 = v148.Parent
        v148 = false
        v145.Visible = v148
        v146 = v1
        v147 = v146.BattlePassFrame
        v148 = v147.Parent
        v145 = v148.PassComplete
        v148 = true
        v145.Visible = v148
    end
end
v1.BuyTiers = function()
    local v150 = v1.CurrentTierBuy
    local v179 = _G.PlayerData.Materials.Owned.Logs2018 or 0
    local v180 = v9
    local v183 = v180.ChristmasPass2018.TierCost * v150
    if v183 < v179 then
        v180 = false
    end
    print("Tiers To Buy: " .. v150)
    local v187 = "Current Tier: "
    local v159 = _G
    local v160 = v159.PlayerData
    local v161 = v160.Christmas2018
    local v188 = v161.CurrentTier
    print(v187 .. v188)
    if not true then
        v187 = v150
        v8.BuyTiers:FireServer(v187)
        v188 = _G
        v159 = _G
        v160 = v159.PlayerData
        v161 = v160.Materials
        v188 = v161.Owned
        v188.PlayerData.Materials.Owned.Logs2018 = v188.Logs2018 - v183
        v160 = _G
        v161 = v160.PlayerData
        v188 = v161.Christmas2018
        _G.PlayerData.Christmas2018.CurrentTier = v188.CurrentTier + v150
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v161 = v1
        v188 = v161.CurrentTierBuy
        print("Tiers To Buy: " .. v188)
        v159 = _G
        v160 = v159.PlayerData
        v161 = v160.Christmas2018
        v188 = v161.CurrentTier
        print("Current Tier: " .. v188)
        v1.UpdateCandies()
        v188 = v1
        v161 = v1
        v188 = v161.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v188.NewPassPageObject, v188)
        return true
    end
    return false, v183 - v179
end
v1.ClaimReward = function(p10)
    local v210 = tostring(p10)
    local v211 = v9
    local v212 = v211.ChristmasPass2018
    local v213 = v212.Rewards
    local v214 = v213[v210]
    if not v214 then
        v213 = v214.ItemID
        v212 = print
        v211 = v213
        v212(v211)
        local v215 = _G
        local v218 = v215.PlayerData.Christmas2018.CurrentTier
        local v219 = tonumber(v210)
        if v218 >= v219 then
            v215 = _G.PlayerData
            v219 = v215.Christmas2018.ClaimedRewards
            v218 = v219[v210]
            v215 = _G
            v219 = v215.PlayerData.Christmas2018
            v218 = v219.ClaimedRewards
            v219 = true
            v218[v210] = v219
            v218 = v214.ItemType
            v218 = v214.ItemType
            v218 = v214.ItemType
            v215 = _G.PlayerData
            v219 = v215[v214.ItemType].Owned
            v218 = v219[v213]
            v215 = _G.PlayerData
            local v235 = v214.ItemType
            local v236 = v215[v235]
            v219 = v236.Owned
            if not v218 then
                v215 = v214.Amount
                v236 = v218 + v215
                if v236 then
                    v236 = v214.Amount
                end
                v219[v213] = v236
                v235 = _G
                v215 = v235.PlayerData
                v235 = v214.ItemType
                v236 = v215[v235]
                v219 = v236.Owned
                v236 = v213
                v218 = table.insert
                v218(v219, v236)
                v215 = v1
                v235 = v1
                v215 = v235.PassTierRewardObjectFunction
                v235 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v215.NewPassPageObject, v215, v235)
                v8.ClaimReward:FireServer(v210)
                return 
                return 
            end
        end
    end
end
v1.UpdateCandies = function()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned.Logs2018 or 0)
end
return v1
//

local v1 = {}
v1.XPTable = {}
local function GetTotalXP_1(p1)
    return 1000 + 225 * p1 * p1 - 225 * p1 * 0.5 * p1 - 1 - 1000 - 225
end
(function(p2)
    local v20 = 0
    local v21 = 1
    for v21 = v21, 100, 1 do
        local v24 = v21 - 1
        local v51 = 225
        local v52 = 0.5
        local v53 = v21 - 1
        local v54 = v52 * v53
        local v55 = v21 * v54
        v20 = v20 + 1000 + 225 * v21 * v21 - v51 * v55 - 1000 - 225 - 1000 + 225 * v24 * v24 - 225 * v24 * 0.5 * v24 - 1 - 1000 - 225
        local v61 = v1
        local v62 = v61.XPTable
        v62[v21] = v20
        if not p2 then
            v62 = print
            v61 = "Level: "
            v51 = v21
            v55 = " XP: "
            v54 = v21
            v53 = 1000 + 225 * v21 * v21 - 225 * v21 * 0.5 * v21 - 1
            v52 = v53 - 1000 - 225
            v62(v61, v51, v55, v54, v52)
        end
    end
end)()
local function v69(p3)
    p3 = p3 or 0
    local v70 = 1237500
    if p3 >= v70 then
        v70 = 100
        return v70, v1.XPTable[100]
    end
    v71 = v1
    local v76, v77, v72 = pairs(v71.XPTable)
    for v71, v81 in v76, v77, v72 do
        local v79 = v1.XPTable
        local v82 = v71 + 1
        local v80 = v79[v82]
        if p3 >= v81 then
            if v80 > p3 then
                v79 = v71
                v82 = v80
                return v79, v82
            end
        end
    end
    v76 = 1
    v71 = v1
    v72 = v71.XPTable
    v77 = v72[2]
    return v76, v77
end
v1.GetLevel = v69
v69 = function(p4)
    p4 = p4 or 1
    local v83 = p4
    return 1000 + 225 * v83 * v83 - 225 * v83 * 0.5 * v83 - 1 - 1000 - 225
end
v1.GetXP = v69
v69 = function(p5)
    local v100, v101 = v1.GetLevel(p5)
    local v104 = v1.GetXP(v100)
    return p5 - v104 / v101 - v104
end
v1.GetProgressToNextLevel = v69
return v1

//
local v1 = {}
local v2 = {}
local v3 = true
v2.Weapons = v3
v3 = true
v2.Pets = v3
v3 = _G.Database.Rarities
local function GetImage_1(p1)
    local v9 = _G.Cache[p1]
    v9 = _G.Cache[p1]
    return v9
    local v10 = tonumber(p1)
    if not v10 then
        v10 = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId="
        local v12 = v10 .. p1
        if v12 then
            v12 = p1
        end
        v10 = v12
        local v22 = v10 .. "&bust=" .. math.random(1, 10000)
        v10 = _G.Cache
        v10[p1] = v22
        return v22
    end
end
v1.GetImage = GetImage_1
v1.GetImageSmall = function(p2)
    local v27 = _G.SmallCache[p2]
    v27 = _G.SmallCache[p2]
    return v27
    local v28 = tonumber(p2)
    if not v28 then
        v28 = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=110&height=110&assetId="
        local v30 = v28 .. p2
        if v30 then
            v30 = p2
        end
        v28 = v30
        local v40 = v28 .. "&bust=" .. math.random(1, 10000)
        v28 = _G.SmallCache
        v28[p2] = v40
        return v40
    end
end
local v42 = {}
local function v43(p3, p4)
    local v46 = p4.Chroma
    local v47 = false
    p3.Tags.Chroma.Visible = true
end
v42.Chroma = v43
v43 = function(p5, p6)
    local v51 = p6.EvoBaseID
    local v52 = false
    p5.Tags.Evo.Visible = true
end
v42.Evo = v43
v43 = function(p7, p8)
    local v54 = v2
    local v55 = p8.DataType
    local v56 = v54[v55]
    if v56 then
        v54 = p7.Tags
        v56 = v54.Halloween
        v55 = p8.Event
        v54 = false
        v54 = true
        v56.Visible = v54
        v55 = p7.Tags
        v54 = v55.Halloween
        v56 = v54.Year
        v55 = p8.Year
        v54 = v55 or ""
        v56.Text = v54
    end
end
v42.Halloween = v43
v43 = function(p9, p10)
    local v57 = v2
    local v58 = p10.DataType
    local v59 = v57[v58]
    if v59 then
        v57 = p9.Tags
        v59 = v57.Christmas
        v58 = p10.Event
        v57 = false
        v57 = true
        v59.Visible = v57
        v58 = p9.Tags
        v57 = v58.Christmas
        v59 = v57.Year
        v58 = p10.Year
        v57 = v58 or ""
        v59.Text = v57
    end
end
v42.Christmas = v43
v43 = function(p11, p12, p13, p14)
    p11.ItemName.Label.Text = ""
    p11.Container.Icon.Image = ""
    p11.Container.Amount.Text = ""
    p11.ItemName.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
    local v66, v67, v68 = pairs(p11.Tags:GetChildren())
    for v73, v71 in v66, v67, v68 do
        local v72 = v71:IsA("Frame")
        if not v72 then
            v72 = false
            v71.Visible = v72
        end
    end
    return 
    v67 = p11.ItemName
    v66 = v67.Label
    v67 = p12.ItemName
    if v67 then
        v67 = p12.Name
    end
    v66.Text = v67
    v67 = p12.Rarity
    v66 = v67 or "Common"
    p12.Rarity = v66
    v68 = v3
    v73 = p12.Rarity
    v67 = v68[v73]
    v66 = v67.Color
    v67 = Color3.fromRGB
    v68 = v66.r
    v73 = v66.g
    v71 = v66.b
    local v74 = v67(v68, v73, v71)
    if v74 then
        v74 = Color3.new
        local v78 = v74(1, 1, 1)
    end
    p11.ItemName.BackgroundColor3 = v78
    local v82 = GetImage_1(p12.Image)
    p11.Container.Icon.Image = v82
    local v84 = p11.Container:FindFirstChild("Amount")
    if not v84 then
        v84 = p13
        if v84 then
            v84 = p12.Amount
        end
        local v85 = p11.Container
        v82 = v85.Amount
        if not v84 then
            v72 = 1
            if v84 > v72 then
                v72 = "x"
                local v86 = v84
                v85 = v72 .. v86
                if v85 then
                    v85 = ""
                end
                v82.Text = v85
                v84 = p11.Container
                v85 = "Classic"
                local v87 = v84:FindFirstChild(v85)
                if not v87 then
                    v82 = p11.Container
                    v87 = v82.Classic
                    local v88 = p12.Classic
                    v82 = false
                    v82 = true
                    v87.Visible = v82
                end
                v88 = "ColoredName"
                local v89 = p11.ItemName:FindFirstChild(v88)
                if not v89 then
                    v82 = p11.ItemName
                    v89 = v82.ColoredName
                    v82 = p12.ItemName
                    if v82 then
                        v82 = p12.Name
                    end
                    v89.Text = v82
                    v89 = v78
                    v82 = p12.Rarity
                    v82 = Color3.new
                    v72 = 1
                    v86 = 1
                    v89 = v82(1, v72, v86)
                    p11.ItemName.ColoredName.TextColor3 = v89
                    p11.ItemName.RarityBar.BackgroundColor3 = v89
                end
                v91 = v42
                local v93, v94, v92 = pairs(v91)
                for v97, v99 in v93, v94, v92 do
                    local v98 = p11.Tags:FindFirstChild(v97)
                    if not v98 then
                        v98 = v99
                        v98(p11, p12)
                    end
                end
                v93 = p12.Signature
                if not v93 then
                    v93 = p12.Signature
                    v97 = p11.Tags
                    v92 = v97.Unique
                    v94 = v92.PlayerName
                    v97 = v93
                    v99 = "'s"
                    v92 = v97 .. v99
                    v94.Text = v92
                    v92 = p11.Tags
                    v94 = v92.Unique
                    v92 = true
                    v94.Visible = v92
                    v94 = tonumber
                    v92 = v93
                    local v102 = v94(v92)
                    if not v102 then
                        v102 = spawn
                        v102(function()
                            p11.Tags.Unique.PlayerName.Text = game.Players:GetNameFromUserIdAsync(math.abs(p12.Signature)) .. "'s"
                        end)
                    end
                    local v117 = p11.Container
                    local v118 = v117.Amount
                    v97 = p12.Rank
                    if not v97 then
                        v97 = "#"
                        v99 = p12.Rank
                        v117 = v97 .. v99
                        if v117 then
                            v117 = ""
                        end
                        v118.Text = v117
                        if not p14 then
                            v93 = pairs
                            v118 = p11.Tags
                            local v119, v120, v117 = v93(v118:GetChildren())
                            for v97, v99 in v119, v120, v117 do
                                local v123 = v99:IsA("Frame")
                                if not v123 then
                                    v123 = v99.Visible
                                    v99:Destroy()
                                end
                            end
                            v120 = p11.Tags
                            v119 = #v120:GetChildren()
                            v119 = p11.Tags
                            v119:Destroy()
                        end
                        return 
                    end
                end
            end
        end
    end
end
v1.DisplayItem = v43
v43 = function(p15)
    p15 = tostring(p15)
    local v153 = p15
    while true do
        local v151, v152 = string.gsub(v153, "^(-?%d+)(%d%d%d)", "%1,%2")
        k = v152
        v153 = v151
        v151 = k
    end
    return v153
end
v1.Commafy = v43
v43 = function(p16, p17, p18)
    local v155 = p16:Clone()
    local v157 = p16.AbsoluteSize.X
    local v211 = p16.AbsoluteSize.Y
    v155.Size = UDim2.new(0, v157, 0, v211)
    v155.BackgroundTransparency = 1
    v155.Position = UDim2.new(0, p16.AbsolutePosition.X + v157 / 2, 0, p16.AbsolutePosition.Y + v211 / 2)
    v155.AnchorPoint = Vector2.new(0.5, 0.5)
    v155.ZIndex = 10
    v155.Parent = p18
    spawn(function()
        v155:TweenSizeAndPosition(UDim2.new(0, 25, 0, 25), UDim2.new(0, p17.AbsolutePosition.X + p17.AbsoluteSize.X / 2 - 3, 0, p17.AbsolutePosition.Y + p17.AbsoluteSize.Y / 2 - 20), "InOut", "Sine", 0.5)
        wait(0.5)
        v155:Destroy()
    end)
end
v1.AnimateItemIconIntoInventory = v43
return v1

//

local v1 = {}
local v3 = game
local v4 = v3.ReplicatedStorage
local v7 = require(v4.Modules.GridCreator)
v4 = game
local v8 = v4.ReplicatedStorage.HalloweenEvents2019
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.CurrentTierBuy = 1
v1.BuyTiersFrame = nil
v1.LeaderboardFrames = {}
v3 = game
v4 = v3.ReplicatedStorage
local v9 = v4.GetSyncData:InvokeServer()
v4 = nil
v1.NewPassTierRewardObject = v4
v4 = nil
v1.NewPassPageObject = v4
v4 = nil
v1.PassTierRewardObjectFunction = v4
v4 = function(p1, p2, p3, p4)
    v9 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v37 = v9.HalloweenPass2019
    v7.CreatePass(p3, p1, v37, v1.BattlePassFrame, p2)
    local v22 = _G.PlayerData
    local v23 = v22.Halloween2019
    v1.YourTier.Text = "Your Tier: " .. v23.CurrentTier
    local v47 = _G.PlayerData.Halloween2019.CurrentTier
    local v48 = v37.TotalTiers
    if v47 >= v48 then
        v47 = v47 - 1
    end
    v48 = math.floor
    local v25 = v48(v47 / 5)
    if p4 then
        v22 = v1
        v23 = v22.BattlePassFrame
        local v27, v28, v22 = pairs(v23:GetChildren())
        for v21, v30 in v27, v28, v22 do
            if v30.Name ~= "Page" .. v25 then
                local v34 = false
            end
            v34 = true
            v30.Visible = v34
        end
        v27 = v1
        v27.CurrentPassPage = v25
    end
    v27 = v1
    v28 = 1
    v27.CurrentTierBuy = v28
    v28 = v1
    v27 = v28.ChangeBuyTiers
    v28 = 0
    v27(v28)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v4
v4 = {}
v3 = function(p5, p6, p7)
    local v52 = p6.Traveller
    v52 = p5.Container.Icon
    v52.Image = p6.Image
    local v95 = "???"
    p5.Title.TierNumber.Text = v95
    local v57 = _G.PlayerData.Halloween2019.CurrentTier
    if p7 < v57 then
        v95 = false
    end
    local v97 = true
    p5.Enter.Visible = v97
    v57 = _G.PlayerData.Halloween2019.CurrentTier + 1
    if v57 ~= p7 then
        v97 = false
    end
    local v102 = true
    p5.Next.Visible = v102
    v57 = _G.PlayerData.Halloween2019.CurrentTier
    if v57 <= p7 then
        v102 = false
    end
    p5.Locked.Visible = true
    p5.Claim.Visible = false
    v57 = function()
        v1.GUI.BattlePassFrame.Visible = false
        v1.GUI.TravellerFrame.Visible = true
    end
    p5.Enter.MouseButton1Click:connect(v57)
    return 
    local v68 = tostring(p7)
    local v116 = v9
    local v117 = v116.HalloweenPass2019
    local v118 = v117.Rewards
    local v119 = v118[v68]
    local v120 = false
    local v122 = p6.ItemID
    if not v122 then
        v118 = v7
        v122 = v118.MakeItemFrame
        v118 = p5
        v117 = p6
        v116 = false
        v122(v118, v117, v116)
        local v71 = v4
        local v72 = v71[p5]
        if v72 then
            v72 = v4
            v71 = p5.Claim.MouseButton1Click
            v72[p5] = v71:connect(function()
                p5.Claim.Visible = false
                local v83 = _G.PlayerData.Halloween2019.ClaimedRewards[v68]
                v1.ClaimReward(v68)
            end)
        end
    end
    v72 = p5.Locked
    v73 = _G.PlayerData.Halloween2019.CurrentTier
    if v73 <= p7 then
        v87 = false
    end
    v87 = true
    v72.Visible = v87
    v72 = p5.Next
    v73 = _G.PlayerData.Halloween2019.CurrentTier + 1
    if v73 ~= p7 then
        v87 = false
    end
    v87 = true
    v72.Visible = v87
    v72 = p5.Claim
    v87 = false
    v73 = _G.PlayerData.Halloween2019.CurrentTier
    if v73 >= p7 then
        v87 = not _G.PlayerData.Halloween2019.ClaimedRewards[v68]
        if not v87 then
            v87 = true
        end
    end
    v72.Visible = v87
    v87 = p5.Title
    v72 = v87.TierNumber
    v72.Text = p7
end
v1.GenerateTierRewardPC = v3
v3 = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v143 = v1
    local v133, v134, v131 = pairs(v143.BattlePassFrame:GetChildren())
    for v130, v136 in v133, v134, v143 do
        if v136.Name ~= "Page" .. v1.CurrentPassPage then
            local v141 = false
        end
        v141 = true
        v136.Visible = v141
    end
end
v1.ChangePage = v3
v3 = function(p9)
    local v148 = _G.PlayerData.Halloween2019.CurrentTier
    local v160 = v9.HalloweenPass2019.TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v166 = v1.CurrentTierBuy
    local v167 = 1
    if v167 > v166 then
        v166 = v1
        v167 = 1
        v166.CurrentTierBuy = v167
    end
    local v169 = v1.CurrentTierBuy
    local v170 = v169 + v148
    if v170 > v160 then
        v170 = v1
        v169 = v160 - v148
        v170.CurrentTierBuy = v169
    end
    local v173 = v1.CurrentTierBuy
    local v174 = 1
    if v173 > v174 then
        v169 = "s"
    else
        v169 = ""
    end
    v174 = v1
    v173 = v174.BuyTiersFrame
    v173.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v169)
    local v180 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v181 = v1
    local v182 = v181.CurrentTierBuy
    local v183 = v182 * v9.HalloweenPass2019.TierCost
    v180.Text = v183
    if v148 >= v160 then
        v182 = v1
        v183 = v182.BuyTiersFrame
        v180 = v183.Parent
        v183 = false
        v180.Visible = v183
        v181 = v1
        v182 = v181.BattlePassFrame
        v183 = v182.Parent
        v180 = v183.PassComplete
        v183 = true
        v180.Visible = v183
    end
end
v1.ChangeBuyTiers = v3
v3 = function()
    local v185 = v1.CurrentTierBuy
    local v214 = _G.PlayerData.Materials.Owned.Candies2019 or 0
    local v215 = v9
    local v218 = v215.HalloweenPass2019.TierCost * v185
    if v218 < v214 then
        v215 = false
    end
    print("Tiers To Buy: " .. v185)
    local v222 = "Current Tier: "
    local v194 = _G
    local v195 = v194.PlayerData
    local v196 = v195.Halloween2019
    local v223 = v196.CurrentTier
    print(v222 .. v223)
    if not true then
        v222 = v185
        v8.BuyTiers:FireServer(v222)
        v223 = _G
        v194 = _G
        v195 = v194.PlayerData
        v196 = v195.Materials
        v223 = v196.Owned
        v223.PlayerData.Materials.Owned.Candies2019 = v223.Candies2019 - v218
        v195 = _G
        v196 = v195.PlayerData
        v223 = v196.Halloween2019
        _G.PlayerData.Halloween2019.CurrentTier = v223.CurrentTier + v185
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v196 = v1
        v223 = v196.CurrentTierBuy
        print("Tiers To Buy: " .. v223)
        v194 = _G
        v195 = v194.PlayerData
        v196 = v195.Halloween2019
        v223 = v196.CurrentTier
        print("Current Tier: " .. v223)
        v1.UpdateCandies()
        v223 = v1
        v196 = v1
        v223 = v196.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v223.NewPassPageObject, v223)
        return true
    end
    return false, v218 - v214
end
v1.BuyTiers = v3
v3 = function(p10)
    local v245 = tostring(p10)
    local v246 = v9
    local v247 = v246.HalloweenPass2019
    local v248 = v247.Rewards
    local v249 = v248[v245]
    if not v249 then
        v248 = v249.ItemID
        v247 = print
        v246 = v248
        v247(v246)
        local v250 = _G
        local v253 = v250.PlayerData.Halloween2019.CurrentTier
        local v254 = tonumber(v245)
        if v253 >= v254 then
            v250 = _G.PlayerData
            v254 = v250.Halloween2019.ClaimedRewards
            v253 = v254[v245]
            v250 = _G
            v254 = v250.PlayerData.Halloween2019
            v253 = v254.ClaimedRewards
            v254 = true
            v253[v245] = v254
            v253 = v249.ItemType
            v253 = v249.ItemType
            v253 = v249.ItemType
            v250 = _G.PlayerData
            v254 = v250[v249.ItemType].Owned
            v253 = v254[v248]
            v250 = _G.PlayerData
            local v270 = v249.ItemType
            local v271 = v250[v270]
            v254 = v271.Owned
            if not v253 then
                v250 = v249.Amount
                v271 = v253 + v250
                if v271 then
                    v271 = v249.Amount
                end
                v254[v248] = v271
                v270 = _G
                v250 = v270.PlayerData
                v270 = v249.ItemType
                v271 = v250[v270]
                v254 = v271.Owned
                v271 = v248
                v253 = table.insert
                v253(v254, v271)
                v250 = v1
                v270 = v1
                v250 = v270.PassTierRewardObjectFunction
                v270 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v250.NewPassPageObject, v250, v270)
                v8.ClaimReward:FireServer(v245)
                return 
                return 
            end
        end
    end
end
v1.ClaimReward = v3
v3 = function()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned.Candies2019 or 0)
    v1.GUI.CandyDisplay2.Text = v7.Commafy(_G.PlayerData.Materials.Owned.Candies2019 or 0)
    v1.GUI.CandyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned.Candies2019 or 0) .. " Candies"
    v1.GUI.PumpkinKeyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned.PumpkinKey or 0) .. " Pumpkin Keys"
    local v333 = v1.GUI
    local v339 = _G.PlayerData.Materials.Owned.PumpkinKey or 0
    local v340 = 0
    if v340 <= v339 then
        v333 = false
    end
    v333.PumpkinKeyDisplayBox.Visible = true
    v339 = v1
    local v342 = v339.GUI
    v340 = _G.PlayerData.Materials.Owned.PumpkinKey
    local v348 = v340 or 0
    local v349 = 0
    if v349 <= v348 then
        v342 = false
    end
    v342.BoxButtonKey.Visible = true
    v349 = _G
    v348 = v349.PlayerData
    local v352 = v348.Halloween2019.ElderwoodClaimed
    local v356 = _G.PlayerData.Halloween2019.ElderwoodRadioClaimed
    v1.GUI.TravellerFrame.Part1.Visible = false
    v1.GUI.TravellerFrame.Part2.Visible = false
    v1.GUI.TravellerFrame.Part3.Visible = true
    return 
    v1.GUI.TravellerFrame.Part1.Visible = false
    v1.GUI.TravellerFrame.Part2.Visible = true
end
v1.UpdateCandies = v3
v3 = 0
v1.TotalCandies = v3
v3 = function()
    v1.GUI.TotalCandies.Text = "You have earned " .. v1.TotalCandies + _G.CandiesGained .. " candies total."
end
v1.UpdateTotalCandies = v3
v3 = function()
    local v393 = v8
    local v395, v393 = v393.GetLeaderboard:InvokeServer()
    v1.TotalCandies = v393 or 0
    local v397 = v1
    v397.UpdateTotalCandies()
    local v398 = v1
    v397 = v398.GUI
    v397 = 1
    v398 = v397.Leaderboard.Container
    local v400 = 0
    local v401 = {}
    v398:ClearAllChildren()
    local v447, v448, v449 = pairs(v395)
    for v452, v454 in v447, v448, v449 do
        (function(p11, p12)
            local v406 = v1.LeaderboardFrames
            local v408 = v397
            local v424 = "Place" .. v408
            local v409 = v406[v424]
            if v409 then
                v424 = v1
                v406 = v424.LeaderboardFrames
                v409 = v406.Place
            end
            local v410 = v409:Clone()
            local v425 = v397
            local v426 = 4
            if v426 > v425 then
                v426 = v410.Container
                v425 = v426.PlayerImage
                v408 = game.ReplicatedStorage
                v426 = v408.GetPlayerImage
                v425.Image = v426:Invoke(p12.key)
            end
            v412 = v410.Container
            v412 = "#" .. v397 .. " - " .. p12.key
            v412.Username.Text = v412
            v412 = v410.Container
            v412 = v7.Commafy(p12.value) .. " Candies"
            v412.TokenCount.Text = v412
            v410.Parent = v398
            v412 = 0
            v410.Position = UDim2.new(v412, 0, 0, v400)
            v410.Name = p12.key
            table.insert(v401, v410)
            v400 = v400 + v410.AbsoluteSize.Y
            v397 = v397 + 1
        end)(v452, v454)
    end
end
v1.UpdateLeaderboard = v3
v3 = function(p13)
    local v457 = _G
    local v458 = v457.PlayerData
    local v459 = v458.Materials
    local v460 = v459.Owned
    local v477 = 1000
    local v478 = false
    local v479 = 1
    if v460[p13] or 0 >= v479 then
        v457 = _G
        v458 = v457.PlayerData
        v459 = v458.Materials
        v460 = v459.Owned
        v457 = _G.PlayerData.Materials.Owned
        v458 = v457[p13]
        v459 = v458 - v479
        v460[p13] = v459
        v458 = v1
        v459 = v458.GUI
        v460 = v459.Main
        v459 = false
        v460.Visible = v459
        v459 = _G
        v460 = v459.Process
        v459 = "Unboxing"
        v460(v459)
        v457 = game.ReplicatedStorage.Remotes
        v458 = v457.Shop
        v457 = "HalloweenBox2019"
        local v469 = v458.OpenCrate:InvokeServer(v457, "MysteryBox", p13)
        v458 = wait
        local v470 = 0.75
        local v471 = time()
        local v472 = v471 - time()
        v458(v470 - v472)
        local v474 = _G
        v474.Process()
        if not v469 then
            v471 = game
            v472 = v471.ReplicatedStorage
            v470 = v472.Remotes
            v474 = v470.Shop
            v470 = "HalloweenBox2019"
            v472 = v469
            v474.BoxController:Fire(v470, v472)
        end
    end
end
v1.OpenHWBox = v3
v3 = function(p14)
    v1.GUI.BoxButtonCandies.MouseButton1Click:connect(function()
        v1.OpenHWBox("Candies2019")
    end)
    v1.GUI.BoxButtonKey.MouseButton1Click:connect(function()
        v1.OpenHWBox("PumpkinKey")
    end)
end
v1.ConnectBox = v3
v3 = {}
local v501 = "Mission1"
v3.Login = v501
v501 = "Mission2"
v3.Murderer = v501
v501 = "Mission3"
v3.Innocent = v501
v501 = {}
local v502 = 0
v501.Login = v502
v502 = 6
v501.Murderer = v502
v502 = 4
v501.Innocent = v502
v502 = 0
local function v503()
    local v505 = v1.GUI
    local v506 = v505.Challenges
    local v507 = v506.Main
    local v508 = v507.Dailies
    local v509 = v508.Bones
    local v511, v512, v509 = pairs(v509.Container:GetChildren())
    for v508, v507 in v511, v512, v509 do
        local v515 = v507:IsA("Frame")
        if not v515 then
            v515 = table.insert
            v515(v505, v507)
        end
    end
    v511 = pairs
    v512 = {}
    local v518, v519, v509 = v511(v512)
    for v508, v507 in v518, v519, v509 do
        v507.Visible = false
    end
    v509 = 1
    v518 = _G.PlayerData.SkellyBones
    v519 = 1
    for v509 = v509, v518, v519 do
        v508 = v505[v509]
        v507 = true
        v508.Visible = v507
    end
    v518 = pairs
    v519 = _G.PlayerData.ChallengeProgress2019
    local v521, v522, v509 = v518(v519)
    for v508, v507 in v521, v522, v509 do
        local v523 = v1
        local v524 = v523.GUI
        local v525 = v524.Challenges
        local v535 = v3
        v520 = v525.Main.Dailies.Missions[v535[v508]]
        local v537 = v502
        local v538 = 1
        if v538 > v537 then
            v538 = v520.Icon
            v537 = v538.Progress
            v538 = false
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Claim
            v538 = false
            v537.Visible = v538
        else
            v538 = v520.Icon
            v537 = v538.Claim
            v538 = true
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Completed
            v538 = false
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Completed
            v538 = true
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Progress
            v538 = false
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Claim
            v538 = false
            v537.Visible = v538
            v506 = #v506
            v538 = v520.Icon
            v537 = v538.Progress
            v538 = true
            v537.Visible = v538
            v538 = v520.Icon
            v537 = v538.Progress
            v535 = v507
            v525 = "/"
            v523 = v501
            v524 = v523[v508]
            v538 = v535 .. v525 .. v524
            v537.Text = v538
        end
    end
    v522 = v506.Main
    v521 = v522.Dailies
    v522 = false
    v520 = _G
    local v539 = v520.PlayerData
    v509 = v539.Halloween2019.CurrentTier
    local v541 = 40
    if v541 > v509 then
        v520 = _G
        v539 = v520.PlayerData
        v541 = v539.Halloween2019
        v509 = v541.Tutorial
        v522 = false
        v522 = true
    end
    v521.Visible = v522
    v522 = v506.Main
    v521 = v522.BPTutorial
    v520 = _G
    v509 = v520.PlayerData.Halloween2019.Tutorial
    v522 = not v509
    v521.Visible = v522
    v522 = v506.Main
    v521 = v522.BPComplete
    v520 = _G
    if 40 < v520.PlayerData.Halloween2019.CurrentTier then
        v522 = false
    end
    v522 = true
    v521.Visible = v522
end
v1.UpdateChallenges = v503
v503 = v8.UpdateChallenges.OnClientEvent
v503:connect(function(p15, p16)
    _G.PlayerData.ChallengeProgress2019 = p15
    _G.PlayerData.SkellyBones = p16
    v1.UpdateChallenges()
end)
local v556 = {}
v556.Mission1 = "Login"
v556.Mission2 = "Murderer"
v556.Mission3 = "Innocent"
local function TimerConvert_1(p17)
    return string.format("%02i:%02i:%02i", p17 / 3600, p17 / 60 % 60, p17 % 60)
end
v1.ConnectChallengeClaims = function()
    local v645 = v8
    local v568, v565 = v645.GetChallengeTimer:InvokeServer()
    v502 = v645
    local v571 = v1.GUI.Challenges.Main.Dailies
    local v573, v574, v571 = pairs(v571.Missions:GetChildren())
    for v570, v576 in v573, v574, v571 do
        v576.Icon.Claim.MouseButton1Click:connect(function()
            local v579 = _G
            local v580 = v579.PlayerData
            local v582 = v580.ChallengeProgress2019.Day
            local v593 = v568
            if v582 == v593 then
                v582 = v502
                v593 = 1
                if v593 > v582 then
                    return 
                end
                v593 = v556
                v579 = v576
                v580 = v579.Name
                v582 = v593[v580]
                v579 = v576
                v580 = v579.Icon
                v593 = v580.Claim
                v580 = false
                v593.Visible = v580
                v579 = v576
                v580 = v579.Icon
                v593 = v580.Completed
                v580 = true
                v593.Visible = v580
                v579 = v576
                v580 = v579.Icon
                v593 = v580.Progress
                v580 = false
                v593.Visible = v580
                v579 = _G
                v580 = v579.PlayerData
                v593 = v580.ChallengeProgress2019
                v580 = "Claimed"
                v593[v582] = v580
                v579 = v556
                v580 = v579[v576.Name]
                v593 = 2
                v593 = 1
                v579 = _G
                v580 = v579.PlayerData
                local v585 = _G
                local v594 = v585.PlayerData
                v579 = v594.SkellyBones + v593
                v580.SkellyBones = v579
                local v596 = _G
                v579 = v596.PlayerData
                v580 = v579.SkellyBones
                v579 = 4
                if v580 >= v579 then
                    v596 = _G
                    v579 = v596.PlayerData
                    v580 = v579.Halloween2019
                    v585 = _G.PlayerData
                    v594 = v585.Halloween2019
                    v596 = v594.CurrentTier
                    v579 = v596 + 1
                    v580.CurrentTier = v579
                    v579 = v1
                    v580 = v579.GenerateTiers
                    v596 = v1
                    v579 = v596.NewPassTierRewardObject
                    v594 = v1
                    v596 = v594.NewPassPageObject
                    v585 = v1
                    v594 = v585.PassTierRewardObjectFunction
                    v585 = true
                    v580(v579, v596, v594, v585)
                end
                local v587 = _G
                local v589 = v587.PlayerData.SkellyBones
                local v597 = 4
                if v589 > v597 then
                    v597 = _G
                    v589 = v597.PlayerData
                    v587 = _G.PlayerData.SkellyBones
                    v597 = v587 - 4
                    v589.SkellyBones = v597
                end
                v1.UpdateChallenges()
                v8.ClaimChallenge:FireServer(v582)
                return 
            end
        end)
    end
    v577 = v1
    v576 = v577.GUI.Challenges
    v571 = v576.Main.Dailies
    v574 = v571.Timer
    v573 = v574.MainTimer
    local v649 = v502
    v576 = "%02i:%02i:%02i"
    v577 = v649 / 60 % 60
    v574 = string.format(v576, v649 / 3600, v577, v649 % 60)
    v573.Text = v574
    v573 = spawn
    v574 = function()
        while true do
            local v607 = wait(1)
            if not v607 then
                break
            end
            v607 = v502 - 1
            v502 = v607
            local v623 = v502
            local v615 = string.format("%02i:%02i:%02i", v623 / 3600, v623 / 60 % 60, v623 % 60)
            v1.GUI.Challenges.Main.Dailies.Timer.MainTimer.Text = v615
            local v630 = v502
            local v631 = 1
            if v631 >= v630 then
                v615 = v1.GUI.Challenges.Main
                v623 = v615.Dailies
                v631 = v623.Timer
                v630 = v631.MainTimer
                v631 = "Now! Reset"
                v630.Text = v631
                v615 = v1.GUI.Challenges.Main.Dailies.Missions
                v623 = v615.Mission1
                v631 = v623.Icon
                v630 = v631.Claim
                v631 = false
                v630.Visible = v631
                v615 = v1.GUI.Challenges.Main.Dailies.Missions
                v623 = v615.Mission2
                v631 = v623.Icon
                v630 = v631.Claim
                v631 = false
                v630.Visible = v631
                v615 = v1.GUI.Challenges.Main.Dailies.Missions
                v623 = v615.Mission3
                v631 = v623.Icon
                v630 = v631.Claim
                v631 = false
                v630.Visible = v631
            end
        end
    end
    v573(v574)
end
return v1


//
local v1 = {}
local v3 = script
local v4 = v3.Parent
local v6 = require(v4.ItemModule)
v3 = _G
v4 = v3.Database
local v7 = v4.MysteryBox
v3 = _G.Database
v4 = v3.Weapons
local v9 = _G
v3 = v9.Database.Pets
local v249 = {}
v9 = 70
v249.Common = v9
v9 = 15
v249.Uncommon = v9
v9 = 10
v249.Rare = v9
v9 = 5
v249.Legendary = v9
v9 = {}
local v12, v13, v14 = pairs(v249)
for v21, v17 in v12, v13, v14 do
    for v15 = 1, v17, 1 do
        table.insert(v9, v21)
    end
end
v12 = function(p1, p2)
    local v24 = Random.new()
    local v27 = script.Unboxing:Clone()
    local v28 = v27.Main
    local v30 = v28.Container.Background
    local v31 = v30.ItemContainer
    local v113 = v31.OffsetContainer
    local v114 = v113.MainContainer
    local v34 = v24:NextInteger(23, 27)
    v28 = {}
    v28.Common = {}
    v28.Uncommon = {}
    v28.Rare = {}
    v28.Legendary = {}
    local v37, v38, v39 = pairs(v7[p1].Contents)
    for v46, v42 in v37, v38, v39 do
        table.insert(v28[v4[v42].Rarity], v42)
    end
    v114:ClearAllChildren()
    v38 = script
    local v48 = v38.UIGridLayout:Clone()
    v48.Parent = v114
    v46 = v48.CellSize
    v39 = v46.X
    v38 = v39.Offset
    v39 = UDim2.new
    v46 = 0
    local v49 = v48.CellSize
    v42 = v49.X.Offset * v34 + 5
    v113.Size = v39(v46, v42, 1, 0)
    v113.Position = UDim2.new(0.5, v38 / 2, 0, 0)
    local function GetRandomItemFromBox_1()
        local v62 = v24:NextInteger(1, 500)
        local v63 = "Godly"
        v62 = v9
        v63 = v62[v24:NextInteger(1, 100)]
        local v76 = v30
        local v77 = v76.GodlyCover
        if v77 then
            v76 = v30
            v77 = v76.Godly
            if v77 then
                v76 = v28[v63]
                v77 = v76[v24:NextInteger(1, #v28[v63])]
            end
        end
        v73 = v4
        v73 = v77
        return v73, v73[v77], v63
    end
    local v80 = 1
    local v81 = v34 + 5
    local v82 = 1
    for v80 = v80, v81, v82 do
        local v83
        v49 = nil
        v41 = nil
        local v86 = _G.Database.Weapons
        local v87 = v86[p2]
        v40 = v87.Rarity
        v40 = v30.GodlyCover
        if not v40 then
            v83 = v30.GodlyCover
            v86 = _G
            v87 = v86.Database
            v40 = v87.Weapons
            v87 = v30.GodlyCover
            v49 = v40[v87]
            v41 = v49.Rarity
        else
            v83 = p2
            v86 = _G
            v87 = v86.Database
            v40 = v87.Weapons
            v49 = v40[p2]
            v41 = v49.Rarity
            v40 = GetRandomItemFromBox_1
            local v88, v87, v86 = v40()
            v83 = v88
            v49 = v87
            v41 = v86
        end
        v88 = script.NewItem
        local v89 = v88:Clone()
        v6.DisplayItem(v89, v49)
        v89.LayoutOrder = v80
        v89.Parent = v31
    end
    v81 = GetRandomItemFromBox_1
    local v90, v82, v80 = v81()
    if v80 == v34 then
        v49 = v6
        v83 = v49.DisplayItem
        v89 = "PreItem"
        local v91 = 1
        v41 = v89 .. v91
        if p1 then
            v49 = v113[v41]
            v41 = v82
            v83(v49, v41)
            v90 = GetRandomItemFromBox_1
            local v92, v82, v80 = v90()
            v89 = "PreItem"
            v91 = 2
            v6.DisplayItem(v113[v89 .. v91], v82)
            v80 = game.Players
            v82 = v80.LocalPlayer
            v92 = v82.PlayerGui
            v27.Parent = v92
            v82 = 4
            v92 = v82 + v24:NextNumber()
            v91 = -v38 * v34 + v24:NextInteger(-v38 / 2 - 5, v38 / 2 - 5)
            v89 = v91 + v38
            v91 = v38 / 2
            v89 = 0
            v91 = 0
            v113:TweenPosition(UDim2.new(0.5, v89 - v91, v89, v91), "Out", "Quad", v92, true)
            wait(v92 + 1)
            v27:Destroy()
            return 
        end
    end
end
v1.OpenBox = v12
v12 = game
v14 = "TweenService"
local v137 = v12:GetService(v14)
v13 = TweenInfo.new
v21 = Enum.EasingStyle.Linear
v17 = Enum.EasingDirection.Out
v16 = 0
v18 = false
v15 = 0
local v139 = v13(0.125, v21, v17, v16, v18, v15)
local function v140(p3, p4)
    local v143 = script.Hatching:Clone()
    v143.Parent = game.Players.LocalPlayer.PlayerGui
    v143.Cracked.PetIcon.Image = v6.GetImage(v3[p4].Image)
    wait(1)
    local v149 = v143.Uncracked.Egg
    local v216 = {}
    local v153 = {}
    v153.Rotation = 10
    local v217 = {}
    v217.Rotation = -10
    local v218 = {}
    v218.Rotation = 10
    local v165 = v137:Create(v149, v139, v218)
    local v219 = {}
    v219.Rotation = -10
    local v220 = {}
    v220.Rotation = 0
    local v175 = v137:Create(v149, v139, v220)
    local v221 = {}
    v221.Rotation = 10
    local v222 = {}
    v222.Rotation = -10
    local v185 = v137:Create(v149, v139, v222)
    local v223 = {}
    v223.Rotation = 10
    local v190 = v137:Create(v149, v139, v223)
    local v224 = {}
    v224.Rotation = -10
    local v195 = v137:Create(v149, v139, v224)
    local v225 = {}
    v225.Rotation = 0
    v216[1] = v137:Create(v149, v139, v153)
    v216[2] = v137:Create(v149, v139, v217)
    v216[3] = v165
    v216[4] = v137:Create(v149, v139, v219)
    v216[5] = v175
    v216[6] = v137:Create(v149, v139, v221)
    v216[7] = v137:Create(v149, v139, v225)
    local v200, v201, v165 = pairs(v216)
    for v170, v175 in v200, v201, v165 do
        v175:Play()
        v185 = 0.125
        wait(v185)
    end
    v200 = wait
    v201 = 0.5
    v200(v201)
    v143.Uncracked.Visible = false
    v143.Cracked.Visible = true
    wait(1)
    v143:Destroy()
end
v1.HatchEgg = v140
v140 = {}
local v234, v235, v236 = pairs(script:GetDescendants())
for v243, v239 in v234, v235, v236 do
    local v240 = v239:IsA("ImageLabel")
    if not v240 then
        v240 = table.insert
        v240(v140, v239)
    end
end
v234 = spawn
v235 = function()
    (game:GetService("ContentProvider")):PreloadAsync(v140)
end
v234(v235)
return v1

//
local v1 = {}
local v3 = game
local v5 = v3.ReplicatedStorage.Modules
local v7 = require(v5.GridCreator)
v5 = game.ReplicatedStorage
local v8 = v5.Christmas2019Events
v3 = "Pass"
v5 = "Christmas2019" .. v3
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.Currency = nil
EventCurrentTierBuy = 1
v1.BuyTiersFrame = nil
v1.LeaderboardFrames = {}
v3 = game.ReplicatedStorage
local v10 = v3.GetSyncData:InvokeServer()
v3 = nil
v1.NewPassTierRewardObject = v3
v3 = nil
v1.NewPassPageObject = v3
v3 = nil
v1.PassTierRewardObjectFunction = v3
v3 = function(p1, p2, p3, p4)
    v10 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v39 = v10[v5]
    v7.CreatePass(p3, p1, v39, v1.BattlePassFrame, p2)
    local v23 = _G.PlayerData
    local v24 = v23.Christmas2019
    v1.YourTier.Text = "Your Tier: " .. v24.CurrentTier
    local v49 = _G.PlayerData.Christmas2019.CurrentTier
    local v50 = v39.TotalTiers
    if v49 >= v50 then
        v49 = v49 - 1
    end
    v50 = math.floor
    local v26 = v50(v49 / 5)
    if p4 then
        v23 = v1
        v24 = v23.BattlePassFrame
        local v28, v29, v23 = pairs(v24:GetChildren())
        for v22, v31 in v28, v29, v23 do
            if v31.Name ~= "Page" .. v26 then
                local v35 = false
            end
            v35 = true
            v31.Visible = v35
        end
        v28 = v1
        v28.CurrentPassPage = v26
    end
    v28 = v1
    v29 = 1
    v28.CurrentTierBuy = v29
    v29 = v1
    v28 = v29.ChangeBuyTiers
    v29 = 0
    v28(v29)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v3
v3 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v54 = p6.Traveller
    v54 = p5.Container.Icon
    v54.Image = p6.Image
    local v97 = "???"
    p5.Title.TierNumber.Text = v97
    local v59 = _G.PlayerData.Christmas2019.CurrentTier
    if p7 < v59 then
        v97 = false
    end
    local v99 = true
    p5.Enter.Visible = v99
    v59 = _G.PlayerData.Christmas2019.CurrentTier + 1
    if v59 ~= p7 then
        v99 = false
    end
    local v104 = true
    p5.Next.Visible = v104
    v59 = _G.PlayerData.Christmas2019.CurrentTier
    if v59 <= p7 then
        v104 = false
    end
    p5.Locked.Visible = true
    p5.Claim.Visible = false
    v59 = function()
        v1.GUI.BattlePassFrame.Visible = false
        v1.GUI.TravellerFrame.Visible = true
    end
    p5.Enter.MouseButton1Click:connect(v59)
    return 
    local v70 = tostring(p7)
    local v118 = v10
    local v119 = v118[v5]
    local v120 = v119.Rewards
    local v121 = v120[v70]
    local v122 = false
    local v124 = p6.ItemID
    if not v124 then
        v120 = v7
        v124 = v120.MakeItemFrame
        v120 = p5
        v119 = p6
        v118 = false
        v124(v120, v119, v118)
        local v74 = v3
        local v75 = v74[p5]
        if v75 then
            v75 = v3
            v74 = p5.Claim.MouseButton1Click
            v75[p5] = v74:connect(function()
                p5.Claim.Visible = false
                local v86 = _G.PlayerData.Christmas2019.ClaimedRewards[v70]
                v1.ClaimReward(v70)
            end)
        end
    end
    v75 = p5.Locked
    v76 = _G.PlayerData.Christmas2019.CurrentTier
    if v76 <= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Next
    v76 = _G.PlayerData.Christmas2019.CurrentTier + 1
    if v76 ~= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Claim
    v90 = false
    v76 = _G.PlayerData.Christmas2019.CurrentTier
    if v76 >= p7 then
        v90 = not _G.PlayerData.Christmas2019.ClaimedRewards[v70]
        if not v90 then
            v90 = true
        end
    end
    v75.Visible = v90
    v90 = p5.Title
    v75 = v90.TierNumber
    v75.Text = p7
end
v1.ChangePage = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v146 = v1
    local v136, v137, v134 = pairs(v146.BattlePassFrame:GetChildren())
    for v133, v139 in v136, v137, v146 do
        if v139.Name ~= "Page" .. v1.CurrentPassPage then
            local v144 = false
        end
        v144 = true
        v139.Visible = v144
    end
end
v1.ChangeBuyTiers = function(p9)
    local v151 = _G.PlayerData.Christmas2019.CurrentTier
    local v163 = v10[v5].TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v171 = v1.CurrentTierBuy
    local v172 = 1
    if v172 > v171 then
        v171 = v1
        v172 = 1
        v171.CurrentTierBuy = v172
    end
    local v174 = v1.CurrentTierBuy
    local v175 = v174 + v151
    if v175 > v163 then
        v175 = v1
        v174 = v163 - v151
        v175.CurrentTierBuy = v174
    end
    local v178 = v1.CurrentTierBuy
    local v179 = 1
    if v178 > v179 then
        v174 = "s"
    else
        v174 = ""
    end
    v179 = v1
    v178 = v179.BuyTiersFrame
    v178.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v174)
    local v185 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v186 = v1
    local v187 = v186.CurrentTierBuy
    local v188 = v187 * v10[v5].TierCost
    v185.Text = v188
    if v151 >= v163 then
        v187 = v1
        v188 = v187.BuyTiersFrame
        v185 = v188.Parent
        v188 = false
        v185.Visible = v188
        v186 = v1
        v187 = v186.BattlePassFrame
        v188 = v187.Parent
        v185 = v188.PassComplete
        v188 = true
        v185.Visible = v188
    end
end
v1.BuyTiers = function()
    local v190 = v1.CurrentTierBuy
    local v222 = _G.PlayerData.Materials.Owned[v1.Currency] or 0
    local v223 = v10
    local v227 = v223[v5].TierCost * v190
    if v227 < v222 then
        v223 = false
    end
    print("Tiers To Buy: " .. v190)
    local v231 = "Current Tier: "
    local v199 = _G
    local v200 = v199.PlayerData
    local v201 = v200.Christmas2019
    local v232 = v201.CurrentTier
    print(v231 .. v232)
    if not true then
        v231 = v190
        v8.BuyTiers:FireServer(v231)
        v232 = _G
        v199 = _G.PlayerData
        v200 = v199.Materials
        v201 = v200.Owned
        v199 = v1
        v200 = v199.Currency
        v232 = v201[v200]
        v232.PlayerData.Materials.Owned[v1.Currency] = v232 - v227
        v200 = _G
        v201 = v200.PlayerData
        v232 = v201.Christmas2019
        _G.PlayerData.Christmas2019.CurrentTier = v232.CurrentTier + v190
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v201 = v1
        v232 = v201.CurrentTierBuy
        print("Tiers To Buy: " .. v232)
        v199 = _G
        v200 = v199.PlayerData
        v201 = v200.Christmas2019
        v232 = v201.CurrentTier
        print("Current Tier: " .. v232)
        v1.UpdateCandies()
        v232 = v1
        v201 = v1
        v232 = v201.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v232.NewPassPageObject, v232)
        return true
    end
    return false, v227 - v222
end
v1.ClaimReward = function(p10)
    local v255 = tostring(p10)
    local v256 = v10
    local v257 = v5
    local v258 = v256[v257]
    local v259 = v258.Rewards
    local v260 = v259[v255]
    if not v260 then
        v259 = v260.ItemID
        v258 = print
        v256 = v259
        v258(v256)
        local v261 = _G
        v257 = v261.PlayerData
        local v263 = v257.Christmas2019.CurrentTier
        v257 = v255
        local v264 = tonumber(v257)
        if v263 >= v264 then
            v261 = _G.PlayerData
            v264 = v261.Christmas2019.ClaimedRewards
            v263 = v264[v255]
            v261 = _G
            v264 = v261.PlayerData.Christmas2019
            v263 = v264.ClaimedRewards
            v264 = true
            v263[v255] = v264
            v263 = v260.ItemType
            v263 = v260.ItemType
            v263 = v260.ItemType
            v261 = _G.PlayerData
            v264 = v261[v260.ItemType].Owned
            v263 = v264[v259]
            v261 = _G.PlayerData
            local v279 = v260.ItemType
            local v280 = v261[v279]
            v264 = v280.Owned
            if not v263 then
                v261 = v260.Amount
                v280 = v263 + v261
                if v280 then
                    v280 = v260.Amount
                end
                v264[v259] = v280
                v279 = _G
                v261 = v279.PlayerData
                v279 = v260.ItemType
                v280 = v261[v279]
                v264 = v280.Owned
                v280 = v259
                v263 = table.insert
                v263(v264, v280)
                v261 = v1
                v279 = v1
                v261 = v279.PassTierRewardObjectFunction
                v279 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v261.NewPassPageObject, v261, v279)
                v8.ClaimReward:FireServer(v255)
                return 
                return 
            end
        end
    end
end
local v283 = v8.UpdateGiftTool
v283.OnClientEvent:Connect(function()
    v1.UpdateCandies()
end)
local function v287()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplay2.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0) .. " Snow Tokens"
    v1.GUI.PumpkinKeyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.KeyName] or 0) .. " Snow Keys"
    local v355 = v1.GUI
    local v363 = _G.PlayerData.Materials.Owned[v1.KeyName] or 0
    local v364 = 0
    if v364 <= v363 then
        v355 = false
    end
    v355.PumpkinKeyDisplayBox.Visible = true
    v363 = v1
    local v366 = v363.GUI
    v364 = _G.PlayerData.Materials.Owned[v1.KeyName]
    local v374 = v364 or 0
    local v375 = 0
    if v375 <= v374 then
        v366 = false
    end
    v366.BoxButtonKey.Visible = true
    v375 = v1.GUI.Main.Frames.Gifts
    v374 = v375.RewardIcon
    v374.Open.Gifts.Text = "You have given " .. _G.PlayerData.GiftsGiven2019 or 0 .. "  gifts"
    v1.GUI.Main.Frames.Gifts.RewardIcon.OpenComplete.Gifts.Text = "You have given " .. _G.PlayerData.GiftsGiven2019 or 0 .. " gifts"
    local v407 = _G.PlayerData.GiftRewardClaimed
    v1.GUI.Main.Frames.Gifts.RewardIcon.Open.Visible = false
    v1.GUI.Main.Frames.Gifts.RewardIcon.OpenComplete.Visible = true
    v1.GUI.Main.Frames.Gifts.RewardIcon.Completed.Visible = true
end
v1.UpdateCandies = v287
v287 = 0
v1.TotalCurrency = v287
v287 = function()
    v1.GUI.TotalCandies.Text = "You have earned " .. v1.TotalCurrency + _G.EventCurrencyGained .. " snow tokens total."
end
v1.UpdateTotalCandies = v287
v287 = function()
    local v445, v443, v446 = v8.GetLeaderboard:InvokeServer()
    v446 = v446 or 0
    v1.TotalCurrency = v446
    local v448 = v1
    v448.UpdateTotalCandies()
    local v449 = v1
    v448 = v449.GUI
    v448 = 1
    v449 = v448.LeaderboardTokens.Container
    local v451 = 0
    local v452 = {}
    v449:ClearAllChildren()
    local v498, v499, v500 = pairs(v445)
    for v503, v505 in v498, v499, v500 do
        (function(p11, p12)
            local v457 = v1.LeaderboardFrames
            local v459 = v448
            local v475 = "Place" .. v459
            local v460 = v457[v475]
            if v460 then
                v475 = v1
                v457 = v475.LeaderboardFrames
                v460 = v457.Place
            end
            local v461 = v460:Clone()
            local v476 = v448
            local v477 = 4
            if v477 > v476 then
                v477 = v461.Container
                v476 = v477.PlayerImage
                v459 = game.ReplicatedStorage
                v477 = v459.GetPlayerImage
                v476.Image = v477:Invoke(p12.key)
            end
            v463 = v461.Container
            v463 = "#" .. v448 .. " - " .. p12.key
            v463.Username.Text = v463
            v463 = v461.Container
            v463 = v7.Commafy(p12.value) .. " Tokens"
            v463.TokenCount.Text = v463
            v461.Parent = v449
            v463 = 0
            v461.Position = UDim2.new(v463, 0, 0, v451)
            v461.Name = p12.key
            table.insert(v452, v461)
            v451 = v451 + v461.AbsoluteSize.Y
            v448 = v448 + 1
        end)(v503, v505)
    end
end
v1.UpdateLeaderboard = v287
v287 = function()
    local v507 = v8
    local v509, v507, v510 = v507.GetLeaderboard:InvokeServer()
    local v511 = v1
    local v512 = v511.GUI
    v512 = 1
    v511 = v512.LeaderboardGifts.Container
    local v514 = 0
    local v515 = {}
    v511:ClearAllChildren()
    local v561, v562, v563 = pairs(v507)
    for v566, v568 in v561, v562, v563 do
        (function(p13, p14)
            local v520 = v1.LeaderboardFrames
            local v522 = v512
            local v538 = "Place" .. v522
            local v523 = v520[v538]
            if v523 then
                v538 = v1
                v520 = v538.LeaderboardFrames
                v523 = v520.Place
            end
            local v524 = v523:Clone()
            local v539 = v512
            local v540 = 4
            if v540 > v539 then
                v540 = v524.Container
                v539 = v540.PlayerImage
                v522 = game.ReplicatedStorage
                v540 = v522.GetPlayerImage
                v539.Image = v540:Invoke(p14.key)
            end
            v526 = v524.Container
            v526 = "#" .. v512 .. " - " .. p14.key
            v526.Username.Text = v526
            v526 = v524.Container
            v526 = v7.Commafy(p14.value) .. " Gifts"
            v526.TokenCount.Text = v526
            v524.Parent = v511
            v526 = 0
            v524.Position = UDim2.new(v526, 0, 0, v514)
            v524.Name = p14.key
            table.insert(v515, v524)
            v514 = v514 + v524.AbsoluteSize.Y
            v512 = v512 + 1
        end)(v566, v568)
    end
end
v1.UpdateLeaderboard2 = v287
v287 = function(p15)
    local v569 = _G
    local v570 = v569.PlayerData
    local v573 = v570.Materials.Owned[p15]
    local v589 = v1
    local v590 = v589.Currency
    if p15 == v590 then
        v573 = 600
    else
        v573 = false
        v589 = v1
        v590 = v589.KeyName
        if p15 == v590 then
            v573 = 1
        end
    end
    if v573 or 0 >= v573 then
        v569 = _G
        v570 = v569.PlayerData
        v589 = v570.Materials
        v590 = v589.Owned
        v569 = _G.PlayerData.Materials.Owned
        v570 = v569[p15]
        v589 = v570 - v573
        v590[p15] = v589
        v570 = v1
        v589 = v570.GUI
        v590 = v589.Main
        v589 = false
        v590.Visible = v589
        v589 = _G
        v590 = v589.Process
        v589 = "Unboxing"
        v590(v589)
        v569 = game.ReplicatedStorage.Remotes
        v570 = v569.Shop
        v569 = "Christmas2019Box"
        local v581 = v570.OpenCrate:InvokeServer(v569, "MysteryBox", p15)
        v570 = wait
        local v582 = 0.75
        local v583 = time()
        local v584 = v583 - time()
        v570(v582 - v584)
        local v586 = _G
        v586.Process()
        if not v581 then
            v583 = game
            v584 = v583.ReplicatedStorage
            v582 = v584.Remotes
            v586 = v582.Shop
            v582 = "Christmas2019Box"
            v584 = v581
            v586.BoxController:Fire(v582, v584)
        end
    end
end
v1.OpenBox = v287
v287 = function(p16)
    v1.GUI.BoxButtonCandies.MouseButton1Click:connect(function()
        v1.OpenBox(v1.Currency)
    end)
    v1.GUI.BoxButtonKey.MouseButton1Click:connect(function()
        v1.OpenBox(v1.KeyName)
    end)
end
v1.ConnectBox = v287
v287 = {}
v283 = "Mission1"
v287.Login = v283
v283 = "Mission2"
v287.Murderer = v283
v283 = "Mission3"
v287.Innocent = v283
v283 = {}
local v614 = 0
v283.Login = v614
v614 = 6
v283.Murderer = v614
v614 = 4
v283.Innocent = v614
v614 = 0
local function v615()
    local v617 = v1.GUI
    local v618 = v617.Challenges
    local v619 = v618.Main
    local v620 = v619.Dailies
    local v621 = v620.Bones
    local v623, v624, v621 = pairs(v621.Container:GetChildren())
    for v620, v619 in v623, v624, v621 do
        local v627 = v619:IsA("Frame")
        if not v627 then
            v627 = table.insert
            v627(v617, v619)
        end
    end
    v623 = pairs
    v624 = {}
    local v630, v631, v621 = v623(v624)
    for v620, v619 in v630, v631, v621 do
        v619.Visible = false
    end
    v621 = 1
    v630 = _G.PlayerData.SkellyBones
    v631 = 1
    for v621 = v621, v630, v631 do
        v620 = v617[v621]
        v619 = true
        v620.Visible = v619
    end
    v630 = pairs
    v631 = _G.PlayerData.ChallengeProgress2019
    local v633, v634, v621 = v630(v631)
    for v620, v619 in v633, v634, v621 do
        local v635 = v1
        local v636 = v635.GUI
        local v637 = v636.Challenges
        local v647 = v287
        v632 = v637.Main.Dailies.Missions[v647[v620]]
        local v649 = v614
        local v650 = 1
        if v650 > v649 then
            v650 = v632.Icon
            v649 = v650.Progress
            v650 = false
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Claim
            v650 = false
            v649.Visible = v650
        else
            v650 = v632.Icon
            v649 = v650.Claim
            v650 = true
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Completed
            v650 = false
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Completed
            v650 = true
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Progress
            v650 = false
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Claim
            v650 = false
            v649.Visible = v650
            v618 = #v618
            v650 = v632.Icon
            v649 = v650.Progress
            v650 = true
            v649.Visible = v650
            v650 = v632.Icon
            v649 = v650.Progress
            v647 = v619
            v637 = "/"
            v635 = v283
            v636 = v635[v620]
            v650 = v647 .. v637 .. v636
            v649.Text = v650
        end
    end
    v634 = v618.Main
    v633 = v634.Dailies
    v634 = false
    v632 = _G
    local v651 = v632.PlayerData
    v621 = v651.Christmas2019.CurrentTier
    local v653 = 40
    if v653 > v621 then
        v632 = _G
        v651 = v632.PlayerData
        v653 = v651.Christmas2019
        v621 = v653.Tutorial
        v634 = false
        v634 = true
    end
    v633.Visible = v634
    v634 = v618.Main
    v633 = v634.BPTutorial
    v632 = _G
    v621 = v632.PlayerData.Christmas2019.Tutorial
    v634 = not v621
    v633.Visible = v634
    v634 = v618.Main
    v633 = v634.BPComplete
    v632 = _G
    if 40 < v632.PlayerData.Christmas2019.CurrentTier then
        v634 = false
    end
    v634 = true
    v633.Visible = v634
end
v1.UpdateChallenges = v615
v615 = v8.UpdateChallenges.OnClientEvent
v615:connect(function(p17, p18)
    _G.PlayerData.ChallengeProgress2019 = p17
    _G.PlayerData.SkellyBones = p18
    v1.UpdateChallenges()
end)
local v668 = {}
v668.Mission1 = "Login"
v668.Mission2 = "Murderer"
v668.Mission3 = "Innocent"
local function TimerConvert_1(p19)
    return string.format("%02i:%02i:%02i", p19 / 3600, p19 / 60 % 60, p19 % 60)
end
local v695
local v696 = 0
local v697 = {}
local function v698()
    local v699 = v695
    return 
    local v702 = v1.GUI.SantaChallenge
    local v703 = v702.Challenge
    v699 = v703.WeaponDetails
    local v704 = v1
    v702 = v704.GUI.SantaChallenge.Challenge
    local v758 = v702.Weapons
    v702 = v10.Item
    v696 = 0
    local v761 = v695
    local v705, v706, v704 = pairs(v695)
    for v709, v712 in v705, v706, v704 do
        local v711 = v703["Item" .. v709]
        v711.Container.Icon.Image = v702[v712].Image
        v711.Container.ItemName.Text = v702[v712].ItemName
        v711.Container.ItemName.TextColor3 = v10.Rarity[v702[v712].Rarity]
        local v781 = _G.PlayerData.Weapons.Owned[v712]
        v696 = v696 + 1
        v711.Container.Completed.Visible = true
        local v788 = v697[v711]
        v697[v711]:disconnect()
        v697[v711] = v711.Container.ActionButton.MouseButton1Click:connect(function()
            v699.ItemFrame.Container.Icon.Image = v702[v712].Image
            v699.ItemFrame.Container.ItemName.Text = v702[v712].ItemName
            v699.ItemFrame.Container.ItemName.TextColor3 = v10.Rarity[v702[v712].Rarity]
            v699.Description.BoxName.Text = v10.MysteryBox[(function(p20)
                local v681, v682, v683 = pairs(v10.MysteryBox)
                for v693, v686 in v681, v682, v683 do
                    local v687, v688, v689 = pairs(v686.Contents)
                    for v692, v690 in v687, v688, v689 do
                        if v690 == p20 then
                            return v691
                        end
                    end
                end
            end)(v712)].Name
            v699.Visible = true
        end)
    end
    v709 = v1
    v704 = v709.GUI
    v706 = v704.SantaChallenge
    v705 = v706.Challenge
    v706 = false
    v705.Visible = v706
    v709 = v1
    v706 = v709.GUI.SantaChallenge
    v705 = v706.Completed
    v706 = true
    v705.Visible = v706
    v711 = v1
    v712 = v711.GUI
    v709 = v712.SantaChallenge
    v706 = v709.Challenge.Complete
    v705 = v706.Progress
    v709 = "/10 Weapons Owned"
    v706 = v696 .. v709
    v705.Text = v706
    v711 = v1
    v712 = v711.GUI
    v709 = v712.SantaChallenge
    v706 = v709.Challenge.Complete
    v705 = v706.Confirm
    v709 = 10
    if v709 > v696 then
        v706 = Enum.ButtonStyle.RobloxRoundButton
        if v706 then
            v706 = Enum.ButtonStyle.RobloxRoundDefaultButton
        end
        v705.Style = v706
        return 
    end
end
v1.UpdateSantasChallenge = v698
v698 = function()
    local v804 = v1.GUI.SantaChallenge.Challenge.WeaponDetails
    v695 = v8.GetSantaChallenges:InvokeServer()
    local v848 = v695
    v1.UpdateSantasChallenge()
    v1.GUI.SantaChallenge.Challenge.Visible = false
    v1.GUI.SantaChallenge.Completed.Visible = true
    local v860 = _G
    local v861 = v860.PlayerData
    local v862 = v861.Christmas2019
    local v863 = v862.ChallengeTutorial
    if v863 then
        v860 = v1
        v861 = v860.GUI
        v862 = v861.SantaChallenge
        v863 = v862.Challenge
        v862 = false
        v863.Visible = v862
        v860 = v1
        v861 = v860.GUI
        v862 = v861.SantaChallenge
        v863 = v862.Tutorial
        v862 = true
        v863.Visible = v862
    end
    v1.GUI.SantaChallenge.Tutorial.Confirm.MouseButton1Click:connect(function()
        v1.GUI.SantaChallenge.Challenge.Visible = true
        v1.GUI.SantaChallenge.Tutorial.Visible = false
        _G.PlayerData.Christmas2019.ChallengeTutorial = true
        v8.CompleteChallengeTutorial:FireServer()
    end)
    v804.Description.Close.MouseButton1Click:connect(function()
        v804.Visible = false
    end)
    v1.GUI.SantaChallenge.Challenge.Complete.Confirm.MouseButton1Click:connect(function()
        local v832 = v696
        local v833 = 10
        if v832 >= v833 then
            v833 = v1.GUI.SantaChallenge
            v832 = v833.Challenge
            v833 = false
            v832.Visible = v833
            v833 = v1.GUI.SantaChallenge
            v832 = v833.Confirm
            v833 = true
            v832.Visible = v833
        end
    end)
    v1.GUI.SantaChallenge.Confirm.Confirm.MouseButton1Click:connect(function()
        local v840 = v696
        local v841 = 10
        if v840 >= v841 then
            v841 = v1.GUI.SantaChallenge
            v840 = v841.Confirm
            v841 = false
            v840.Visible = v841
            v841 = v1.GUI.SantaChallenge
            v840 = v841.Completed
            v841 = true
            v840.Visible = v841
            v841 = _G
            v840 = v841.PlayerData
            v841 = "Completed"
            v840.SantasList2019 = v841
            v841 = v8
            v840 = v841.ConfirmSantasChallenge
            v840:FireServer()
        end
    end)
end
v1.GenerateSantasChallenge = v698
v698 = function()
    local v961 = v8
    local v884, v881 = v961.GetChallengeTimer:InvokeServer()
    v614 = v961
    local v887 = v1.GUI.Challenges.Main.Dailies
    local v889, v890, v887 = pairs(v887.Missions:GetChildren())
    for v886, v892 in v889, v890, v887 do
        v892.Icon.Claim.MouseButton1Click:connect(function()
            local v895 = _G
            local v896 = v895.PlayerData
            local v898 = v896.ChallengeProgress2019.Day
            local v909 = v884
            if v898 == v909 then
                v898 = v614
                v909 = 1
                if v909 > v898 then
                    return 
                end
                v909 = v668
                v895 = v892
                v896 = v895.Name
                v898 = v909[v896]
                v895 = v892
                v896 = v895.Icon
                v909 = v896.Claim
                v896 = false
                v909.Visible = v896
                v895 = v892
                v896 = v895.Icon
                v909 = v896.Completed
                v896 = true
                v909.Visible = v896
                v895 = v892
                v896 = v895.Icon
                v909 = v896.Progress
                v896 = false
                v909.Visible = v896
                v895 = _G
                v896 = v895.PlayerData
                v909 = v896.ChallengeProgress2019
                v896 = "Claimed"
                v909[v898] = v896
                v895 = v668
                v896 = v895[v892.Name]
                v909 = 2
                v909 = 1
                v895 = _G
                v896 = v895.PlayerData
                local v901 = _G
                local v910 = v901.PlayerData
                v895 = v910.SkellyBones + v909
                v896.SkellyBones = v895
                local v912 = _G
                v895 = v912.PlayerData
                v896 = v895.SkellyBones
                v895 = 4
                if v896 >= v895 then
                    v912 = _G
                    v895 = v912.PlayerData
                    v896 = v895.Christmas2019
                    v901 = _G.PlayerData
                    v910 = v901.Christmas2019
                    v912 = v910.CurrentTier
                    v895 = v912 + 1
                    v896.CurrentTier = v895
                    v895 = v1
                    v896 = v895.GenerateTiers
                    v912 = v1
                    v895 = v912.NewPassTierRewardObject
                    v910 = v1
                    v912 = v910.NewPassPageObject
                    v901 = v1
                    v910 = v901.PassTierRewardObjectFunction
                    v901 = true
                    v896(v895, v912, v910, v901)
                end
                local v903 = _G
                local v905 = v903.PlayerData.SkellyBones
                local v913 = 4
                if v905 > v913 then
                    v913 = _G
                    v905 = v913.PlayerData
                    v903 = _G.PlayerData.SkellyBones
                    v913 = v903 - 4
                    v905.SkellyBones = v913
                end
                v1.UpdateChallenges()
                v8.ClaimChallenge:FireServer(v898)
                return 
            end
        end)
    end
    v893 = v1
    v892 = v893.GUI.Challenges
    v887 = v892.Main.Dailies
    v890 = v887.Timer
    v889 = v890.MainTimer
    local v965 = v614
    v892 = "%02i:%02i:%02i"
    v893 = v965 / 60 % 60
    v890 = string.format(v892, v965 / 3600, v893, v965 % 60)
    v889.Text = v890
    v889 = spawn
    v890 = function()
        while true do
            local v923 = wait(1)
            if not v923 then
                break
            end
            v923 = v614 - 1
            v614 = v923
            local v939 = v614
            local v931 = string.format("%02i:%02i:%02i", v939 / 3600, v939 / 60 % 60, v939 % 60)
            v1.GUI.Challenges.Main.Dailies.Timer.MainTimer.Text = v931
            local v946 = v614
            local v947 = 1
            if v947 >= v946 then
                v931 = v1.GUI.Challenges.Main
                v939 = v931.Dailies
                v947 = v939.Timer
                v946 = v947.MainTimer
                v947 = "Now! Reset"
                v946.Text = v947
                v931 = v1.GUI.Challenges.Main.Dailies.Missions
                v939 = v931.Mission1
                v947 = v939.Icon
                v946 = v947.Claim
                v947 = false
                v946.Visible = v947
                v931 = v1.GUI.Challenges.Main.Dailies.Missions
                v939 = v931.Mission2
                v947 = v939.Icon
                v946 = v947.Claim
                v947 = false
                v946.Visible = v947
                v931 = v1.GUI.Challenges.Main.Dailies.Missions
                v939 = v931.Mission3
                v947 = v939.Icon
                v946 = v947.Claim
                v947 = false
                v946.Visible = v947
            end
        end
    end
    v889(v890)
end
v1.ConnectChallengeClaims = v698
return v1


//
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
//

local v1 = {}
local v4 = game.ReplicatedStorage.Trade
local v5 = script
local v7 = require(v5.Parent.InventoryModule)
v5 = game.ReplicatedStorage.Modules
local v11 = require(v5.ItemModule)
v1.GUI = {}
v1.RequestsEnabled = true
v1.TradeInventory = nil
v5 = function()
end
_G.NewTradeRequest = v5
v1.SendTradeRequest = function(p1)
    local v13 = v4
    local v15 = game
    local v16 = v15.Players
    if v13.SendRequest:InvokeServer(v16[p1]) then
        v13 = v1.UpdateTradeRequestWindow
        v16 = {}
        v15 = {}
        v15.Name = p1
        v16.Receiver = v15
        v13("SendingRequest", v16)
    end
end
v1.UpdateTradeRequestWindow = function(p2, p3)
    local v23 = v1.GUI.RequestFrame
    local v24, v25, v26 = pairs(v23:GetChildren())
    for v30, v28 in v24, v25, v26 do
        if v28.Name ~= p2 then
            local v29 = false
        end
        v29 = true
        v28.Visible = v29
    end
    v24 = true
    v23.Visible = v24
    v25 = _G
    v24 = v25.NewTradeRequest
    v25 = false
    v24(v25)
    local v32 = v23.SendingRequest.Username
    v26 = p3.Receiver
    local v35 = v26.Name
    v32.Text = v35
    return 
    if not p2 then
        v35 = v23.ReceivingRequest
        v32 = v35.Username
        v26 = p3.Sender
        v35 = v26.Name
        v32.Text = v35
        v35 = _G
        v32 = v35.NewTradeRequest
        v35 = true
        v32(v35)
        return 
        v23.Visible = false
        return 
    end
end
v1.ConnectRequestWindow = function()
    v1.GUI.RequestFrame.SendingRequest.Cancel.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.CancelRequest:FireServer()
    end)
    v1.GUI.RequestFrame.ReceivingRequest.Accept.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.AcceptRequest:FireServer()
        _G.NewTradeRequest(false)
    end)
    v1.GUI.RequestFrame.ReceivingRequest.Decline.MouseButton1Click:connect(function()
        v1.GUI.RequestFrame.Visible = false
        v4.DeclineRequest:FireServer()
        _G.NewTradeRequest(false)
    end)
end
v5 = v4.DeclineRequest
v5.OnClientEvent:connect(function()
    v1.UpdateTradeRequestWindow()
    _G.NewTradeRequest(false)
end)
v5 = v4.CancelRequest
v5.OnClientEvent:Connect(function()
    v1.UpdateTradeRequestWindow()
end)
v5 = v4.SendRequest
v5.OnClientInvoke = function(p4)
    local v92 = v1
    local v93 = v92.RequestsEnabled
    if not v93 then
        v92 = v1
        v93 = v92.UpdateTradeRequestWindow
        v92 = "ReceivingRequest"
        local v94 = {}
        local v95 = {}
        v95.Name = p4.Name
        v94.Sender = v95
        v93(v92, v94)
    end
    return v1.RequestsEnabled
end
local function GetTradePlayers_1(p5)
    local v101 = p5.Player1.Player
    local v106 = game.Players.LocalPlayer
    if v101 == v106 then
        v101 = "Player1"
        v106 = "Player2"
        return v101, v106
    end
    local v105 = p5.Player2.Player
    local v109 = game.Players.LocalPlayer
    if v105 == v109 then
        v105 = "Player2"
        v109 = "Player1"
        return v105, v109
    end
end
v5 = {}
local function ClearOfferFrame_1(p6)
    local v114, v115, v116 = pairs(p6:GetChildren())
    for v122, v119 in v114, v115, v116 do
        local v120 = v119:IsA("Frame")
        if not v120 then
            v120 = false
            v119.Visible = v120
            local v121 = v5
            v120 = v121[v119]
            if not v120 then
                v121 = v5
                v120 = v121[v119]
                v120:disconnect()
            end
        end
    end
end
local function DisplayOffer_1(p7, p8)
    local v126, v127, v128 = pairs(p8)
    for v142, v130 in v126, v127, v128 do
        local v132 = v130[3]
        local v133 = {}
        local v136 = _G.Database
        local v137 = v136[v132]
        local v139, v140, v141 = pairs(v137[v130[1]])
        for v137, v136 in v139, v140, v141 do
            v133[v137] = v136
        end
        v133.DataType = v132
        v133.Amount = v130[2]
        v140 = p7.Container
        v141 = "NewItem" .. v142
        v139 = v140[v141]
        v141 = v11
        v140 = v141.DisplayItem
        v141 = v139
        v140(v141, v133)
        local v143 = v5
        local v144 = v143[v139]
        if not v144 then
            v143 = v5
            v144 = v143[v139]
            v144:disconnect()
        end
        v5[v139] = v139.Container.ActionButton.MouseButton1Click:connect(function()
            v4.RemoveOffer:FireServer(v130[1], v130[3])
        end)
        v139.Visible = true
    end
end
local v161 = "Accept"
local function v162(p9)
    local v164 = p9.Player1.Player
    local v165 = game
    local v166 = v165.Players
    local v184 = v166.LocalPlayer
    if v164 == v184 then
        local v167 = "Player1"
        local v168 = "Player2"
    else
        v184 = p9.Player2
        v164 = v184.Player
        v165 = game
        v166 = v165.Players
        v184 = v166.LocalPlayer
        if v164 == v184 then
            v167 = "Player2"
            v168 = "Player1"
        else
            v167 = nil
            v168 = nil
        end
    end
    v184 = p9[v167]
    v164 = v184.Offer
    local v186 = p9[v168].Offer
    ClearOfferFrame_1(v1.GUI.YourOffer.Container)
    ClearOfferFrame_1(v1.GUI.TheirOffer.Container)
    DisplayOffer_1(v1.GUI.YourOffer, v164)
    DisplayOffer_1(v1.GUI.TheirOffer, v186)
    v161 = "Accept"
    v1.GUI.YourOffer.Accepted.Visible = false
    v1.GUI.TheirOffer.Accepted.Visible = false
    v1.GUI.Actions.Accept.Confirm.Visible = false
    v1.GUI.Actions.Accept.Cancel.Visible = false
    local v222 = false
    local v223 = #v164
    local v224 = 1
    if v224 > v223 then
        v223 = #v186
        v224 = 1
        if v223 <= v224 then
            v222 = false
        end
        v222 = true
    end
    v1.GUI.Actions.Accept.AddItem.Visible = v222
    v1.UpdateTradeInventory(p9)
    local v228 = false
    v223 = #v164
    v224 = 1
    if v224 > v223 then
        v223 = #v186
        v224 = 1
        if v223 <= v224 then
            v228 = false
        end
        v228 = true
    end
    v1.ResetCooldown(v228)
end
v1.UpdateTrade = v162
v162 = v4.UpdateTrade.OnClientEvent
v162:connect(v1.UpdateTrade)
local v231
local v232 = v4.StartTrade
v232.OnClientEvent:connect(function(p10, p11)
    local v235 = {}
    local v237 = "Pets"
    v235[1] = "Weapons"
    v235[2] = v237
    local v238, v239, v240 = pairs(v235)
    for v236, v237 in v238, v239, v240 do
        local v244 = v7.CreateBlankTradeInventoryTable()
        local v246, v247, v248 = pairs(v244[v237])
        for v244, v242 in v246, v247, v248 do
            v1.GUI.TradeGUI.Container.Items.Main:FindFirstChild(v237).Items.Container:FindFirstChild(v244).Container:ClearAllChildren()
        end
    end
    v238 = v1
    v240 = v7
    v239 = v240.GenerateInventory
    v247 = v1
    v246 = v247.GUI
    v240 = v246.TradeGUI.Container.Items
    v248 = v1
    v247 = v248.GUI
    v246 = v247.ItemsLayout
    v238.TradeInventory = v239(v240, _G.PlayerData, "Trading", v246)
    v238 = v1.ConnectOfferButtons
    v238(v1.TradeInventory)
    v1.UpdateTrade(p10)
    v1.GUI.TheirOffer.Username.Text = "(" .. p11 .. ")"
    v1.GUI.TradeGUI.Enabled = true
    v1.GUI.RequestFrame.Visible = false
    local v340 = v231
    if not v340 then
        v340 = v231
        v340:disconnect()
    end
    v244 = v1
    v248 = v244.GUI
    v247 = v248.TradeGUI
    local v268 = v247.Container.Items.Tabs.Search.Container.SearchText
    v231 = (v268:GetPropertyChangedSignal("Text")):connect(function()
        local v272 = v268.Text
        local v308 = string.gsub(v272, "S", "")
        local v277 = v1
        local v280, v281, v282 = pairs(v277.TradeInventory.Data)
        for v278, v277 in v280, v281, v282 do
            local v285, v286, v287 = pairs(v277.Current)
            for v306, v289 in v285, v286, v287 do
                v289.Frame.Visible = string.find(string.lower(v289.Name), string.lower(v272))
                local v310 = v289.Frame.Parent
                local v298 = v310.Parent:IsA("ScrollingFrame")
                if not v298 then
                    v310 = v289.Frame.Parent
                    v298 = v310.Parent
                    v310 = Vector2.new
                    v298.CanvasPosition = v310(0, 0)
                else
                    v301 = v289.Frame.Parent.Parent.Parent
                    v298 = v301.Parent
                    v301 = Vector2.new
                    v298.CanvasPosition = v301(0, 0)
                end
            end
        end
    end)
end)
local function v346(p12)
    local v348 = p12.Player1.Player
    local v349 = game
    local v350 = v349.Players
    local v384 = v350.LocalPlayer
    if v348 == v384 then
        local v351 = "Player1"
        local v352 = "Player2"
    else
        v384 = p12.Player2
        v348 = v384.Player
        v349 = game
        v350 = v349.Players
        v384 = v350.LocalPlayer
        if v348 == v384 then
            v351 = "Player2"
            v352 = "Player1"
        else
            v351 = nil
            v352 = nil
        end
    end
    v384 = p12[v351]
    v348 = v384.Offer
    local v386 = p12[v352].Offer
    local v353 = v1
    local v354 = v353.TradeInventory
    local v355, v356, v357 = pairs(v354.Data)
    for v354, v353 in v355, v356, v357 do
        local v360, v361, v362 = pairs(v353)
        for v383, v365 in v360, v361, v362 do
            local v366, v367, v368 = pairs(v365)
            for v381, v370 in v366, v367, v368 do
                local v369 = v370.Frame
                local v371 = v370.Amount
                local v374, v375, v376 = pairs(v348)
                for v382, v378 in v374, v375, v376 do
                    if v378[1] == v381 then
                        if v378[3] == v354 then
                            v371 = v371 - v378[2]
                        end
                    end
                end
                v375 = v369.Container
                v374 = v375.Amount
                v375 = ""
                v374.Text = v375
                v374 = true
                v369.Visible = v374
                v374 = 1
                if v371 > v374 then
                    v375 = v369.Container
                    v374 = v375.Amount
                    v376 = "x"
                    v382 = v371
                    v375 = v376 .. v382
                    v374.Text = v375
                    v374 = true
                    v369.Visible = v374
                else
                    v374 = 1
                    if v374 > v371 then
                        v374 = false
                        v369.Visible = v374
                    end
                end
            end
        end
    end
    return 
    if not p12 then
    end
end
v1.UpdateTradeInventory = v346
v346 = function(p13)
    local v391, v392, v393 = pairs(p13.Data)
    for u2, v396 in v391, v392, v393 do
        local v397, v398, v399 = pairs(v396)
        for v415, v402 in v397, v398, v399 do
            local v403, v404, v405 = pairs(v402)
            for u1, v407 in v403, v404, v405 do
                local v406 = v407.Frame
                if not v406 then
                    v406.Container.ActionButton.MouseButton1Click:connect(function()
                        v4.OfferItem:FireServer(u1, u2)
                    end)
                end
            end
        end
    end
end
v1.ConnectOfferButtons = v346
v346 = false
v232 = 6
local function v417(p14)
    if not p14 then
        v1.GUI.Actions.Accept.Cooldown.Visible = false
        v232 = 0
        v346 = false
        return 
    end
    v418 = v1
    v419 = v418.GUI
    v420 = v419.Actions
    v421 = v420.Accept
    v422 = v421.Cooldown
    v421 = true
    v422.Visible = v421
    v422 = 6
    v232 = v422
    local v423 = v1
    v418 = v423.GUI
    v419 = v418.Actions
    v420 = v419.Accept
    v421 = v420.Cooldown
    v422 = v421.Title
    v420 = " Please wait ("
    v419 = v232
    v418 = ") before accepting."
    v421 = v420 .. v419 .. v418
    v422.Text = v421
    v422 = v346
    if v422 then
        v418 = v1
        v419 = v418.GUI
        v420 = v419.Actions
        v421 = v420.Accept
        v422 = v421.Cooldown
        v421 = true
        v422.Visible = v421
        v422 = true
        v346 = v422
        while true do
            v422 = wait
            v421 = 1
            v422(v421)
            v232 = v232 - 1
            v423 = v1
            v418 = v423.GUI
            v419 = v418.Actions
            v420 = v419.Accept
            v420 = " Please wait ("
            v419 = v232
            v418 = ") before accepting."
            v420.Cooldown.Title.Text = v420 .. v419 .. v418
            if v232 < 0 then
                break
            end
        end
        v425 = false
        v346 = v425
        v418 = v1
        v419 = v418.GUI
        v420 = v419.Actions
        v424 = v420.Accept
        v425 = v424.Cooldown
        v424 = false
        v425.Visible = v424
        return 
    end
    v425 = 6
    v232 = v425
end
v1.ResetCooldown = v417
v417 = time
local v434 = v417()
local function v435()
    v1.GUI.Actions.Accept.ActionButton.MouseButton1Click:connect(function()
        local v442 = v232
        local v443 = 0
        if v443 >= v442 then
            v442 = v161
            v442 = "Confirm"
            v161 = v442
            v442 = time
            v434 = v442()
            v443 = v1.GUI.Actions.Accept
            v443 = true
            v443.Confirm.Visible = v443
        end
    end)
    v1.GUI.Actions.Accept.Confirm.ActionButton.MouseButton1Click:connect(function()
        local v452 = v232
        local v453 = 0
        if v453 >= v452 then
            v453 = time
            local v455 = v434
            v452 = v453() - v455
            local v458 = 0.4
            if v452 >= v458 then
                v452 = v161
                v452 = "Waiting"
                v161 = v452
                v455 = v1.GUI
                v458 = v455.YourOffer
                v452 = v458.Accepted
                v458 = true
                v452.Visible = v458
                v455 = v1.GUI.Actions
                v458 = v455.Accept
                v452 = v458.Cancel
                v458 = true
                v452.Visible = v458
                v458 = v4
                v452 = v458.AcceptTrade
                v452:FireServer()
            end
        end
    end)
    local v500 = v1
    v500.GUI.Actions.Accept.Cancel.ActionButton.MouseButton1Click:connect(function()
        v4.CancelAccept:FireServer()
    end)
    local v506 = v1
    local v507 = v506.GUI
    local v508 = v507.Actions
    v508.Decline.ActionButton.MouseButton1Click:connect(function()
        v4.DeclineTrade:FireServer()
        v1.GUI.TradeGUI.Enabled = false
        v1.TradeInventory = nil
    end)
    local v511 = v1.GUI
    local v476 = v511.Actions:FindFirstChild("AddItems")
    if not v476 then
        v506 = v1
        v507 = v506.GUI
        v508 = v507.Actions
        v511 = v508.AddItems.ActionButton
        v476 = v511.MouseButton1Click
        v476:connect(function()
            v1.GUI.TradeGUI.Container.Items.Visible = true
        end)
        v500 = v1.GUI.TradeGUI
        v506 = v500.Container
        v507 = v506.Items
        v508 = v507.Tabs
        v511 = v508.Close.ActionButton
        v511.MouseButton1Click:connect(function()
            v1.GUI.TradeGUI.Container.Items.Visible = false
        end)
    end
end
v1.ConnectActions = v435
v435 = v4.AcceptTrade.OnClientEvent
v435:connect(function(p15, p16)
    if not p15 then
        local v517 = v1
        local v519 = v517.GUI.TradeGUI
        local v533 = false
        v519.Enabled = v533
        if not p16 then
            v519 = pairs
            v533 = p16
            local v520, v521, v517 = v519(v533)
            for v532, v523 in v520, v521, v517 do
                _G.NewItem(v523[1], nil, nil, v523[3], v523[2])
            end
            return 
            v532 = v1
            v517 = v532.GUI
            v521 = v517.TheirOffer
            v520 = v521.Accepted
            v521 = true
            v520.Visible = v521
        end
        return 
    end
end)
v4.DeclineTrade.OnClientEvent:connect(function()
    v1.GUI.TradeGUI.Enabled = false
    v1.TradeInventory = nil
end)
v1.ConnectTabButtons = function()
    v7.ConnectTabButtons(nil, nil, v1.GUI.TradeGUI.Container.Items, v1.GUI.TradeGUI.Container.Items.Main)
end
return v1

//

local v1 = {}
local v3 = game
local v5 = v3.ReplicatedStorage.Modules
local v7 = require(v5.GridCreator)
v5 = game.ReplicatedStorage
local v8 = v5.Halloween2020Events
v3 = "Pass"
v5 = "Halloween2020" .. v3
v1.GUI = nil
v1.BattlePassFrame = nil
v1.YourTier = nil
v1.CurrentPassPage = 0
v1.Currency = nil
EventCurrentTierBuy = 1
v1.BuyTiersFrame = nil
v1.LeaderboardFrames = {}
v3 = game.ReplicatedStorage
local v10 = v3.GetSyncData:InvokeServer()
v3 = nil
v1.NewPassTierRewardObject = v3
v3 = nil
v1.NewPassPageObject = v3
v3 = nil
v1.PassTierRewardObjectFunction = v3
v3 = function(p1, p2, p3, p4)
    v10 = game.ReplicatedStorage.GetSyncData:InvokeServer()
    local v39 = v10[v5]
    v7.CreatePass(p3, p1, v39, v1.BattlePassFrame, p2)
    local v23 = _G.PlayerData
    local v24 = v23.Halloween2020
    v1.YourTier.Text = "Your Tier: " .. v24.CurrentTier
    local v49 = _G.PlayerData.Halloween2020.CurrentTier
    local v50 = v39.TotalTiers
    if v49 >= v50 then
        v49 = v49 - 1
    end
    v50 = math.floor
    local v26 = v50(v49 / 5)
    if p4 then
        v23 = v1
        v24 = v23.BattlePassFrame
        local v28, v29, v23 = pairs(v24:GetChildren())
        for v22, v31 in v28, v29, v23 do
            if v31.Name ~= "Page" .. v26 then
                local v35 = false
            end
            v35 = true
            v31.Visible = v35
        end
        v28 = v1
        v28.CurrentPassPage = v26
    end
    v28 = v1
    v29 = 1
    v28.CurrentTierBuy = v29
    v29 = v1
    v28 = v29.ChangeBuyTiers
    v29 = 0
    v28(v29)
    v1.NewPassTierRewardObject = p1
    v1.NewPassPageObject = p2
    v1.PassTierRewardObjectFunction = p3
end
v1.GenerateTiers = v3
v3 = {}
v1.GenerateTierRewardPC = function(p5, p6, p7)
    local v54 = p6.Traveller
    v54 = p5.Container.Icon
    v54.Image = p6.Image
    local v97 = "???"
    p5.Title.TierNumber.Text = v97
    local v59 = _G.PlayerData.Halloween2020.CurrentTier
    if p7 < v59 then
        v97 = false
    end
    local v99 = true
    p5.Enter.Visible = v99
    v59 = _G.PlayerData.Halloween2020.CurrentTier + 1
    if v59 ~= p7 then
        v99 = false
    end
    local v104 = true
    p5.Next.Visible = v104
    v59 = _G.PlayerData.Halloween2020.CurrentTier
    if v59 <= p7 then
        v104 = false
    end
    p5.Locked.Visible = true
    p5.Claim.Visible = false
    v59 = function()
        v1.GUI.BattlePassFrame.Visible = false
        v1.GUI.TravellerFrame.Visible = true
    end
    p5.Enter.MouseButton1Click:connect(v59)
    return 
    local v70 = tostring(p7)
    local v118 = v10
    local v119 = v118[v5]
    local v120 = v119.Rewards
    local v121 = v120[v70]
    local v122 = false
    local v124 = p6.ItemID
    if not v124 then
        v120 = v7
        v124 = v120.MakeItemFrame
        v120 = p5
        v119 = p6
        v118 = false
        v124(v120, v119, v118)
        local v74 = v3
        local v75 = v74[p5]
        if v75 then
            v75 = v3
            v74 = p5.Claim.MouseButton1Click
            v75[p5] = v74:connect(function()
                p5.Claim.Visible = false
                local v86 = _G.PlayerData.Halloween2020.ClaimedRewards[v70]
                v1.ClaimReward(v70)
            end)
        end
    end
    v75 = p5.Locked
    v76 = _G.PlayerData.Halloween2020.CurrentTier
    if v76 <= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Next
    v76 = _G.PlayerData.Halloween2020.CurrentTier + 1
    if v76 ~= p7 then
        v90 = false
    end
    v90 = true
    v75.Visible = v90
    v75 = p5.Claim
    v90 = false
    v76 = _G.PlayerData.Halloween2020.CurrentTier
    if v76 >= p7 then
        v90 = not _G.PlayerData.Halloween2020.ClaimedRewards[v70]
        if not v90 then
            v90 = true
        end
    end
    v75.Visible = v90
    v90 = p5.Title
    v75 = v90.TierNumber
    v75.Text = p7
end
v1.ChangePage = function(p8)
    v1.CurrentPassPage = v1.CurrentPassPage + p8
    local v146 = v1
    local v136, v137, v134 = pairs(v146.BattlePassFrame:GetChildren())
    for v133, v139 in v136, v137, v146 do
        if v139.Name ~= "Page" .. v1.CurrentPassPage then
            local v144 = false
        end
        v144 = true
        v139.Visible = v144
    end
end
v1.ChangeBuyTiers = function(p9)
    local v151 = _G.PlayerData.Halloween2020.CurrentTier
    local v163 = v10[v5].TotalTiers
    v1.CurrentTierBuy = v1.CurrentTierBuy + p9
    local v171 = v1.CurrentTierBuy
    local v172 = 1
    if v172 > v171 then
        v171 = v1
        v172 = 1
        v171.CurrentTierBuy = v172
    end
    local v174 = v1.CurrentTierBuy
    local v175 = v174 + v151
    if v175 > v163 then
        v175 = v1
        v174 = v163 - v151
        v175.CurrentTierBuy = v174
    end
    local v178 = v1.CurrentTierBuy
    local v179 = 1
    if v178 > v179 then
        v174 = "s"
    else
        v174 = ""
    end
    v179 = v1
    v178 = v179.BuyTiersFrame
    v178.Buy.Text = "Buy " .. v1.CurrentTierBuy .. " Tier" .. tostring(v174)
    local v185 = v1.BuyTiersFrame.CandyDisplay.Amount
    local v186 = v1
    local v187 = v186.CurrentTierBuy
    local v188 = v187 * v10[v5].TierCost
    v185.Text = v188
    if v151 >= v163 then
        v187 = v1
        v188 = v187.BuyTiersFrame
        v185 = v188.Parent
        v188 = false
        v185.Visible = v188
        v186 = v1
        v187 = v186.BattlePassFrame
        v188 = v187.Parent
        v185 = v188.PassComplete
        v188 = true
        v185.Visible = v188
    end
end
v1.BuyTiers = function()
    local v190 = v1.CurrentTierBuy
    local v222 = _G.PlayerData.Materials.Owned[v1.Currency] or 0
    local v223 = v10
    local v227 = v223[v5].TierCost * v190
    if v227 < v222 then
        v223 = false
    end
    print("Tiers To Buy: " .. v190)
    local v231 = "Current Tier: "
    local v199 = _G
    local v200 = v199.PlayerData
    local v201 = v200.Halloween2020
    local v232 = v201.CurrentTier
    print(v231 .. v232)
    if not true then
        v231 = v190
        v8.BuyTiers:FireServer(v231)
        v232 = _G
        v199 = _G.PlayerData
        v200 = v199.Materials
        v201 = v200.Owned
        v199 = v1
        v200 = v199.Currency
        v232 = v201[v200]
        v232.PlayerData.Materials.Owned[v1.Currency] = v232 - v227
        v200 = _G
        v201 = v200.PlayerData
        v232 = v201.Halloween2020
        _G.PlayerData.Halloween2020.CurrentTier = v232.CurrentTier + v190
        v1.CurrentTierBuy = 1
        v1.ChangeBuyTiers(0)
        print(" -- ")
        v201 = v1
        v232 = v201.CurrentTierBuy
        print("Tiers To Buy: " .. v232)
        v199 = _G
        v200 = v199.PlayerData
        v201 = v200.Halloween2020
        v232 = v201.CurrentTier
        print("Current Tier: " .. v232)
        v1.UpdateCandies()
        v232 = v1
        v201 = v1
        v232 = v201.PassTierRewardObjectFunction
        v1.GenerateTiers(v1.NewPassTierRewardObject, v232.NewPassPageObject, v232)
        return true
    end
    return false, v227 - v222
end
v1.ClaimReward = function(p10)
    local v255 = tostring(p10)
    local v256 = v10
    local v257 = v5
    local v258 = v256[v257]
    local v259 = v258.Rewards
    local v260 = v259[v255]
    if not v260 then
        v259 = v260.ItemID
        v258 = print
        v256 = v259
        v258(v256)
        local v261 = _G
        v257 = v261.PlayerData
        local v263 = v257.Halloween2020.CurrentTier
        v257 = v255
        local v264 = tonumber(v257)
        if v263 >= v264 then
            v261 = _G.PlayerData
            v264 = v261.Halloween2020.ClaimedRewards
            v263 = v264[v255]
            v261 = _G
            v264 = v261.PlayerData.Halloween2020
            v263 = v264.ClaimedRewards
            v264 = true
            v263[v255] = v264
            v263 = v260.ItemType
            v263 = v260.ItemType
            v263 = v260.ItemType
            v261 = _G.PlayerData
            v264 = v261[v260.ItemType].Owned
            v263 = v264[v259]
            v261 = _G.PlayerData
            local v279 = v260.ItemType
            local v280 = v261[v279]
            v264 = v280.Owned
            if not v263 then
                v261 = v260.Amount
                v280 = v263 + v261
                if v280 then
                    v280 = v260.Amount
                end
                v264[v259] = v280
                v279 = _G
                v261 = v279.PlayerData
                v279 = v260.ItemType
                v280 = v261[v279]
                v264 = v280.Owned
                v280 = v259
                v263 = table.insert
                v263(v264, v280)
                v261 = v1
                v279 = v1
                v261 = v279.PassTierRewardObjectFunction
                v279 = true
                v1.GenerateTiers(v1.NewPassTierRewardObject, v261.NewPassPageObject, v261, v279)
                v8.ClaimReward:FireServer(v255)
                return 
                return 
            end
        end
    end
end
local v283 = v8.UpdateGiftTool
v283.OnClientEvent:Connect(function()
    v1.UpdateCandies()
end)
local function v287()
    v1.GUI.CandyDisplay.Amount.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplay2.Text = v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0)
    v1.GUI.CandyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.Currency] or 0) .. " Candies"
    v1.GUI.PumpkinKeyDisplayBox.Text = "You have " .. v7.Commafy(_G.PlayerData.Materials.Owned[v1.KeyName] or 0) .. " Pumpkin Keys"
    local v355 = v1.GUI
    local v363 = _G.PlayerData.Materials.Owned[v1.KeyName] or 0
    local v364 = 0
    if v364 <= v363 then
        v355 = false
    end
    v355.PumpkinKeyDisplayBox.Visible = true
    v363 = v1
    local v366 = v363.GUI
    v364 = _G.PlayerData.Materials.Owned[v1.KeyName]
    local v374 = v364 or 0
    local v375 = 0
    if v375 <= v374 then
        v366 = false
    end
    v366.BoxButtonKey.Visible = true
    v375 = _G
    v374 = v375.PlayerData
    local v378 = v374.Halloween2020.AncientClaimed
    v1.GUI.TravellerFrame.Part1.Visible = false
    v1.GUI.TravellerFrame.Part3.Visible = true
end
v1.UpdateCandies = v287
v287 = 0
v1.TotalCurrency = v287
v287 = function()
    v1.GUI.TotalCandies.Text = "You have earned " .. v1.TotalCurrency + _G.EventCurrencyGained .. " candies total."
end
v1.UpdateTotalCandies = v287
v287 = function()
    local v400 = v8
    local v402, v400 = v400.GetLeaderboard:InvokeServer()
    v1.TotalCurrency = v400 or 0
    local v404 = v1
    v404.UpdateTotalCandies()
    local v405 = v1
    v404 = v405.GUI
    v404 = 1
    v405 = v404.LeaderboardTokens.Container
    local v407 = 0
    local v408 = {}
    v405:ClearAllChildren()
    local v454, v455, v456 = pairs(v402)
    for v459, v461 in v454, v455, v456 do
        (function(p11, p12)
            local v413 = v1.LeaderboardFrames
            local v415 = v404
            local v431 = "Place" .. v415
            local v416 = v413[v431]
            if v416 then
                v431 = v1
                v413 = v431.LeaderboardFrames
                v416 = v413.Place
            end
            local v417 = v416:Clone()
            local v432 = v404
            local v433 = 4
            if v433 > v432 then
                v433 = v417.Container
                v432 = v433.PlayerImage
                v415 = game.ReplicatedStorage
                v433 = v415.GetPlayerImage
                v432.Image = v433:Invoke(p12.key)
            end
            v419 = v417.Container
            v419 = "#" .. v404 .. " - " .. p12.key
            v419.Username.Text = v419
            v419 = v417.Container
            v419 = v7.Commafy(p12.value) .. " Candies"
            v419.TokenCount.Text = v419
            v417.Parent = v405
            v419 = 0
            v417.Position = UDim2.new(v419, 0, 0, v407)
            v417.Name = p12.key
            table.insert(v408, v417)
            v407 = v407 + v417.AbsoluteSize.Y
            v404 = v404 + 1
        end)(v459, v461)
    end
end
v1.UpdateLeaderboard = v287
v287 = function(p13)
    local v464 = _G
    local v465 = v464.PlayerData
    local v468 = v465.Materials.Owned[p13]
    local v484 = v1
    local v485 = v484.Currency
    if p13 == v485 then
        v468 = 600
    else
        v468 = false
        v484 = v1
        v485 = v484.KeyName
        if p13 == v485 then
            v468 = 1
        end
    end
    if v468 or 0 >= v468 then
        v464 = _G
        v465 = v464.PlayerData
        v484 = v465.Materials
        v485 = v484.Owned
        v464 = _G.PlayerData.Materials.Owned
        v465 = v464[p13]
        v484 = v465 - v468
        v485[p13] = v484
        v465 = v1
        v484 = v465.GUI
        v485 = v484.Main
        v484 = false
        v485.Visible = v484
        v484 = _G
        v485 = v484.Process
        v484 = "Unboxing"
        v485(v484)
        v464 = game.ReplicatedStorage.Remotes
        v465 = v464.Shop
        v464 = "Halloween2020Box"
        local v476 = v465.OpenCrate:InvokeServer(v464, "MysteryBox", p13)
        v465 = wait
        local v477 = 0.75
        local v478 = time()
        local v479 = v478 - time()
        v465(v477 - v479)
        local v481 = _G
        v481.Process()
        if not v476 then
            v478 = game
            v479 = v478.ReplicatedStorage
            v477 = v479.Remotes
            v481 = v477.Shop
            v477 = "Halloween2020Box"
            v479 = v476
            v481.BoxController:Fire(v477, v479)
        end
    end
end
v1.OpenBox = v287
v287 = function(p14)
    v1.GUI.BoxButtonCandies.MouseButton1Click:connect(function()
        v1.OpenBox(v1.Currency)
    end)
    v1.GUI.BoxButtonKey.MouseButton1Click:connect(function()
        v1.OpenBox(v1.KeyName)
    end)
end
v1.ConnectBox = v287
v287 = {}
v283 = "Mission1"
v287.Login = v283
v283 = "Mission2"
v287.Murderer = v283
v283 = "Mission3"
v287.Innocent = v283
v283 = {}
local v509 = 0
v283.Login = v509
v509 = 6
v283.Murderer = v509
v509 = 4
v283.Innocent = v509
v509 = 0
local function v510()
    local v512 = v1.GUI
    local v513 = v512.Challenges
    local v514 = v513.Main
    local v515 = v514.Dailies
    local v516 = v515.Bones
    local v518, v519, v516 = pairs(v516.Container:GetChildren())
    for v515, v514 in v518, v519, v516 do
        local v522 = v514:IsA("Frame")
        if not v522 then
            v522 = table.insert
            v522(v512, v514)
        end
    end
    v518 = pairs
    v519 = {}
    local v525, v526, v516 = v518(v519)
    for v515, v514 in v525, v526, v516 do
        v514.Visible = false
    end
    v516 = 1
    v525 = _G.PlayerData.SkellyBones2020
    v526 = 1
    for v516 = v516, v525, v526 do
        v515 = v512[v516]
        v514 = true
        v515.Visible = v514
    end
    v525 = pairs
    v526 = _G.PlayerData.ChallengeProgress2020
    local v528, v529, v516 = v525(v526)
    for v515, v514 in v528, v529, v516 do
        local v530 = v1
        local v531 = v530.GUI
        local v532 = v531.Challenges
        local v546 = v287
        v527 = v532.Main.Dailies.Missions[v546[v515]]
        local v548 = v509
        local v549 = 1
        if v549 > v548 then
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = false
            v548.Visible = v549
        else
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Completed
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Completed
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = false
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Claim
            v549 = false
            v548.Visible = v549
            v513 = #v513
            v549 = v527.Icon
            v548 = v549.Progress
            v549 = true
            v548.Visible = v549
            v549 = v527.Icon
            v548 = v549.Progress
            v546 = v514
            v532 = "/"
            v530 = v283
            v531 = v530[v515]
            v549 = v546 .. v532 .. v531
            v548.Text = v549
        end
    end
    v529 = v513.Main
    v528 = v529.Dailies
    v529 = false
    v527 = _G
    local v550 = v527.PlayerData
    v516 = v550.Halloween2020.CurrentTier
    local v552 = 30
    if v552 > v516 then
        v527 = _G
        v550 = v527.PlayerData
        v552 = v550.Halloween2020
        v516 = v552.Tutorial
        v529 = false
        v529 = true
    end
    v528.Visible = v529
    v528 = print
    v529 = "tutorial"
    v527 = _G
    v516 = v527.PlayerData.Halloween2020.Tutorial
    v528(v529, v516, "Halloween2020")
    v527 = _G
    v513.Main.BPTutorial.Visible = not v527.PlayerData.Halloween2020.Tutorial
    local v558 = v513.Main
    v527 = _G
    if 30 < v527.PlayerData.Halloween2020.CurrentTier then
        v558 = false
    end
    v558.BPComplete.Visible = true
end
v1.UpdateChallenges = v510
v510 = v8.UpdateChallenges.OnClientEvent
v510:connect(function(p15, p16)
    _G.PlayerData.ChallengeProgress2020 = p15
    _G.PlayerData.SkellyBones2020 = p16
    v1.UpdateChallenges()
end)
local v573 = {}
v573.Mission1 = "Login"
v573.Mission2 = "Murderer"
v573.Mission3 = "Innocent"
local function TimerConvert_1(p17)
    return string.format("%02i:%02i:%02i", p17 / 3600, p17 / 60 % 60, p17 % 60)
end
local v600
local v601 = 0
local v602 = {}
local function v603()
    local v604 = v600
    return 
    local v607 = v1.GUI.SantaChallenge
    local v608 = v607.Challenge
    v604 = v608.WeaponDetails
    local v609 = v1
    v607 = v609.GUI.SantaChallenge.Challenge
    local v663 = v607.Weapons
    v607 = v10.Item
    v601 = 0
    local v666 = v600
    local v610, v611, v609 = pairs(v600)
    for v614, v617 in v610, v611, v609 do
        local v616 = v608["Item" .. v614]
        v616.Container.Icon.Image = v607[v617].Image
        v616.Container.ItemName.Text = v607[v617].ItemName
        v616.Container.ItemName.TextColor3 = v10.Rarity[v607[v617].Rarity]
        local v686 = _G.PlayerData.Weapons.Owned[v617]
        v601 = v601 + 1
        v616.Container.Completed.Visible = true
        local v693 = v602[v616]
        v602[v616]:disconnect()
        v602[v616] = v616.Container.ActionButton.MouseButton1Click:connect(function()
            v604.ItemFrame.Container.Icon.Image = v607[v617].Image
            v604.ItemFrame.Container.ItemName.Text = v607[v617].ItemName
            v604.ItemFrame.Container.ItemName.TextColor3 = v10.Rarity[v607[v617].Rarity]
            v604.Description.BoxName.Text = v10.MysteryBox[(function(p18)
                local v586, v587, v588 = pairs(v10.MysteryBox)
                for v598, v591 in v586, v587, v588 do
                    local v592, v593, v594 = pairs(v591.Contents)
                    for v597, v595 in v592, v593, v594 do
                        if v595 == p18 then
                            return v596
                        end
                    end
                end
            end)(v617)].Name
            v604.Visible = true
        end)
    end
    v614 = v1
    v609 = v614.GUI
    v611 = v609.SantaChallenge
    v610 = v611.Challenge
    v611 = false
    v610.Visible = v611
    v614 = v1
    v611 = v614.GUI.SantaChallenge
    v610 = v611.Completed
    v611 = true
    v610.Visible = v611
    v616 = v1
    v617 = v616.GUI
    v614 = v617.SantaChallenge
    v611 = v614.Challenge.Complete
    v610 = v611.Progress
    v614 = "/10 Weapons Owned"
    v611 = v601 .. v614
    v610.Text = v611
    v616 = v1
    v617 = v616.GUI
    v614 = v617.SantaChallenge
    v611 = v614.Challenge.Complete
    v610 = v611.Confirm
    v614 = 10
    if v614 > v601 then
        v611 = Enum.ButtonStyle.RobloxRoundButton
        if v611 then
            v611 = Enum.ButtonStyle.RobloxRoundDefaultButton
        end
        v610.Style = v611
        return 
    end
end
v1.UpdateSantasChallenge = v603
v603 = function()
    local v709 = v1.GUI.SantaChallenge.Challenge.WeaponDetails
    v600 = v8.GetSantaChallenges:InvokeServer()
    local v753 = v600
    v1.UpdateSantasChallenge()
    v1.GUI.SantaChallenge.Challenge.Visible = false
    v1.GUI.SantaChallenge.Completed.Visible = true
    local v765 = _G
    local v766 = v765.PlayerData
    local v767 = v766.Halloween2020
    local v768 = v767.ChallengeTutorial
    if v768 then
        v765 = v1
        v766 = v765.GUI
        v767 = v766.SantaChallenge
        v768 = v767.Challenge
        v767 = false
        v768.Visible = v767
        v765 = v1
        v766 = v765.GUI
        v767 = v766.SantaChallenge
        v768 = v767.Tutorial
        v767 = true
        v768.Visible = v767
    end
    v1.GUI.SantaChallenge.Tutorial.Confirm.MouseButton1Click:connect(function()
        v1.GUI.SantaChallenge.Challenge.Visible = true
        v1.GUI.SantaChallenge.Tutorial.Visible = false
        _G.PlayerData.Halloween2020.ChallengeTutorial = true
        v8.CompleteChallengeTutorial:FireServer()
    end)
    v709.Description.Close.MouseButton1Click:connect(function()
        v709.Visible = false
    end)
    v1.GUI.SantaChallenge.Challenge.Complete.Confirm.MouseButton1Click:connect(function()
        local v737 = v601
        local v738 = 10
        if v737 >= v738 then
            v738 = v1.GUI.SantaChallenge
            v737 = v738.Challenge
            v738 = false
            v737.Visible = v738
            v738 = v1.GUI.SantaChallenge
            v737 = v738.Confirm
            v738 = true
            v737.Visible = v738
        end
    end)
    v1.GUI.SantaChallenge.Confirm.Confirm.MouseButton1Click:connect(function()
        local v745 = v601
        local v746 = 10
        if v745 >= v746 then
            v746 = v1.GUI.SantaChallenge
            v745 = v746.Confirm
            v746 = false
            v745.Visible = v746
            v746 = v1.GUI.SantaChallenge
            v745 = v746.Completed
            v746 = true
            v745.Visible = v746
            v746 = _G
            v745 = v746.PlayerData
            v746 = "Completed"
            v745.SantasList2019 = v746
            v746 = v8
            v745 = v746.ConfirmSantasChallenge
            v745:FireServer()
        end
    end)
end
v1.GenerateSantasChallenge = v603
v603 = function()
    local v866 = v8
    local v789, v786 = v866.GetChallengeTimer:InvokeServer()
    v509 = v866
    local v792 = v1.GUI.Challenges.Main.Dailies
    local v794, v795, v792 = pairs(v792.Missions:GetChildren())
    for v791, v797 in v794, v795, v792 do
        v797.Icon.Claim.MouseButton1Click:connect(function()
            local v800 = _G
            local v801 = v800.PlayerData
            local v803 = v801.ChallengeProgress2020.Day
            local v814 = v789
            if v803 == v814 then
                v803 = v509
                v814 = 1
                if v814 > v803 then
                    return 
                end
                v814 = v573
                v800 = v797
                v801 = v800.Name
                v803 = v814[v801]
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Claim
                v801 = false
                v814.Visible = v801
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Completed
                v801 = true
                v814.Visible = v801
                v800 = v797
                v801 = v800.Icon
                v814 = v801.Progress
                v801 = false
                v814.Visible = v801
                v800 = _G
                v801 = v800.PlayerData
                v814 = v801.ChallengeProgress2020
                v801 = "Claimed"
                v814[v803] = v801
                v800 = v573
                v801 = v800[v797.Name]
                v814 = 2
                v814 = 1
                v800 = _G
                v801 = v800.PlayerData
                local v806 = _G
                local v815 = v806.PlayerData
                v800 = v815.SkellyBones2020 + v814
                v801.SkellyBones2020 = v800
                local v817 = _G
                v800 = v817.PlayerData
                v801 = v800.SkellyBones2020
                v800 = 4
                if v801 >= v800 then
                    v817 = _G
                    v800 = v817.PlayerData
                    v801 = v800.Halloween2020
                    v806 = _G.PlayerData
                    v815 = v806.Halloween2020
                    v817 = v815.CurrentTier
                    v800 = v817 + 1
                    v801.CurrentTier = v800
                    v800 = v1
                    v801 = v800.GenerateTiers
                    v817 = v1
                    v800 = v817.NewPassTierRewardObject
                    v815 = v1
                    v817 = v815.NewPassPageObject
                    v806 = v1
                    v815 = v806.PassTierRewardObjectFunction
                    v806 = true
                    v801(v800, v817, v815, v806)
                end
                local v808 = _G
                local v810 = v808.PlayerData.SkellyBones2020
                local v818 = 4
                if v810 > v818 then
                    v818 = _G
                    v810 = v818.PlayerData
                    v808 = _G.PlayerData.SkellyBones2020
                    v818 = v808 - 4
                    v810.SkellyBones2020 = v818
                end
                v1.UpdateChallenges()
                v8.ClaimChallenge:FireServer(v803)
                return 
            end
        end)
    end
    v798 = v1
    v797 = v798.GUI.Challenges
    v792 = v797.Main.Dailies
    v795 = v792.Timer
    v794 = v795.MainTimer
    local v870 = v509
    v797 = "%02i:%02i:%02i"
    v798 = v870 / 60 % 60
    v795 = string.format(v797, v870 / 3600, v798, v870 % 60)
    v794.Text = v795
    v794 = spawn
    v795 = function()
        while true do
            local v828 = wait(1)
            if not v828 then
                break
            end
            v828 = v509 - 1
            v509 = v828
            local v844 = v509
            local v836 = string.format("%02i:%02i:%02i", v844 / 3600, v844 / 60 % 60, v844 % 60)
            v1.GUI.Challenges.Main.Dailies.Timer.MainTimer.Text = v836
            local v851 = v509
            local v852 = 1
            if v852 >= v851 then
                v836 = v1.GUI.Challenges.Main
                v844 = v836.Dailies
                v852 = v844.Timer
                v851 = v852.MainTimer
                v852 = "Now! Reset"
                v851.Text = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission1
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission2
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
                v836 = v1.GUI.Challenges.Main.Dailies.Missions
                v844 = v836.Mission3
                v852 = v844.Icon
                v851 = v852.Claim
                v852 = false
                v851.Visible = v852
            end
        end
    end
    v794(v795)
end
v1.ConnectChallengeClaims = v603
return v1


//

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

//
