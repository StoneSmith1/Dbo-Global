function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60016 then
		if getPlayerStorageValue(cid,60016) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Future Trunks Armor!")
			doPlayerAddItem(cid,12637,1)
			setPlayerStorageValue(cid,60016,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end