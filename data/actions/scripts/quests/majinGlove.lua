function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60082 then
		if getPlayerStorageValue(cid,60082) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Majin Glove!")
			doPlayerAddItem(cid,12706,1)
			setPlayerStorageValue(cid,60082,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end