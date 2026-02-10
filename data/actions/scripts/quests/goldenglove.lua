function onUse(cid, item, frompos, item2, topos)
	if item.uid == 64980 then
		if getPlayerStorageValue(cid,64980) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Golden Glove!")
			doPlayerAddItem(cid,12710,1)
			setPlayerStorageValue(cid,64980,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end