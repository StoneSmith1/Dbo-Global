function onStepIn(cid, item, position, fromPosition)
local newPosition = {x = position.x + 1, y = position.y, z = position.z}
local player = getTopCreature({x = position.x, y = position.y, z = position.z})
addEvent(function()
	if player.type == 2 then
		doRelocate(position, newPosition)
	end
end, 2000)
return true
end