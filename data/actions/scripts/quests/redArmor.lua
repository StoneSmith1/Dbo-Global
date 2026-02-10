function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60020 then
		if getPlayerStorageValue(cid,60020) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Red Armor!")
			doPlayerAddItem(cid,12665,1)
			setPlayerStorageValue(cid,60020,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end