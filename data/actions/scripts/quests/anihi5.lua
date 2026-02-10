function onUse(cid, item, frompos, item2, topos) 
if item.uid == 60100 then
if item.itemid == 1945 then
player1pos = {x=555, y=788, z=8, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=555, y=789, z=8, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=555, y=790, z=8, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=555, y=791, z=8, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)
player3level = getPlayerLevel(player3.uid)
player4level = getPlayerLevel(player4.uid)

questlevel = 400

if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

queststatus1 = getPlayerStorageValue(player1.uid,6026)
queststatus2 = getPlayerStorageValue(player2.uid,6026)
queststatus3 = getPlayerStorageValue(player3.uid,6026)
queststatus4 = getPlayerStorageValue(player4.uid,6026)

if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then

monster1pos = {x=578, y=787, z=8}
monster2pos = {x=578, y=789, z=8}
monster3pos = {x=578, y=791, z=8}
monster4pos = {x=582, y=787, z=8}
monster5pos = {x=582, y=789, z=8}
monster6pos = {x=582, y=791, z=8}
monster7pos = {x=580, y=787, z=8}
monster8pos = {x=580, y=786, z=8}
monster9pos = {x=579, y=785, z=8}
monster10pos = {x=581, y=785, z=8}

doSummonCreature("Furie Janemba", monster1pos)
doSummonCreature("Furie Janemba", monster2pos)
doSummonCreature("Furie Janemba", monster3pos)
doSummonCreature("Furie Janemba", monster4pos)
doSummonCreature("Furie Janemba", monster5pos)
doSummonCreature("Furie Janemba", monster6pos)
doSummonCreature("Hell Janemba", monster7pos)
doSummonCreature("Hell Janemba", monster8pos)
doSummonCreature("Hell Ghost", monster9pos)
doSummonCreature("Hell Ghost", monster10pos)

nplayer1pos = {x=580, y=788, z=8}
nplayer2pos = {x=580, y=789, z=8}
nplayer3pos = {x=580, y=790, z=8}
nplayer4pos = {x=580, y=791, z=8}

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)
doSendMagicEffect(player3pos,2)
doSendMagicEffect(player4pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)
doTeleportThing(player3.uid,nplayer3pos)
doTeleportThing(player4.uid,nplayer4pos)

doSendMagicEffect(nplayer1pos,10)
doSendMagicEffect(nplayer2pos,10)
doSendMagicEffect(nplayer3pos,10)
doSendMagicEffect(nplayer4pos,10)

doTransformItem(item.uid,item.itemid+0)

else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
elseif item.itemid == 1945 then
if getPlayerAccess(cid) == 3 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
end
end
return 1
end