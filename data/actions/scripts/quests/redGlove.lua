function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60083 then
		if getPlayerStorageValue(cid,60083) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Red Glove!")
			doPlayerAddItem(cid,12700,1)
			setPlayerStorageValue(cid,60083,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end