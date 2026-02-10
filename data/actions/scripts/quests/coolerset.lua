function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 64984) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Cooler Set.")
local bag = doPlayerAddItem(cid, 13585, 1)
local bag = doPlayerAddItem(cid, 13584, 1)
local bag = doPlayerAddItem(cid, 13586, 1)
local bag = doPlayerAddItem(cid, 13583, 1)
local bag = doPlayerAddItem(cid, 13555, 1)
setPlayerStorageValue(cid, 64984, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end