local BarrierScript = require(game.ReplicatedStorage.BarrierScript)  --import the LavaScript

local barrierWall = script.Parent.barrier  

local barrierTrigger = script.Parent.barrierTrigger  

--connect the part to kill function
BarrierScript.deactivateBarrier(barrierTrigger, barrierWall)
