function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60014 then
		if getPlayerStorageValue(cid,60014) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma C17 Armor!")
			doPlayerAddItem(cid,12648,1)
			setPlayerStorageValue(cid,60014,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end