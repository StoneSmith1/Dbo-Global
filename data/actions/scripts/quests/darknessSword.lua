function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60054 then
		if getPlayerStorageValue(cid,60054) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Darkness Sword!")
			doPlayerAddItem(cid,12715,1)
			setPlayerStorageValue(cid,60054,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end