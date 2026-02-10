function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60027 then
		if getPlayerStorageValue(cid,60027) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Ussj Legs!")
			doPlayerAddItem(cid,12672,1)
			setPlayerStorageValue(cid,60027,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end