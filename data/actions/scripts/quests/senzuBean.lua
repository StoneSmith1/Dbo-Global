function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60068 then
		if getPlayerStorageValue(cid,60068) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou 100 Senzu Beans!")
			doPlayerAddItem(cid,12779,100)
			setPlayerStorageValue(cid,60068,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end