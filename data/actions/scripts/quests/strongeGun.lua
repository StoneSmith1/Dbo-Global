function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60067 then
		if getPlayerStorageValue(cid,60067) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Stronge Gun!")
			doPlayerAddItem(cid,12743,1)
			setPlayerStorageValue(cid,60067,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end