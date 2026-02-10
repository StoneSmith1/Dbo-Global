function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60004 then
		if getPlayerStorageValue(cid,60004) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Red Ribbon Cap!")
			doPlayerAddItem(cid,12623,1)
			setPlayerStorageValue(cid,60004,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end