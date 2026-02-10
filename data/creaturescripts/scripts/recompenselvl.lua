function onAdvance(cid, skill, oldlevel, newlevel)
	    if(getPlayerStorageValue(cid, 99960) ~= 1 and skill == SKILL__LEVEL and newlevel == 50) then
			    doPlayerAddItem(cid, 2160, 10)
			    setPlayerStorageValue(cid, 99960, 1)
			    doPlayerSendTextMessage(cid, 22, "Voce ganhou 10 golds por chegar ao level 50.")
		elseif(getPlayerStorageValue(cid, 99961) ~= 1 and skill == SKILL__LEVEL and newlevel == 100) then
			    doPlayerAddItem(cid, 2160, 20)
			    setPlayerStorageValue(cid, 99961, 1)
			    doPlayerSendTextMessage(cid, 22, "Voce ganhou 20 golds por chegar ao level 100.")
		elseif(getPlayerStorageValue(cid, 99962) ~= 1 and skill == SKILL__LEVEL and newlevel == 150) then
			    doPlayerAddItem(cid, 2160, 30)
			    setPlayerStorageValue(cid, 99962, 1)
			    doPlayerSendTextMessage(cid, 22, "Voce ganhou 30 golds por chegar ao level 150.")
		elseif(getPlayerStorageValue(cid, 99963) ~= 1 and skill == SKILL__LEVEL and newlevel == 200) then
			    doPlayerAddItem(cid, 2160, 50)
			    setPlayerStorageValue(cid, 99963, 1)
			    doPlayerSendTextMessage(cid, 22, "Voce ganhou 50 golds por chegar ao level 200.")
		end
	    return TRUE
end