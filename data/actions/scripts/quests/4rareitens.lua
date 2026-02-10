function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 60122 then
   		queststatus = getPlayerStorageValue(cid,50090)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Warrior Glove!")
   			doPlayerAddItem(cid,13400,1)
   			setPlayerStorageValue(cid,50090,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
   	elseif item.uid == 60123 then
   		queststatus = getPlayerStorageValue(cid,50090)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Two Handed Sword!")
   			doPlayerAddItem(cid,12732,1)
   			setPlayerStorageValue(cid,50090,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
   	elseif item.uid == 60124 then
   		queststatus = getPlayerStorageValue(cid,50090)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou um Shield Of Glory!")
   			doPlayerAddItem(cid,12735,1)
   			setPlayerStorageValue(cid,50090,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
		end
   	elseif item.uid == 60125 then
   		queststatus = getPlayerStorageValue(cid,50090)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou um Tortoiseshell!")
   			doPlayerAddItem(cid,13398,1)
   			setPlayerStorageValue(cid,50090,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	end
   	return 1
end