local LavaScript = {}

--function to make a part a lava part, which kills a player when they come into contact with corresponding part
function LavaScript.EnableKill(part)
	--if the parameter is not a part, then it will not kill
	if not part:IsA("BasePart") then
		print("Non base part object was passed into LavaScript.")
		return
	end

	--create a function to kill player on contact
	local function onTouch(hit)
		local character = hit.Parent  --check what element touched the part
		local humanoid = character:FindFirstChild("Humanoid")  --check if that element is a humanoid
		if humanoid then
			humanoid.Health = 0  --if humanoid character was passed into parameter, kill humanoid
			print(character.Name .. " died from " .. part.Name)
		end
	end

	--assign the onTouch funciton to the part
	part.Touched:Connect(onTouch)
end

return LavaScript --return script to be able to import it to other files

