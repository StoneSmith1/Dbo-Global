function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 65452) < 1 then
doPlayerSendTextMessage(cid,22,"Voce recebeu seus itens.")
local bag = doPlayerAddItem(cid, 2150, 1000)
setPlayerStorageValue(cid, 65452, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end