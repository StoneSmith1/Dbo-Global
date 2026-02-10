function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60063 then
		if getPlayerStorageValue(cid,60063) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Red Scroll!")
			doPlayerAddItem(cid,12774,1)
			setPlayerStorageValue(cid,60063,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end