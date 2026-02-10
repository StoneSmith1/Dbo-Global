function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60024 then
		if getPlayerStorageValue(cid,60024) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Majin Legs!")
			doPlayerAddItem(cid,12668,1)
			setPlayerStorageValue(cid,60024,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end