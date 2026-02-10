function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60116 then
		if getPlayerStorageValue(cid,60116) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou 100 Magic Senzu Beans!")
			doPlayerAddItem(cid,12780,100)
			setPlayerStorageValue(cid,60116,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end