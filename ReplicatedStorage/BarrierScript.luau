--import barrier script
local BarrierScript = {}

--makea  function to handle the trigger event
function BarrierScript.deactivateBarrier(triggerWall, targetWall)
	--make sure both walls exist and are valid parts
	if not triggerWall:IsA("BasePart") or not targetWall:IsA("BasePart") then
		warn("TriggerWall or TargetWall is not a valid BasePart")
		return
	end

	--event listener for when a player touches the trigger wall
	triggerWall.Touched:Connect(function(hit)
		--check if the toucher is a player's character
		local character = hit.Parent
		local humanoid = character and character:FindFirstChild("Humanoid")
		if humanoid then
			--make the target wall uncollidable
			targetWall.CanCollide = false
			print("Target wall is now uncollidable!")

			--delay before re-enabling collision
			wait(5) 
			targetWall.CanCollide = true
			print("Target wall collision re-enabled.")
		end
	end)
end

return BarrierScript

