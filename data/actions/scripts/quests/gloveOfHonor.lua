function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60048 then
		if getPlayerStorageValue(cid,60048) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Glove Of Honor!")
			doPlayerAddItem(cid,12712,1)
			setPlayerStorageValue(cid,60048,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end