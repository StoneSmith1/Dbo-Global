function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60046 then
		if getPlayerStorageValue(cid,60046) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Vulcan Glove!")
			doPlayerAddItem(cid,12707,1)
			setPlayerStorageValue(cid,60046,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end