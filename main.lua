wait(5)

game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
    local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
    if GUI then
        if GUI.TitleFrame.ErrorTitle.Text == "Desconectado" then
            if #game.Players:GetPlayers() <= 1 then
                game.Players.LocalPlayer:Kick("\nRejoining...")
                wait()
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            else
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
            end
        end
    end
end)
function comecar()



local sucus, resut = pcall(function()
local First = game:GetService("Players").LocalPlayer
local button = First.PlayerGui.DeviceSelect.Container:FindFirstChild("Phone").Button
local VIM = game:GetService("VirtualInputManager")
if button.Visible == true then
local vu = game:GetService("VirtualUser") 
local ta = button.AbsoluteSize.X
local la = button.AbsoluteSize.Y
local x = button.AbsolutePosition.X + ta / 2
local y = button.AbsolutePosition.Y+ la / 2
print(x, "      ", y)
VIM:SendMouseButtonEvent(x, y, 0, true, nil, 0)
VIM:SendMouseButtonEvent(x, y, 0, false, nil,0)
end
end)




local inv = true




	
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "AutoFarm", -- Required
	Text = "Autofarm começou", 
})
 
while wait() do
local fds, fds2 = pcall(function()

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
local speed = 1

 
 


function movemodel(model, start, ennd, AddBy)
    local i = 0
    local isMoving = true
    
    while isMoving do
        local x = game:GetService("RunService").Heartbeat:Wait() / hZ
        i = math.clamp(i + (AddBy * x), 0, 1)

        local success, result = pcall(function()
            model:SetPrimaryPartCFrame(start:Lerp(CFrame.new(ennd), i))
        end)

        if not success then
            print("Erro ao mover o modelo:", result) -- Encerra o movimento em caso de erro
	    wait(2)
	    break
        end

        if i >= 1 or RootPart.CFrame == ennd then
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









	
	local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
    if CoinContainer and Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == true then
        local coin = CoinContainer:FindFirstChild("Coin_Server")
        local i = 0 
        if coin then
	    noclip()
	    if inv then
		inv = false
	    end	
	    
            repeat
		   local dist = (RootPart.CFrame.p - CFrame.new(coin.Position).p).Magnitude / speed
                   local add = 1 / dist
		   if Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == false then break end
                   movemodel(Client.Character, RootPart.CFrame, coin.Position, add)
		   





		    
		    --local hrp = Character:WaitForChild("HumanoidRootPart")
			
		    --local info = TweenInfo.new(2) -- how long the tween will play for
			
		    --local Animation = TweenService:Create(hrp, info, coin.Position)
		    --Animation:Play()
				
		   
		   

	    until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server"
            wait(0.7)
	end
     else
        inv = true
     end
end)
if not fds then
   print("Erro:", fds2)
   break
end
end
end


while wait() do
   comecar()
end


