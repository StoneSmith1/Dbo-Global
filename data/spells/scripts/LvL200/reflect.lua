local config = {
storage = 3482101,
cooldown = 15,
effect1 = 96
}

function onCastSpell(cid, var)
	if getPlayerStorageValue(cid, config.storage) == 1 then
		doPlayerSendCancel(cid, "Sua skill ja foi ativada.")
		return false
	end

	if os.time() - getPlayerStorageValue(cid, 55694) >= config.cooldown then
		setPlayerStorageValue(cid, 55694, os.time())
		doSendMagicEffect(getCreaturePosition(cid), config.effect1)
		setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid, 27, "Voce ativou sua skill, o próximo dano causado será refletido.")
		else
		doPlayerSendCancel(cid, "Voce poderá usar a skill novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55694))).." segundos.")
		return false
	end
    return true
end