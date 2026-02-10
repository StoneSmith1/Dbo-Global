function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64985) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Fusion Set.")
local bag = doPlayerAddItem(cid, 12694, 1)
local bag = doPlayerAddItem(cid, 12660, 1)
local bag = doPlayerAddItem(cid, 12680, 1)
setPlayerStorageValue(cid, 64985, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end