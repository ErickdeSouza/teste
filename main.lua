local RunService = game:GetService('RunService');
local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local tentativas = 0;
local pathfindingService = game:GetService("PathfindingService")
local humanoid = Client.Character:WaitForChild("Humanoid")
local Character = Client.Character;
local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");




local hZ = 1 / 60
local speed = .3
local Start = CFrame.new(0, 0, 0) -- Set this to be equal to what the start position of the part should be.
local End = CFrame.new(0, 5, 100) -- Where you want to move the part to.

function movemodel(model,start,End,AddBy)
    local i = 0
 repeat
  local x = game:GetService("RunService").Heartbeat:Wait() / hZ
  i = math.clamp(i + (AddBy * x), 0, 1)
  model:SetPrimaryPartCFrame(Start:Lerp(End,i))
 until i >= 1
end

local dist = (Start.Position - End.Position).Magnitude / speed

local add = 1 / dist





 
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    v:Disable()
end
 
  game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "AutoFarm", -- Required
                    Text = "O autofarm começou", -- Required
                })


local c;
local h;
local bv;
local bav;
local cam;
local flying;
local p = Client;
 
 
 
 
function StartFly()
    if not Client.Character or not Character.Head or flying then return end;
    c = Character;
    h = Humanoid;
    h.PlatformStand = true;
    cam = workspace:WaitForChild('Camera');
    bv = Instance.new("BodyVelocity");
    bav = Instance.new("BodyAngularVelocity");
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000;
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000;
    bv.Parent = c.Head;
    bav.Parent = c.Head;
    h.Died:connect(function() flying = false end);
end
 
 
 
 
 
while wait() do
 
 
 
 
 
function tornarInvisivel()
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1  -- Define a transparência como 100%, tornando-o invisível
        end
    end
end
 
 
function noclip()
    for _, part in pairs(Client.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

 

            local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
                if CoinContainer then
                    local coin = CoinContainer:FindFirstChild("Coin_Server");
                    StartFly();
                    noclip()
                    if coin then
                        repeat
                            local dist = (RootPart.Position - coin.Position).Magnitude / speed
                            local add = 1 / dist
                            movemodel(Client.Character, RootPart.Position, coin.Position, add)
                            if not getgenv().Autofarm then break end;
                        until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server";
                wait(1.5);
            end
        end
