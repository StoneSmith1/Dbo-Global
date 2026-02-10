function onLogin(cid)
    if getPlayerPremiumDays(cid) > 0 and getPlayerStorageValue(cid, 95498) == -1 then
        setPlayerStorageValue(cid, 95498, 1)
    end
    if getPlayerPremiumDays(cid) <= 0 and getPlayerStorageValue(cid, 95498) == 1 then
        setPlayerStorageValue(cid, 95498, -1)
        local temple = getTownTemplePosition(getPlayerTown(cid))
        doTeleportThing(cid, temple)
        doPlayerPopupFYI(cid, "Sua premium account acabou.") 
    end
 return true
end