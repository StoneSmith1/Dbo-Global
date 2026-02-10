function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60088 then
		if getPlayerStorageValue(cid,60088) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce encontrou uma Esfera De 2 Estrelas!")
			doPlayerAddItem(cid,12751,1)
			setPlayerStorageValue(cid,60088,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end