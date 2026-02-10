function onUse(cid, item, frompos, item2, topos)
	if item.uid == 64979 then
		if getPlayerStorageValue(cid,64979) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Dragon Glove!")
			doPlayerAddItem(cid,12713,1)
			setPlayerStorageValue(cid,64979,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end