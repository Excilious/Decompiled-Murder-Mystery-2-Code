local v3 = game:GetService("ContentProvider")
local v4 = {}
local v5 = "http://www.roblox.com/Thumbs/Avatar.ashx?x="
local v10 = v5 .. 250 .. "&y=" .. 250 .. "&Format=Png&userId="
v5 = "http://www.roblox.com/Thumbs/Avatar.ashx?x=" .. 250 .. "&y=" .. 250 .. "&Format=Png&username="
local v12 = Instance.new("BindableFunction", game.ReplicatedStorage)
v12.Name = "GetPlayerImage"
local function FindImage_1(p1)
    local v17, v18, v19 = pairs(v4)
    for v25, v21 in v17, v18, v19 do
        local v20 = v21.Name
        v20 = v21.userId
        local v24 = tostring(p1)
        if v20 == v24 then
            v20 = v21.Image
            v24 = v25
            return v20, v24
        end
    end
    if v20 ~= p1 then
        v17 = tonumber
        v18 = p1
        local v26 = v17(v18)
        if not v26 then
            v19 = p1
            v26 = v10 .. v19
            return v26, nil
        end
        v19 = p1
        return v5 .. v19, nil
    end
end
v12.OnInvoke = FindImage_1
local function LoadPlayerImage_1(p2)
    local v36 = p2:IsA("Player")
    if not v36 then
        local v39 = p2.Name:find("Guest ")
        if not v39 then
            v39 = v10
            local v40 = "1"
            v36 = v39 .. v40
            if v36 then
                v39 = p2.userId
                v40 = 1
                if v40 > v39 then
                    v39 = v10
                    v40 = "1"
                    v36 = v39 .. v40
                    if v36 then
                        v39 = v10
                        v40 = p2.userId
                        v36 = v39 .. v40
                    end
                    v39 = v3
                    v39:Preload(v36)
                    v40 = v36
                    local v51 = {}
                    v51.Name = p2.Name
                    v51.userId = tostring(p2.userId)
                    v51.RawImage = v36
                    v51.Image = v40 .. "&bust=" .. math.floor(tick())
                    v40 = table.insert
                    v40(v4, v51)
                    return 
                end
            end
        end
    end
end
game.Players.ChildAdded:connect(LoadPlayerImage_1)
game.Players.ChildRemoved:connect(function(p3)
    local v58, v59 = FindImage_1(p3.Name)
    if not v59 then
        table.remove(v4, v59)
    end
end)
local v64 = game
local v65, v66, v64 = pairs(v64.Players:GetPlayers())
for v70, v69 in v65, v66, v64 do
    LoadPlayerImage_1(v69)
end
