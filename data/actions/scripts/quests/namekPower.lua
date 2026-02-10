function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60069 then
		if getPlayerStorageValue(cid,60069) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Namek Power!")
			doPlayerAddItem(cid,12744,1)
			setPlayerStorageValue(cid,60069,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end