while true do
    wait()
    local v3 = _G.Database
end
v3 = require
v2 = game.ReplicatedStorage.Modules.BoxModule
local v7 = v3(v2)
local v10 = require(game.ReplicatedStorage.Modules.ShopModule)
local v13 = require(game.ReplicatedStorage.Modules.XboxModule)
local function BindXbox_1()
    v13.Bind("UnboxA", Enum.KeyCode.ButtonA, function()
    end)
    v13.Bind("UnboxB", Enum.KeyCode.ButtonB, function()
    end)
    v13.Bind("UnboxX", Enum.KeyCode.ButtonX, function()
    end)
end
local function UnbindXbox_1()
    v13.Unbind("UnboxA")
    v13.Unbind("UnboxB")
    v13.Unbind("UnboxX")
end
game.ReplicatedStorage.Remotes.Shop.BoxController.Event:connect(function(p1, p2)
    BindXbox_1()
    game:GetService("GuiService").SelectedObject = nil
    v7.OpenBox(p1, p2)
    _G.NewItem(p2, "You Got...", _G.Windows.FrameNames.Halloween2022, "Weapons")
    _G.NewItem(p2, "You Got...", v10.GUI.ShopFrame, "Weapons")
    v13.Unbind("UnboxA")
    v13.Unbind("UnboxB")
    v13.Unbind("UnboxX")
    game.ReplicatedStorage.UpdateSalvageClient:Fire()
    game.ReplicatedStorage.Remotes.Shop.CrateComplete:FireServer(p2)
end)
game.ReplicatedStorage.Remotes.Shop.EggController.Event:connect(function(p3, p4)
    BindXbox_1()
    v7.HatchEgg(p3, p4)
    _G.NewItem(p4, "You Got...", v10.GUI.ShopFrame, "Pets")
    v13.Unbind("UnboxA")
    v13.Unbind("UnboxB")
    v13.Unbind("UnboxX")
    game.ReplicatedStorage.Remotes.Shop.CrateComplete:FireServer(p4)
end)
