function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 60132 then
   		queststatus = getPlayerStorageValue(cid,50092)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Sword Of Fury!")
   			doPlayerAddItem(cid,13390,1)
   			setPlayerStorageValue(cid,50092,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
   	elseif item.uid == 60133 then
   		queststatus = getPlayerStorageValue(cid,50092)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Tooth Glove!")
   			doPlayerAddItem(cid,13386,1)
   			setPlayerStorageValue(cid,50092,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	end
   	return 1
end