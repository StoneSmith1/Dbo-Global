function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 65533) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Hitto Set.")
local bag = doPlayerAddItem(cid, 13519, 1)
local bag = doPlayerAddItem(cid, 13518, 1)
local bag = doPlayerAddItem(cid, 13517, 1)
local bag = doPlayerAddItem(cid, 13516, 1)
local bag = doPlayerAddItem(cid, 13515, 1)
setPlayerStorageValue(cid, 65533, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end