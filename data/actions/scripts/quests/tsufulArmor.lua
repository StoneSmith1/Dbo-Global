function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60080 then
		if getPlayerStorageValue(cid,60080) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Tsuful Armor!")
			doPlayerAddItem(cid,12656,1)
			setPlayerStorageValue(cid,60080,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end