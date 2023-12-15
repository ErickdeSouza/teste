local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
local tentativas = 0;
local humanoid = Client.Character:WaitForChild("Humanoid")
local Character = Client.Character;
local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
local RunService = game:GetService('RunService');

 

 
local hZ = 1 / 60
local speed = .8

 
 
 
local c;
local h;
local bv;
local bav;
local cam;
local flying = true;

 
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
    h.Died:connect(function() flying = false end)
 
end
 
 
 
function movemodel(model,start,ennd,AddBy, CoinContainer)
 
 local i = 0
 
  local x = game:GetService("RunService").Heartbeat:Wait() / hZ
  i = math.clamp(i + (AddBy * x), 0, 1)
  local success, result = pcall(function()
    model:SetPrimaryPartCFrame(start:Lerp(ennd,i))
  end)
end
  

 
function noclip()
local success, result = pcall(function()
    for _, part in pairs(Client.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end)
end
 
 
 game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "AutoFarm", -- Required
	Text = "Autofarm começou", 
})
 
 
while wait() do
	local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
    if CoinContainer and Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == true then
        local coin = CoinContainer:FindFirstChild("Coin_Server")
        
        noclip()
        if coin then
            repeat
		local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");
                local dist = (RootPart.CFrame.p - CFrame.new(coin.Position).p).Magnitude / speed
                local add = 1 / dist
                movemodel(Client.Character, RootPart.CFrame, CFrame.new(coin.Position), add, CoinContainer)
            until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server"
            wait(1.5)
        end
    end
end
