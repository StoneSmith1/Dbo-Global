function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60036 then
		if getPlayerStorageValue(cid,60036) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Future Trunks Boots!")
			doPlayerAddItem(cid,12687,1)
			setPlayerStorageValue(cid,60036,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end