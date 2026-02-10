function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60087 then
		if getPlayerStorageValue(cid,60087) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 1 Estrela!")
			doPlayerAddItem(cid,12750,1)
			setPlayerStorageValue(cid,60087,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end