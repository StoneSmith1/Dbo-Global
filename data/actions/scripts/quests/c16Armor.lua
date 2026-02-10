function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60013 then
		if getPlayerStorageValue(cid,60013) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma C16 Armor!")
			doPlayerAddItem(cid,12649,1)
			setPlayerStorageValue(cid,60013,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end