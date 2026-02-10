function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60009 then
		if getPlayerStorageValue(cid,60009) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Great Saiyan Helmet!")
			doPlayerAddItem(cid,12631,1)
			setPlayerStorageValue(cid,60009,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end