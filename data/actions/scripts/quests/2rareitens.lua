function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 60117 then
   		queststatus = getPlayerStorageValue(cid,50091)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Kaioshin Armor!")
   			doPlayerAddItem(cid,13444,1)
   			setPlayerStorageValue(cid,50091,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
   	elseif item.uid == 60118 then
   		queststatus = getPlayerStorageValue(cid,50091)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce ganhou uma Mystic Legs!")
   			doPlayerAddItem(cid,13443,1)
   			setPlayerStorageValue(cid,50091,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce já escolheu seu item.")
   		end
	end
   	return 1
end