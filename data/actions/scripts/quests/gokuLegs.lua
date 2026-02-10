function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60028 then
		if getPlayerStorageValue(cid,60028) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Goku Legs!")
			doPlayerAddItem(cid,12675,1)
			setPlayerStorageValue(cid,60028,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end