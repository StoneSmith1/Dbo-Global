function onSay(cid, words, param)
	if getGlobalStorageValue(COH_STATUS) == getPlayerGuildName(cid) then
		if(getTilePzInfo(getCreaturePosition(cid))) then
			doTeleportThing(cid, {x= 642, y= 719, z= 7})
		else
			doPlayerSendCancel(cid, "[CoH] Voce deve estar em área PZ.")
		end
	else
		doPlayerSendCancel(cid, "[CoH] Sua guild não é dona do castelo.")
	end
return true
end