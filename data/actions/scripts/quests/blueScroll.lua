function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60061 then
		if getPlayerStorageValue(cid,60061) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Blue Scroll!")
			doPlayerAddItem(cid,12772,1)
			setPlayerStorageValue(cid,60061,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end