function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60047 then
		if getPlayerStorageValue(cid,60047) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Skull Glove!")
			doPlayerAddItem(cid,12709,1)
			setPlayerStorageValue(cid,60047,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end