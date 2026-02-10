function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60051 then
		if getPlayerStorageValue(cid,60051) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou uma Z Sword!")
			doPlayerAddItem(cid,12724,1)
			setPlayerStorageValue(cid,60051,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end