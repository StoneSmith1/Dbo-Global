function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60121 then
		if getPlayerStorageValue(cid,60121) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Legendary Boots!")
			doPlayerAddItem(cid,12695,1)
			setPlayerStorageValue(cid,60121,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end