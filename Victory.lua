local v3 = script.Parent.SheriffVictory
v3.Visible = true
local v5 = game:GetService("TweenService")
local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v13 = {}
local v16 = {}
v16.Size = UDim2.new(1, 0, 1, 0)
local v53 = {}
v53.Position = UDim2.new(0.975, 0, 0.5, 0)
v53.Rotation = 0
local v55 = {}
v55.Position = UDim2.new(0.025, 0, 0.5, 0)
v55.Rotation = 0
v13[1] = v5:Create(v3.Container, v12, v16)
v13[2] = v5:Create(v3.KnifeRight, v12, v53)
v13[3] = v5:Create(v3.KnifeLeft, v12, v55)
local v46, v47, v44 = pairs(v13)
for v45, v49 in v46, v47, v44 do
    v49:Play()
end
