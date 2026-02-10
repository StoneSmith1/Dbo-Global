function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.uid == 64978 then
   		queststatus = getPlayerStorageValue(cid,64976)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Magic Glove!")
   			doPlayerAddItem(cid,12711,1)
   			setPlayerStorageValue(cid,64976,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	elseif item.uid == 64977 then
   		queststatus = getPlayerStorageValue(cid,64976)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Teach Sword!")
   			doPlayerAddItem(cid,13534,1)
   			setPlayerStorageValue(cid,64976,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	end
   	return 1
end