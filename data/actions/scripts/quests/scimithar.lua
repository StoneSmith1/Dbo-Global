function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60081 then
		if getPlayerStorageValue(cid,60081) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Scimithar!")
			doPlayerAddItem(cid,12722,1)
			setPlayerStorageValue(cid,60081,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end