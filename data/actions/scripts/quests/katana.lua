function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60049 then
		if getPlayerStorageValue(cid,60049) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Katana!")
			doPlayerAddItem(cid,12719,1)
			setPlayerStorageValue(cid,60049,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end