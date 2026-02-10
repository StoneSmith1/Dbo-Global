function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60120 then
		if getPlayerStorageValue(cid,60120) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Legendary Legs!")
			doPlayerAddItem(cid,12681,1)
			setPlayerStorageValue(cid,60120,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end