function onThink(cid, interval)
local itemid = 13490
local outfit = {lookType = 363}

if isPlayer(cid) then
if getPlayerItemCount(cid, itemid) >= 1 then
if getPlayerStorageValue(cid,30023) == 4 then
doPlayerSetVocation(cid, 454)
else
doPlayerSetVocation(cid, 449)
end
doPlayerRemoveItem(cid, itemid, 1)
doCreatureChangeOutfit(cid, outfit)
addEvent(doRemoveCreature, 1, cid)
end
end
return true
end