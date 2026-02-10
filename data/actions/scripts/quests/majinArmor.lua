function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60017 then
		if getPlayerStorageValue(cid,60017) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Majin Armor!")
			doPlayerAddItem(cid,12652,1)
			setPlayerStorageValue(cid,60017,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end