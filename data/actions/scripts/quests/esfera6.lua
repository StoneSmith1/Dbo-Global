function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60092 then
		if getPlayerStorageValue(cid,60092) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 6 Estrelas!")
			doPlayerAddItem(cid,12755,1)
			setPlayerStorageValue(cid,60092,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end