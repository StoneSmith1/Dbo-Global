function onUse(cid, item, frompos, item2, topos)
if item.itemid == 5958 then
local playerpos = getCreaturePosition(cid)
doRemoveItem(item.uid,5958)
doPlayerAddPremiumDays(cid, 30)
doSendMagicEffect(playerpos, 34)
doPlayerSendTextMessage(cid,22,"Voce recebeu 30 dias de premium account.")
end
end