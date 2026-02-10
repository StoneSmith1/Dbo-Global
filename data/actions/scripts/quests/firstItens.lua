function onUse(cid, item, frompos, item2, topos)
	if item.uid == 60000 then
		if getPlayerStorageValue(cid,60000) == -1 then
			doPlayerSendTextMessage(cid,25,"Voce ganhou um kit de iniciante!")
			local bag = doPlayerAddItem(cid,12764,1)
			doAddContainerItem(bag,12634,1)
			doAddContainerItem(bag,12664,1)
			doAddContainerItem(bag,12683,1)
			doAddContainerItem(bag,12697,1)
			doAddContainerItem(bag,12698,1)
			doAddContainerItem(bag,13384,1)
			doAddContainerItem(bag,12716,1)
			doAddContainerItem(bag,12757,1)
			doAddContainerItem(bag,12736,1)
			doAddContainerItem(bag,12737,1)
			doAddContainerItem(bag,2667,100)
			doAddContainerItem(bag,12775,100)
			doAddContainerItem(bag,12776,100)
			setPlayerStorageValue(cid,60000,1)
		else
			doPlayerSendTextMessage(cid,25,"Voce já recebeu seu kit.")
		end
		return true
	end
end