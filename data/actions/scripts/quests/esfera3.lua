function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60089 then
		if getPlayerStorageValue(cid,60089) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 3 Estrelas!")
			doPlayerAddItem(cid,12752,1)
			setPlayerStorageValue(cid,60089,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end