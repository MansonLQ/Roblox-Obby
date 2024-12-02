local Players = game:GetService("Players")
local player = Players.LocalPlayer

--create a ScreenGui for the sound effect
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeathFlashGui"
screenGui.ResetOnSpawn = false -- Persist after respawn
screenGui.Parent = player:WaitForChild("PlayerGui")

--create the ImageLabel for flashing the image
local flashImage = Instance.new("ImageLabel")
flashImage.Name = "FlashImage"
flashImage.Size = UDim2.new(1, 0, 1, 0) --fullscreen
flashImage.BackgroundTransparency = 1
flashImage.ImageTransparency = 1 --initially invisible
flashImage.Image = "http://www.roblox.com/asset/?id=14937133281" --replace with your image asset ID
flashImage.Parent = screenGui

--add a sound effect on death
local function soundOnDeath()
	local winnerSound = script.Parent:FindFirstChild("deathYell") --reference to the sound
	if winnerSound then
		winnerSound:Play()
	end
end

--function to flash the image
local function flashImageOnDeath()
	soundOnDeath()
	flashImage.ImageTransparency = 0 --make the image visible
	wait(0.3)
	for i = 0, 1, 0.1 do
		flashImage.ImageTransparency = i --gradually fade out the image
		--task.wait(0.1) --delay for fade effect
	end
end



--listen for the player's death
local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")

	humanoid.Died:Connect(function()
		flashImageOnDeath()
	end)
end

--connect to the player's character
player.CharacterAdded:Connect(onCharacterAdded)

--check if a character already exists when the script starts
if player.Character then
	onCharacterAdded(player.Character)
end

