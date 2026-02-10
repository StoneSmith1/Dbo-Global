function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60031 then
		if getPlayerStorageValue(cid,60031) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Goku SSJ5 Legs!")
			doPlayerAddItem(cid,12678,1)
			setPlayerStorageValue(cid,60031,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end