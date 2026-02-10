function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60032 then
		if getPlayerStorageValue(cid,60032) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Janemba Legs!")
			doPlayerAddItem(cid,12679,1)
			setPlayerStorageValue(cid,60032,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end