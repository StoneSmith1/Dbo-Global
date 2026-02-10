function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60064 then
		if getPlayerStorageValue(cid,60064) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Red Capsule!")
			doPlayerAddItem(cid,12762,1)
			setPlayerStorageValue(cid,60064,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end