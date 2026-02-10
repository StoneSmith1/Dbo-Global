function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64973) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Portara Purple Set.")
local bag = doPlayerAddItem(cid, 13512, 1)
local bag = doPlayerAddItem(cid, 13513, 1)
local bag = doPlayerAddItem(cid, 13514, 1)
setPlayerStorageValue(cid, 64973, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end