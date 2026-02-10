function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64972) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Freeza Set.")
local bag = doPlayerAddItem(cid, 13598, 1)
local bag = doPlayerAddItem(cid, 13596, 1)
local bag = doPlayerAddItem(cid, 13599, 1)
local bag = doPlayerAddItem(cid, 13597, 1)
local bag = doPlayerAddItem(cid, 13613, 1)
setPlayerStorageValue(cid, 64972, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end