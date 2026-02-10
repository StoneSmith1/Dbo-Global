function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60072 then
		if getPlayerStorageValue(cid,60072) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Night Sword!")
			doPlayerAddItem(cid,12718,1)
			setPlayerStorageValue(cid,60072,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end