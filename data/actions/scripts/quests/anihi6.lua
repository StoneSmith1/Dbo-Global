function onUse(cid, item, frompos, item2, topos) 
if item.uid == 60101 then
if item.itemid == 1945 then
player1pos = {x=788, y=128, z=8, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=789, y=128, z=8, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=790, y=128, z=8, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=791, y=128, z=8, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)
player3level = getPlayerLevel(player3.uid)
player4level = getPlayerLevel(player4.uid)

questlevel = 200

if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

queststatus1 = getPlayerStorageValue(player1.uid,6026)
queststatus2 = getPlayerStorageValue(player2.uid,6026)
queststatus3 = getPlayerStorageValue(player3.uid,6026)
queststatus4 = getPlayerStorageValue(player4.uid,6026)

if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then

monster1pos = {x=806, y=121, z=8}
monster2pos = {x=808, y=121, z=8}
monster3pos = {x=806, y=125, z=8}
monster4pos = {x=808, y=125, z=8}
monster5pos = {x=809, y=123, z=8}
monster6pos = {x=810, y=123, z=8}
monster7pos = {x=809, y=119, z=8}
monster8pos = {x=805, y=119, z=8}
monster9pos = {x=803, y=122, z=8}
monster10pos = {x=803, y=125, z=8}
monster11pos = {x=808, y=128, z=8}

doSummonCreature("Elder Namekjin", monster1pos)
doSummonCreature("Elder Namekjin", monster2pos)
doSummonCreature("Elder Namekjin", monster3pos)
doSummonCreature("Elder Namekjin", monster4pos)
doSummonCreature("Furie Namek", monster5pos)
doSummonCreature("Hell Fighter", monster6pos)
doSummonCreature("Fire Elemental", monster7pos)
doSummonCreature("Fire Elemental", monster8pos)
doSummonCreature("Fire Elemental", monster9pos)
doSummonCreature("Fire Elemental", monster10pos)
doSummonCreature("Fire Elemental", monster11pos)

nplayer1pos = {x=808, y=123, z=8}
nplayer2pos = {x=807, y=123, z=8}
nplayer3pos = {x=806, y=123, z=8}
nplayer4pos = {x=805, y=123, z=8}

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