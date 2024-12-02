local players = game:GetService("Players")
local dataStoreService = game:GetService("DataStoreService")

players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Value = 1
	stage.Parent = leaderstats
	
	
	--create death counter
	local deaths = Instance.new("IntValue")
	deaths.Name = "Deaths"  --title that is displayed on leaderboard
	deaths.Value = 0  --initialize to 0
	deaths.Parent = leaderstats
		
		player.CharacterAdded:Connect(function(character)
			local humanoid = character:WaitForChild("Humanoid")  --player to be rendered as humanoid
			humanoid.Died:Connect(function() --when a player dies, increase their death counter
				deaths.Value += 1  --increment the player's death counter
				print(player.Name .. " has died " .. deaths.Value .. " time(s).")
			end)
		end)	
end)