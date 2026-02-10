function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60039 then
		if getPlayerStorageValue(cid,60039) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Majin Boots!")
			doPlayerAddItem(cid,12691,1)
			setPlayerStorageValue(cid,60039,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end