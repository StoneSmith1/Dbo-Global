function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60045 then
		if getPlayerStorageValue(cid,60045) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Saiyan Glove!")
			doPlayerAddItem(cid,12705,1)
			setPlayerStorageValue(cid,60045,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end