function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60077 then
		if getPlayerStorageValue(cid,60077) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Sword Of Fire!")
			doPlayerAddItem(cid,12729,1)
			setPlayerStorageValue(cid,60077,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end