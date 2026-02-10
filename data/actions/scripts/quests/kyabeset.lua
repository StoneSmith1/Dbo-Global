function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64986) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Kyabe Set.")
local bag = doPlayerAddItem(cid, 13523, 1)
local bag = doPlayerAddItem(cid, 13524, 1)
local bag = doPlayerAddItem(cid, 13525, 1)
local bag = doPlayerAddItem(cid, 12780, 1)
setPlayerStorageValue(cid, 64986, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end