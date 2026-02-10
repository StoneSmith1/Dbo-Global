function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60015 then
		if getPlayerStorageValue(cid,60015) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma C18 Armor!")
			doPlayerAddItem(cid,12646,1)
			setPlayerStorageValue(cid,60015,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end