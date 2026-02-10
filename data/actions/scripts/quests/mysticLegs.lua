function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60127 then
		if getPlayerStorageValue(cid,60127) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Mystic Legs!")
			doPlayerAddItem(cid,13443,1)
			setPlayerStorageValue(cid,60127,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end