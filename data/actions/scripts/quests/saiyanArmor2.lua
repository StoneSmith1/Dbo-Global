function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60084 then
		if getPlayerStorageValue(cid,60084) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Saiyan Armor!")
			doPlayerAddItem(cid,12645,1)
			setPlayerStorageValue(cid,60084,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end