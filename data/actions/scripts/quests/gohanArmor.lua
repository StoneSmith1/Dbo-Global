function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60078 then
		if getPlayerStorageValue(cid,60078) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Gohan Armor!")
			doPlayerAddItem(cid,12647,1)
			setPlayerStorageValue(cid,60078,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end