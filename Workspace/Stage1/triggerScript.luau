local triggerPart = script.Parent  --that part that detects touch
local movingPart = workspace.Stages.one.movingLava  --the part that will move
local hasMoved = false  --flag to check if part has moved
local originalPosition = movingPart.Position  --original position of the platform
local moveDistance = 10  --distance to move part
local TweenService = game:GetService("TweenService")  --TweenService

--create and play a tween, takes a moving part, position of end animation, duration of animation
local function tweenPart(part, targetPosition, duration)
	local tweenInfo = TweenInfo.new(
		duration,  --time it takes for the tween to complete
		Enum.EasingStyle.Linear,  --movement style
		Enum.EasingDirection.Out  --movement direction
	)

	--set the goal position
	local tweenGoal = { Position = targetPosition }

	--create and play the tween
	local tween = TweenService:Create(part, tweenInfo, tweenGoal)
	tween:Play()
	tween.Completed:Wait()  --wait for the tween to complete
end

--function to move the part up
local function movePartUp()
	local targetPosition = originalPosition + Vector3.new(0, moveDistance, 0)
	tweenPart(movingPart, targetPosition, 0.15)  --adjust duration to change animaqtion speed
end

--function to reset the part
local function resetPart()
	tweenPart(movingPart, originalPosition, 1)  --adjust duration to change animaqtion speed
	hasMoved = false  ---reset flag
end

--function to handle touch events
local function onTouch(hit)
	--check if the touching object is a player or NPC
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid and not hasMoved then
		hasMoved = true  --set flag to true after it is touched 

		--move the part up using TweenService
		movePartUp()
		print("Part moved!")
		
		wait(2)
	
		resetPart()
		
	end
end

--connect the function to the trigger part associated with this script
triggerPart.Touched:Connect(onTouch)
