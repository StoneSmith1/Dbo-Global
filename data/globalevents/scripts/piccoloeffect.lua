local effects = {
--_PICCOLO_--
[35] = 69
}

function onThink(interval)
	for _, pid in ipairs(getPlayersOnline()) do
		local effect = effects[getPlayerVocation(pid)]
		if(effect) then
			doSendMagicEffect(getCreaturePos(pid), effect)
		end
	end

	return true
end