function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60119 then
		if getPlayerStorageValue(cid,60119) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Legendary Armor!")
			doPlayerAddItem(cid,12662,1)
			setPlayerStorageValue(cid,60119,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end