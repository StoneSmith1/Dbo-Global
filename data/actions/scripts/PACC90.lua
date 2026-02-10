function onUse(cid, item, frompos, item2, topos)
if item.itemid == 9004 then
local playerpos = getCreaturePosition(cid)
doRemoveItem(item.uid,9004)
doPlayerAddPremiumDays(cid, 90)
doSendMagicEffect(playerpos, 34)
doPlayerSendTextMessage(cid,22,"Voce recebeu 90 dias de premium account.")
end
end