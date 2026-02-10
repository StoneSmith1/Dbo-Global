function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60043 then
		if getPlayerStorageValue(cid,60043) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma White Glove!")
			doPlayerAddItem(cid,12701,1)
			setPlayerStorageValue(cid,60043,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end