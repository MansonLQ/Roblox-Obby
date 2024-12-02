local TweenService = game:GetService("TweenService")

--get the hinge parts
local hinge = script.Parent.Doorframe.Hinge
local prompt = script.Parent.Base.ProximityPrompt

--create tables for goal open and close actions
local goalOpen = {}
goalOpen.CFrame = hinge.CFrame * CFrame.Angles(0, math.rad(90), 0)

local goalClose = {}
goalClose.CFrame = hinge.CFrame * CFrame.Angles(0, 0, 0)

local tweenInfo = TweenInfo.new(1)
local tweenOpen = TweenService:Create(hinge, tweenInfo, goalOpen)
local tweenClose = TweenService:Create(hinge, tweenInfo, goalClose)

local doorClosed = true

--if the door is closed, open it and close it after 2 seconds
prompt.Triggered:Connect(function()
	if doorClosed then
		
		tweenOpen:Play()
		prompt.ActionText = "Close"
		wait(2)
		tweenClose:Play()
		prompt.ActionText = "Open"
		doorClosed = true 
	else
		tweenClose:Play()
		prompt.ActionText = "Open"
		doorClosed = true
	end
end)

