function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60010 then
		if getPlayerStorageValue(cid,60010) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Janemba Helmet!")
			doPlayerAddItem(cid,12632,1)
			setPlayerStorageValue(cid,60010,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end