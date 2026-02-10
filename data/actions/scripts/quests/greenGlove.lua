function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60071 then
		if getPlayerStorageValue(cid,60071) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Green Glove!")
			doPlayerAddItem(cid,12702,1)
			setPlayerStorageValue(cid,60071,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end