function onDeEquip(cid, item, slot)
doCreatureSay(cid, "Exp Bonus Cancelada!", 19)
doPlayerSetExperienceRate(cid, 1)
setPlayerStorageValue(cid, 325463, 0)
if not isPlayerPzLocked(cid) then
doRemoveCreature(cid)
end
return TRUE
end