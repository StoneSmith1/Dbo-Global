function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60085 then
		if getPlayerStorageValue(cid,60085) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Light Sword!")
			doPlayerAddItem(cid,12725,1)
			setPlayerStorageValue(cid,60085,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end