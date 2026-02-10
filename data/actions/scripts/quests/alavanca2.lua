function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=160, y=90, z=8, stackpos=1}
local tempo = 1*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 60002 and item.itemid == 9825 and getpiece1.itemid == 13017 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"Uma nova passagem foi aberta!")
addEvent(doCreateItem, tempo, 13017, piece1pos)
elseif item.uid == 60002 and item.itemid == 9826 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end