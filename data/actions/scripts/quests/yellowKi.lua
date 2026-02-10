function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60129 then
		if getPlayerStorageValue(cid,60129) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Yellow Ki!")
			doPlayerAddItem(cid,13435,1)
			setPlayerStorageValue(cid,60129,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end