local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
local tentativas = 0;
local humanoid = Client.Character:WaitForChild("Humanoid")
local Character = Client.Character;
local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");
local RunService = game:GetService('RunService');
 
local hZ = 1 / 60
local speed = .8


function movemodel(model, start, ennd, AddBy)
    local i = 0
    local isMoving = true

    local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
    if CoinContainer and Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == true then
 
	    while isMoving do
	        local x = game:GetService("RunService").Heartbeat:Wait() / hZ
	        i = math.clamp(i + (AddBy * x), 0, 1)
	
	        local success, result = pcall(function()
	            model:SetPrimaryPartCFrame(start:Lerp(ennd, i))
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
 
 
 
 
 
while wait() do
    local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
    if CoinContainer and Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == true then
        local coin = CoinContainer:FindFirstChild("Coin_Server")
        
        noclip()
        if coin then
            repeat
                local dist = (RootPart.CFrame.p - CFrame.new(coin.Position).p).Magnitude / speed
                local add = 1 / dist
                movemodel(Client.Character, RootPart.CFrame, CFrame.new(coin.Position), add)
		RunService.Stepped:Wait();
            until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server"
            wait(1.5)
        end
    end
end
