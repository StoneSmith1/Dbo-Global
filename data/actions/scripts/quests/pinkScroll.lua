function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60059 then
		if getPlayerStorageValue(cid,60059) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Pink Scroll!")
			doPlayerAddItem(cid,12770,1)
			setPlayerStorageValue(cid,60059,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end