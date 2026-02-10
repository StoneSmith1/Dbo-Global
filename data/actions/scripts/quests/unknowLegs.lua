function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60030 then
		if getPlayerStorageValue(cid,60030) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Unknow Legs!")
			doPlayerAddItem(cid,12677,1)
			setPlayerStorageValue(cid,60030,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end