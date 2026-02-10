function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60074 then
		if getPlayerStorageValue(cid,60074) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou 100 Senzu Leafs!")
			doPlayerAddItem(cid,12777,100)
			setPlayerStorageValue(cid,60074,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end