function onSay(cid, words, param, channel)
	if (getPlayerItemCount(cid, 13393) == 1) and (getPlayerItemCount(cid, 13424) == 1) and (getPlayerItemCount(cid, 13425) == 1) then
		if (getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 13393) and (getPlayerSlotItem(cid, CONST_SLOT_ARMOR).itemid == 13424) and (getPlayerSlotItem(cid, CONST_SLOT_LEGS).itemid == 13425) then
			if (getPlayerStorageValue(cid,325463) == 0) then
				doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")+0.25)
				doSendMagicEffect(getCreaturePosition(cid), 87)
				doCreatureSay(cid, "Exp Bonus Ativada!", 19)
				setPlayerStorageValue(cid, 325463, 1)
			else
				doPlayerSendCancel(cid, "A exp bonus já foi ativada!")
			end
		else
			doPlayerSendCancel(cid, "Voce deve estar com o frozen set equipado para receber a experiencia bonus.")
		end
	else
		doPlayerSendCancel(cid, "Voce não possui o frozen set.")
	end
	return true
end
