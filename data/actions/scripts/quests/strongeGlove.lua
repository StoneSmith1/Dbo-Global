function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60044 then
		if getPlayerStorageValue(cid,60044) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Stronge Glove!")
			doPlayerAddItem(cid,12703,1)
			setPlayerStorageValue(cid,60044,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end