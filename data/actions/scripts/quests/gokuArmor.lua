function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60018 then
		if getPlayerStorageValue(cid,60018) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Goku Armor!")
			doPlayerAddItem(cid,12655,1)
			setPlayerStorageValue(cid,60018,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end