function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60034 then
		if getPlayerStorageValue(cid,60034) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Vilage Boots!")
			doPlayerAddItem(cid,12685,1)
			setPlayerStorageValue(cid,60034,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end