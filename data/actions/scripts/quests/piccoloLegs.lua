function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60073 then
		if getPlayerStorageValue(cid,60073) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Piccolo Legs!")
			doPlayerAddItem(cid,12673,1)
			setPlayerStorageValue(cid,60073,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end