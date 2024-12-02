local winnerEvent = game.ReplicatedStorage.WinnerEvent --reference the winner event
local player = game.Players.LocalPlayer
local imageGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):WaitForChild("ImageLabel")

--the image to display whent he user wins
local imageID = 'rbxassetid://97359846378904'

--when a winner even happens, make the image visible to users
winnerEvent.OnClientEvent:Connect(function()
	print(imageID)
	if imageGui then
		print("Image label found!")
		imageGui.Image = imageID
		imageGui.Visible = true
		wait(10)
		imageGui.Visible = false
		
	end
end)