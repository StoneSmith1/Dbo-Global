function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60025 then
		if getPlayerStorageValue(cid,60025) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma C17 Legs!")
			doPlayerAddItem(cid,12671,1)
			setPlayerStorageValue(cid,60025,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end