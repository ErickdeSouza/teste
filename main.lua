wait(2.5)
local hZ = 1 / 60
local speed = .3
local start = CFrame.new(0, 0, 0) -- Set this to be equal to what the start position of the part should be.
local End = CFrame.new(0, 5, 100) -- Where you want to move the part to.

function movemodel(model,start,End,AddBy)
    local i = 0
 repeat
  local x = game:GetService("RunService").Heartbeat:Wait() / hZ
  i = math.clamp(i + (AddBy * x), 0, 1)
  model:SetPrimaryPartCFrame(start:Lerp(End,i))
 until i >= 1
end

local dist = (Start.Position - End.Position).Magnitude / speed

local add = 1 / dist
local Players = game:GetService('Players')
local Client = Players.LocalPlayer

movemodel(Client.Character, start, End, add)
