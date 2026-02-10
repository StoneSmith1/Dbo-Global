function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64981) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Ganhar 20 Golds.")
local bag = doPlayerAddItem(cid, 2160, 25)
setPlayerStorageValue(cid, 64981, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end