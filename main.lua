local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
local tentativas = 0;
local humanoid = Client.Character:WaitForChild("Humanoid")
local Character = Client.Character;
local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
local RunService = game:GetService('RunService');
local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");

 
local hZ = 1 / 60
local speed = .6

 
 
local j = 0;
local c;
local h;
local bv;
local bav;
local cam;
local flying = true;
local sla;
 
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

 


function movemodel(model, start, ennd, AddBy)
    local i = 0
    local isMoving = true
    
    while isMoving do
        local x = game:GetService("RunService").Heartbeat:Wait() / hZ
        i = math.clamp(i + (AddBy * x), 0, 1)

        local success, result = pcall(function()
           model:SetPrimaryPartCFrame(start:Lerp(CFrame.new(ennd - Vector3.new(0, 2.5, 0)) * CFrame.Angles(0, 0, math.rad(90)), i))
        end)

        if not success then
            print("Erro ao mover o modelo:", result)
            isMoving = false  -- Encerra o movimento em caso de erro
        end

        if i >= 1 then
            isMoving = false  -- Encerra o movimento quando atinge o destino
        end

        RunService.Stepped:Wait()
    end
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
        local i = 0 
        if coin then
	    noclip()
            repeat
		   --local dist = (RootPart.CFrame.p - CFrame.new(coin.Position).p).Magnitude / speed
                   --local add = 1 / dist
                   --movemodel(Client.Character, RootPart.CFrame, coin.Position, add)
		   --if Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == false then break end






		    
		    local hrp = Character:WaitForChild("HumanoidRootPart")
			
		    local info = TweenInfo.new(2) -- how long the tween will play for
			
		    local Animation = TweenService:Create(hrp, info, coin.Psotion)
		    Animation:Play()
				
		   game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Aviso",Text = 'oa',}) 
		   wait(0.1)

	    until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server"
            wait(1.2)
        end
    end
end
