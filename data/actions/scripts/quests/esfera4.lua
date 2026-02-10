function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60090 then
		if getPlayerStorageValue(cid,60090) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 4 Estrelas!")
			doPlayerAddItem(cid,12753,1)
			setPlayerStorageValue(cid,60090,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end