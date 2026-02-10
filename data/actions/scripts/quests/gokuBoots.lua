function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60041 then
		if getPlayerStorageValue(cid,60041) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Goku Boots!")
			doPlayerAddItem(cid,12693,1)
			setPlayerStorageValue(cid,60041,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end