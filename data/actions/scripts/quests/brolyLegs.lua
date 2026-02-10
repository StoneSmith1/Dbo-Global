function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60029 then
		if getPlayerStorageValue(cid,60029) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Broly Legs!")
			doPlayerAddItem(cid,12676,1)
			setPlayerStorageValue(cid,60029,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end