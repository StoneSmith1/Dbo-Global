function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60131 then
		if getPlayerStorageValue(cid,60131) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Crystal Sword!")
			doPlayerAddItem(cid,13385,1)
			setPlayerStorageValue(cid,60131,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end