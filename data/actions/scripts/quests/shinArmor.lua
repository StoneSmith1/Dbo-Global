function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60019 then
		if getPlayerStorageValue(cid,60019) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Shin Armor!")
			doPlayerAddItem(cid,12658,1)
			setPlayerStorageValue(cid,60019,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end