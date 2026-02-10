function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60052 then
		if getPlayerStorageValue(cid,60052) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Saiyan Sword!")
			doPlayerAddItem(cid,12730,1)
			setPlayerStorageValue(cid,60052,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end