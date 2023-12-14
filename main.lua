for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
	v:Disable()
end

game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "AutoFarm", -- Required
	Text = "O autofarm começou", -- Required
})

while wait() do
		
		
				
		
		

			
		
		local Workspace = game:GetService('Workspace')
		local Players = game:GetService('Players')
		local Client = Players.LocalPlayer
		local tentativas = 0;
		local pathfindingService = game:GetService("PathfindingService")
		local humanoid = Client.Character:WaitForChild("Humanoid")
		local Character = Client.Character;
		local Humanoid = Character:FindFirstChild("Humanoid") or Character:WaitForChild("Humanoid");
		local RootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart");
		local RunService = game:GetService('RunService');

 		local c;
		local h;
		local bv;
		local bav;
		local cam;
		local flying;
		local p = Client;
			
		local StartFly = function ()
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
		    flying = true;
		    h.Died:connect(function() flying = false end);
		end;
	
			




		
		StartFly()
		local CoinContainer = Workspace:FindFirstChild("CoinContainer", true);
	 	if CoinContainer and Client.PlayerGui.MainGUI.Game.CoinBagOld.Coins == true then
		    print("oi")
                    local coin = CoinContainer:FindFirstChild("Coin_Server");
                    if coin then
                        repeat
                            RootPart.CFrame = CFrame.new(coin.Position - Vector3.new(0, 1.5, 0)) * CFrame.Angles(0, 0, math.rad(180));
                            RunService.Stepped:Wait();
                            
                        until not coin:IsDescendantOf(Workspace) or coin.Name ~= "Coin_Server";
                wait(1.5);
            
		end	
	end
end
