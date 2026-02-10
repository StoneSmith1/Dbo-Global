function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60033 then
		if getPlayerStorageValue(cid,60033) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Fusion Legs!")
			doPlayerAddItem(cid,12680,1)
			setPlayerStorageValue(cid,60033,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end