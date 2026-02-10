function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60042 then
		if getPlayerStorageValue(cid,60042) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Fusion Boots!")
			doPlayerAddItem(cid,12694,1)
			setPlayerStorageValue(cid,60042,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end