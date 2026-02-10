function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 65530) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Goku Set.")
local bag = doPlayerAddItem(cid, 12655, 1)
local bag = doPlayerAddItem(cid, 12627, 1)
local bag = doPlayerAddItem(cid, 12678, 1)
local bag = doPlayerAddItem(cid, 12693, 1)
local bag = doPlayerAddItem(cid, 12779, 1)
setPlayerStorageValue(cid, 65530, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end