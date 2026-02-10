function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60086 then
		if getPlayerStorageValue(cid,60086) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Saiyan Boots!")
			doPlayerAddItem(cid,12686,1)
			setPlayerStorageValue(cid,60086,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end