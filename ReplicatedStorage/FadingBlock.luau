local FadingBlock = {}

local TweenService = game:GetService("TweenService")

--handle when a tile is stepped on
function FadingBlock.handleTileTouch(tile)
	--ensure the part isn't already disappearing
	
	local function onTouch(hit)

		if tile:GetAttribute("IsDisappearing") then
			return
		end

		--mark the tile as disappearing to prevent duplicate triggers
		tile:SetAttribute("IsDisappearing", true)

		--create a Tween by setting tween info and properties to change during the tween.
		local dissapearInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.In
		)

		local dissapearGoal = 
			{
				Transparency = 1	
			}

		local dissapearTween = TweenService:Create(tile, dissapearInfo, dissapearGoal)

		--gradually make the tile disappear

		dissapearTween:Play()
		dissapearTween.Completed:Wait()
		tile.CanCollide = false

		--wait before reappearing
		wait(1) 

		--create a Tween by setting tween info and properties to change during the tween.
		local reappearInfo = TweenInfo.new(
			0.8,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)

		local reappearGoal = 
			{
				Transparency = 0	
			}

		local reappearTween = TweenService:Create(tile, reappearInfo, reappearGoal)

		--gradually make the tile reappear
		
		tile.CanCollide = true
		tile:SetAttribute("IsDisappearing", false)
		reappearTween:Play()
		reappearTween.Completed:Wait()

		--enable collision and reset state
		
		
	end

	--assign the onTouch funciton to the part
	
	tile.Touched:Connect(onTouch)
end

return FadingBlock