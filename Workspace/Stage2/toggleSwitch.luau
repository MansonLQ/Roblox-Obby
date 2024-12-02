local triggerWall = workspace.Stages.two.startTrigger --wall that will trigger the change
local tiles = workspace.Stages.two.switchTiles --folder containing all the tiles
local endTrigger = workspace.Stages.two.endTrigger

local isTriggered = false --prevent multiple activations

local LavaScript = require(game.ReplicatedStorage.LavaScript)
local LavaScriptToggle = game.ReplicatedStorage.LavaScriptToggle


--function to switch tile properties
local function switchTiles()
	for _, tile in ipairs(tiles:GetChildren()) do
		if tile:IsA("BasePart") then
			if tile.Name == "type1" then
				--change normal tile to lava tile
				tile.BrickColor = BrickColor.new("Bright red") 
				tile.Transparency = 0
				tile.Name = "type2" --rename to lava tile

				--add the onTouch script for lava behavior
				if not tile:FindFirstChild("onTouch") then
					local onTouchScript = LavaScriptToggle:Clone()
					onTouchScript.Name = "onTouch"
					onTouchScript.Parent = tile
					
					--LavaScript.EnableKill(tile)
					
				end

			elseif tile.Name == "type2" then
				--change lava tile back to normal tile
				--tile.BrickColor = BrickColor.new("Medium stone grey") -- Normal color
				tile.Transparency = 1

				tile.Name = "type1" --rename to normal tile

				--remove the onTouch script
				if tile:FindFirstChild("onTouch") then
					tile.onTouch:Destroy()
				end
			end
		end
	end
end

--trigger event
local function onTouched(hit)
	if isTriggered then return end --prevent multiple activations
	local character = hit.Parent
	if character:FindFirstChild("Humanoid") then
		isTriggered = true --set triggered flag
		
		while isTriggered do
			switchTiles()
			wait(1)
		end
		
		--start switching tiles every second
	
	end
end

local function endStage()
	if not isTriggered then return end 
	isTriggered = false --reset triggered flag
	switchTiles() --switch tiles back to normal
end

endTrigger.Touched:Connect(endStage)
--connect the touch event
triggerWall.Touched:Connect(onTouched)

