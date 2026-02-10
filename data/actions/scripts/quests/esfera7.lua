function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60093 then
		if getPlayerStorageValue(cid,60093) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 7 Estrelas!")
			doPlayerAddItem(cid,12756,1)
			setPlayerStorageValue(cid,60093,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end