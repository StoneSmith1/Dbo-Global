function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64987) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Super Goku Set.")
local bag = doPlayerAddItem(cid, 13526, 1)
local bag = doPlayerAddItem(cid, 13527, 1)
local bag = doPlayerAddItem(cid, 13528, 1)
local bag = doPlayerAddItem(cid, 12631, 1)
setPlayerStorageValue(cid, 64987, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end