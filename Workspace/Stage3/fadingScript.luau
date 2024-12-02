local FadingBlock = require(game.ReplicatedStorage.FadingBlock)  --import the LavaScript

local block = script.Parent  --part corresponding to this script

--connect the part to kill function
FadingBlock.handleTileTouch(block)