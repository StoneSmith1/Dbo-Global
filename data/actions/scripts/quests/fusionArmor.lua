function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60023 then
		if getPlayerStorageValue(cid,60023) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Fusion Armor!")
			doPlayerAddItem(cid,12660,1)
			setPlayerStorageValue(cid,60023,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end