local triggerPart = script.Parent.triggerWall  --part that detects touch
local movingPartLeft = script.Parent.splitLeft --part that will move left
local movingPartRight = script.Parent.splitRight  --part that will move right
local hasMoved = false  --flag to check if parts have moved
local originalPositionLeft = movingPartLeft.Position  --original position of the left part
local originalPositionRight = movingPartRight.Position  --original position of the right part
local moveDistance = 10  --distance to move the parts
local TweenService = game:GetService("TweenService")  --tweenService

--function to create and play a tween
local function tweenPart(part, targetPosition, duration)
	local tweenInfo = TweenInfo.new(
		duration,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out
	)
	local tweenGoal = { Position = targetPosition }
	local tween = TweenService:Create(part, tweenInfo, tweenGoal)
	tween:Play()
	return tween
end

--function to move the parts
local function moveParts()
	local leftTargetPosition = originalPositionLeft - Vector3.new(0, 0, moveDistance)
	local rightTargetPosition = originalPositionRight + Vector3.new(0, 0, moveDistance)

	--start both tweens simultaneously
	tweenPart(movingPartLeft, leftTargetPosition, 0.15)
	tweenPart(movingPartRight, rightTargetPosition, 0.15)
end

--function to reset the parts to their original positions
local function resetParts()
	--ensure the parts return to their stored original positions
	tweenPart(movingPartLeft, originalPositionLeft, 1)
	tweenPart(movingPartRight, originalPositionRight, 1)

	--reset the flag
	hasMoved = false
end

--function to handle the touch event
local function onTouch(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid and not hasMoved then
		hasMoved = true

		--move the parts
		moveParts()
		print("Parts moved!")

		--wait and reset the parts
		task.wait(2)
		resetParts()
		print("Parts reset!")
	end
end

--connect the touch event to the trigger part
triggerPart.Touched:Connect(onTouch)