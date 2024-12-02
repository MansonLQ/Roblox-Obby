local LavaScript = require(game.ReplicatedStorage.LavaScript)  --import the LavaScript

local lavaBlock = script.Parent  --part corresponding to this script

--connect the part to kill function
LavaScript.EnableKill(lavaBlock)
