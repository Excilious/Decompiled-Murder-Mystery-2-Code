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
