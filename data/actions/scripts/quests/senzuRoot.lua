function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60075 then
		if getPlayerStorageValue(cid,60075) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou 100 Senzu Roots!")
			doPlayerAddItem(cid,12778,100)
			setPlayerStorageValue(cid,60075,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end