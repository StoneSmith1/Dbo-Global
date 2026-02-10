function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60005 then
		if getPlayerStorageValue(cid,60005) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Ninja Helmet!")
			doPlayerAddItem(cid,12625,1)
			setPlayerStorageValue(cid,60005,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end