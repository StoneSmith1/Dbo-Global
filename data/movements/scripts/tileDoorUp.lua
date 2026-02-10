function onStepIn(cid, item, position, fromPosition)
local newPosition = {x = position.x, y = position.y - 1, z = position.z}
for k = 1, 1 do
	addEvent(function()
		if isPlayer(cid) then
			doRelocate(position, newPosition)
		end
	end, 1000*k)
end
return true
end