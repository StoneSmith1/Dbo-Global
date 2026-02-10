function onUse(cid, item, frompos, item2, topos) 
if item.uid == 60099 then
if item.itemid == 1945 then
player1pos = {x=162, y=309, z=8, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=162, y=308, z=8, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=162, y=307, z=8, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=162, y=306, z=8, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)
player3level = getPlayerLevel(player3.uid)
player4level = getPlayerLevel(player4.uid)

questlevel = 150

if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

queststatus1 = getPlayerStorageValue(player1.uid,6026)
queststatus2 = getPlayerStorageValue(player2.uid,6026)
queststatus3 = getPlayerStorageValue(player3.uid,6026)
queststatus4 = getPlayerStorageValue(player4.uid,6026)

if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then

monster1pos = {x=190, y=352, z=8}
monster2pos = {x=192, y=352, z=8}
monster3pos = {x=190, y=356, z=8}
monster4pos = {x=192, y=356, z=8}
monster5pos = {x=194, y=351, z=8}
monster6pos = {x=189, y=350, z=8}
monster7pos = {x=187, y=353, z=8}
monster8pos = {x=187, y=356, z=8}
monster9pos = {x=192, y=359, z=8}
monster10pos = {x=193, y=354, z=8}
monster11pos = {x=194, y=354, z=8}

doSummonCreature("Super Bojack", monster1pos)
doSummonCreature("Super Bojack", monster2pos)
doSummonCreature("Super Bojack", monster3pos)
doSummonCreature("Super Bojack", monster4pos)
doSummonCreature("Fire Elemental", monster5pos)
doSummonCreature("Fire Elemental", monster6pos)
doSummonCreature("Fire Elemental", monster7pos)
doSummonCreature("Fire Elemental", monster8pos)
doSummonCreature("Fire Elemental", monster9pos)
doSummonCreature("Broly", monster10pos)
doSummonCreature("Gohan Ssj4", monster11pos)

nplayer1pos = {x=192, y=354, z=8}
nplayer2pos = {x=191, y=354, z=8}
nplayer3pos = {x=190, y=354, z=8}
nplayer4pos = {x=189, y=354, z=8}

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