function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60021 then
		if getPlayerStorageValue(cid,60021) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Janemba Armor!")
			doPlayerAddItem(cid,12654,1)
			setPlayerStorageValue(cid,60021,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end