function onUse(cid, item, frompos, item2, topos)
if item.itemid == 5957 then
local playerpos = getCreaturePosition(cid)
doRemoveItem(item.uid,5957)
doPlayerAddPremiumDays(cid, 10)
doSendMagicEffect(playerpos, 34)
doPlayerSendTextMessage(cid,22,"Voce recebeu 10 dias de premium account.")
end
end