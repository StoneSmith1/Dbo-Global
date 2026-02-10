function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60060 then
		if getPlayerStorageValue(cid,60060) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Yellow Scroll!")
			doPlayerAddItem(cid,12771,1)
			setPlayerStorageValue(cid,60060,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end