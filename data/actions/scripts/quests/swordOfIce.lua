function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60053 then
		if getPlayerStorageValue(cid,60053) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Sword Of Ice!")
			doPlayerAddItem(cid,12731,1)
			setPlayerStorageValue(cid,60053,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end