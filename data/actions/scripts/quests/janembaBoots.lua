function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60037 then
		if getPlayerStorageValue(cid,60037) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Janemba Boots!")
			doPlayerAddItem(cid,12689,1)
			setPlayerStorageValue(cid,60037,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end