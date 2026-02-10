function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64983) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Janemba Set.")
local bag = doPlayerAddItem(cid, 12689, 1)
local bag = doPlayerAddItem(cid, 12654, 1)
local bag = doPlayerAddItem(cid, 12632, 1)
local bag = doPlayerAddItem(cid, 12679, 1)
setPlayerStorageValue(cid, 64983, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end