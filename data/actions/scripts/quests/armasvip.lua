function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.uid == 65495 then
   		queststatus = getPlayerStorageValue(cid,64999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Jiren Glove!")
   			doPlayerAddItem(cid,13560,1)
   			setPlayerStorageValue(cid,64999,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	elseif item.uid == 65496 then
   		queststatus = getPlayerStorageValue(cid,64999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Mirai Sword!")
   			doPlayerAddItem(cid,13611,1)
   			setPlayerStorageValue(cid,64999,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	elseif item.uid == 65497 then
   		queststatus = getPlayerStorageValue(cid,64999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou um Dagger Shield!")
   			doPlayerAddItem(cid,13548,1)
   			setPlayerStorageValue(cid,64999,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	elseif item.uid == 65498 then
   		queststatus = getPlayerStorageValue(cid,64999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Teach Senzu!")
   			doPlayerAddItem(cid,13557,1)
   			setPlayerStorageValue(cid,64999,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	end
   	return 1
end