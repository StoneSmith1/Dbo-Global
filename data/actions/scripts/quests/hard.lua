function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid, 65528) < 1 then
doPlayerSendTextMessage(cid,22,"Parabéns, Voce Acaba De Completar Supremo Vegetto Set.")
local bag = doPlayerAddItem(cid, 13509, 1)
local bag = doPlayerAddItem(cid, 13510, 1)
local bag = doPlayerAddItem(cid, 13511, 1)
local bag = doPlayerAddItem(cid, 13556, 1)
local bag = doPlayerAddItem(cid, 13542, 1)
local bag = doPlayerAddItem(cid, 12759, 1)
setPlayerStorageValue(cid, 65528, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já pegou seus itens.")
end

return TRUE
end