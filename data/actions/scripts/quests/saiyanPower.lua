function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60058 then
		if getPlayerStorageValue(cid,60058) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Saiyan Power!")
			doPlayerAddItem(cid,12748,1)
			setPlayerStorageValue(cid,60058,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end