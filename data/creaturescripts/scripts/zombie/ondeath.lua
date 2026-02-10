function onDeath(cid)
setZombiesToSpawnCount(getZombiesToSpawnCount() + 2)
doCreatureSay(cid, "Eu voltarei!", 19)
return true
end