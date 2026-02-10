function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60070 then
		if getPlayerStorageValue(cid,60070) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Ussj Armor!")
			doPlayerAddItem(cid,12651,1)
			setPlayerStorageValue(cid,60070,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end