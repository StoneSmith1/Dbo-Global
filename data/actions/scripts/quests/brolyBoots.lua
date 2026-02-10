function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60038 then
		if getPlayerStorageValue(cid,60038) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Broly Boots!")
			doPlayerAddItem(cid,12690,1)
			setPlayerStorageValue(cid,60038,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end