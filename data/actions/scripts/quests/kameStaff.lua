function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60126 then
		if getPlayerStorageValue(cid,60126) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Kame Staff!")
			doPlayerAddItem(cid,13388,1)
			setPlayerStorageValue(cid,60126,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end