local v15 = 0
_G.Gifts = v15
v15 = 1471244400
_G.OfferEndTime = v15
v15 = _G.OfferEndTime
local v17 = os.time()
v15 = _G
local v18 = 0
if v18 <= v15 - v17 then
    v17 = false
end
v15.ShowItemPack = true
v15 = _G
v15.CanJump = true
v15 = true
v18 = game
local v89 = v18.PlaceId
if not function()
    local v3 = _G
    local v7, v8, v3 = pairs(v3.PlayerData.Weapons.Owned)
    for v11, v10 in v7, v8, v3 do
        _G.Gifts = v10
        return 
    end
end then
end
local v90 = game
local v91 = v90.PlaceId
v15 = false
v15 = true
while true do
    v91 = _G
    v90 = game.ReplicatedStorage.Remotes.Extras.GetData2
    v91.PlayerData = v90:InvokeServer()
    v91 = wait
    v91(0.1)
    local v25 = _G.PlayerData
end
v25 = {}
local function UpdateData_1()
    local v27 = _G
    local v31, v32, v27 = pairs(v27.PlayerData.Weapons.Owned)
    for v35, v34 in v31, v32, v27 do
        _G.Gifts = v34
    end
    local v45 = v15
    if v45 then
        v45 = pairs
        v34 = _G
        v35 = v34.PlayerData
        v27 = v35.Toys
        v31 = v27.Owned
        local v36, v37, v32 = v45(v31)
        for v27, v35 in v36, v37, v32 do
            v33 = v25
            v34 = v33[v35]
            v33 = _G.PlayerData.Emotes.Owned
            v34 = table.insert
            v34(v33, v35)
            v25[v35] = true
        end
    end
end
v19 = game
v20 = v19.ReplicatedStorage
v21 = v20.UpdateData2
v22 = v21.OnClientEvent
v20 = function(p1, p2)
    _G.PlayerData = p1
    v25 = {}
    UpdateData_1()
    game.ReplicatedStorage.UpdateDataClient:Fire(p2, p1)
end
v22:connect(v20)
v19 = game
v21 = v19.ReplicatedStorage.UpdateDataClient
v21.Event:connect(UpdateData_1)
v19 = game
v21 = v19.ReplicatedStorage.UpdateData3
v21.OnClientEvent:connect(function(p3)
    _G.PlayerData = p3
    v25 = {}
    UpdateData_1()
end)
UpdateData_1()
local v63 = _G
v21 = function()
    UpdateData_1()
end
v63.UpdateEmotes = v21
local v95 = {}
v21 = {}
v95.Frames = v21
v21 = {}
v95.FrameNames = v21
v21 = {}
v95.OpenFunctions = v21
v21 = function(p4, p5)
    local v67 = type(p4)
    v67 = pairs
    local v68 = _G
    local v69 = v68.Windows
    local v71, v72, v73 = v67(v69.Frames)
    for v69, v68 in v71, v72, v73 do
        if v69 == p4 then
            v69.Visible = p5
            v69.Visible = not v69.Visible
        else
            v75 = false
            v69.Visible = v75
        end
    end
    return 
    v72 = p4
    v71 = type
    local v76 = v71(v72)
    v76 = pairs
    local v83 = _G.Windows
    local v78, v79, v73 = v76(v83.FrameNames)
    if v83 == p4 then
        for v69, v68 in v78, v79, v73 do
            v68.Visible = p5
            v74 = v68.Visible
            v75 = not v74
            v68.Visible = v75
            v75 = v68.Visible
            if not v75 then
                local v80 = v63
                v74 = v80.OpenFunctions
                v75 = v74[v69]
                if not v75 then
                    v80 = v63
                    v74 = v80.OpenFunctions
                    v75 = v74[v69]
                    v75()
                    v68.Visible = false
                end
            end
        end
        return 
    end
end
v95.ViewFrame = v21
v21 = _G
v21.Windows = v95
