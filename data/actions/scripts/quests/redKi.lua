function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60056 then
		if getPlayerStorageValue(cid,60056) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Red Ki!")
			doPlayerAddItem(cid,12746,1)
			setPlayerStorageValue(cid,60056,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end