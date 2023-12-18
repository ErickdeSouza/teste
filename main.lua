
function comecar()






local ScriptStarted = false
local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.
local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
local IsInvisible = false
RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.7
      end
  end
end
local CanInvis = true
function RealCharacterDied()
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)
PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
  if IsInvisible == false then
      local StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = StoredCF
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end
      IsInvisible = true
  else
      local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
     
      RealCharacter.HumanoidRootPart.CFrame = StoredCF
     
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end




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
local speed = .6

 
 


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









	
	local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
    if CoinContainer and Client.PlayerGui.MainGUI.Lobby.Dock.CoinBag.Visible == true then
        local coin = CoinContainer:FindFirstChild("Coin_Server")
        local i = 0 
        if coin then
	    noclip()
	    if inv then
	        Invisible()
		inv = false
		wait(3)
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
				
		   
		   wait(0.1)

	    until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server"
            wait(1.2)
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


