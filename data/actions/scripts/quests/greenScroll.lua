function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60062 then
		if getPlayerStorageValue(cid,60062) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Green Scroll!")
			doPlayerAddItem(cid,12773,1)
			setPlayerStorageValue(cid,60062,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end