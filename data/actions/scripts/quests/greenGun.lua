function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60066 then
		if getPlayerStorageValue(cid,60066) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Green Gun!")
			doPlayerAddItem(cid,12742,1)
			setPlayerStorageValue(cid,60066,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end