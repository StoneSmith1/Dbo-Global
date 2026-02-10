function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

if isPlayer(cid) then
doPlayerAddSoul(cid, 1)
end
return true
end