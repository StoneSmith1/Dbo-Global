function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60007 then
		if getPlayerStorageValue(cid,60007) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Paul Cap!")
			doPlayerAddItem(cid,12628,1)
			setPlayerStorageValue(cid,60007,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end