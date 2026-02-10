function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60128 then
		if getPlayerStorageValue(cid,60128) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Kaioshin Armor!")
			doPlayerAddItem(cid,13444,1)
			setPlayerStorageValue(cid,60128,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end