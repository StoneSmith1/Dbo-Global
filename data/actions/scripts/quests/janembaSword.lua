function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60076 then
		if getPlayerStorageValue(cid,60076) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Janemba Sword!")
			doPlayerAddItem(cid,12728,1)
			setPlayerStorageValue(cid,60076,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end