function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60057 then
		if getPlayerStorageValue(cid,60057) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Blue Ki!")
			doPlayerAddItem(cid,12747,1)
			setPlayerStorageValue(cid,60057,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end