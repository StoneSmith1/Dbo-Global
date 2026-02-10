function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60055 then
		if getPlayerStorageValue(cid,60055) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Blaster!")
			doPlayerAddItem(cid,12745,1)
			setPlayerStorageValue(cid,60055,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end