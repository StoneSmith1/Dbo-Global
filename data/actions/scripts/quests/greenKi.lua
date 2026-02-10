function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60130 then
		if getPlayerStorageValue(cid,60130) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um Green Ki!")
			doPlayerAddItem(cid,13434,1)
			setPlayerStorageValue(cid,60130,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu item.")
		end
		return true
	end
end