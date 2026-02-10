function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60091 then
		if getPlayerStorageValue(cid,60091) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 5 Estrelas!")
			doPlayerAddItem(cid,12754,1)
			setPlayerStorageValue(cid,60091,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end