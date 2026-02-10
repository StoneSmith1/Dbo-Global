local function isValidMoney(value)
	if(value == nil) then
		return false
	end

	return (value > 0 and value <= 99999999999999)
end
 
function onSay(cid, words, param, channel)
	local guild = getPlayerGuildId(cid)
	if(guild == 0) then
		return false
	end
 
	local t = string.explode(param, ' ', 1)
	if(getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER and isInArray({ 'pick' }, t[1])) then
		if(t[1] == 'pick') then
			local money = { tonumber(t[2]) }
			if(not isValidMoney(money[1])) then
				doPlayerSendChannelMessage(cid, '', 'Quantidade de dinheiro inválida.', TALKTYPE_CHANNEL_W, 0)
				return true
			end
 
			local result = db.getResult('SELECT `balance` FROM `guilds` WHERE `id` = ' .. guild)
			if(result:getID() == -1) then
				return false
			end
 
			money[2] = result:getDataLong('balance')
			result:free()
 
			if(money[1] > money[2]) then
				doPlayerSendChannelMessage(cid, '', 'O saldo é muito baixo para esse valor.', TALKTYPE_CHANNEL_W, 0)
				return true
			end
 
			if(not db.query('UPDATE `guilds` SET `balance` = `balance` - ' .. money[1] .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')) then
				return false
			end
 
			doPlayerAddMoney(cid, money[1])
			doPlayerSendChannelMessage(cid, '', 'Voce só pegou ' .. money[1] .. ' de dinheiro do saldo de sua guild.', TALKTYPE_CHANNEL_W, 0)
		else
			doPlayerSendChannelMessage(cid, '', 'Sub-Comando inválido.', TALKTYPE_CHANNEL_W, 0)
		end
	elseif(t[1] == 'donate') then
		local money = tonumber(t[2])
		if(not isValidMoney(money)) then
			doPlayerSendChannelMessage(cid, '', 'Quantidade de dinheiro inválida.', TALKTYPE_CHANNEL_W, 0)
			return true
		end
 
		if(getPlayerMoney(cid) < money) then
			doPlayerSendChannelMessage(cid, '', 'Voce não tem dinheiro suficiente.', TALKTYPE_CHANNEL_W, 0)
			return true
		end
 
		if(not doPlayerRemoveMoney(cid, money)) then
			return false
		end
 
		db.query('UPDATE `guilds` SET `balance` = `balance` + ' .. money .. ' WHERE `id` = ' .. guild .. ' LIMIT 1;')
		doPlayerSendChannelMessage(cid, '', 'Voce tem transferido ' .. money .. ' de dinheiro para a sua guild.', TALKTYPE_CHANNEL_W, 0)
	else
		local result = db.getResult('SELECT `name`, `balance` FROM `guilds` WHERE `id` = ' .. guild)
		if(result:getID() == -1) then
			return false
		end
 
		doPlayerSendChannelMessage(cid, '', 'O saldo atual da guild ' .. result:getDataString('name') .. ' é: ' .. result:getDataLong('balance') .. ' Bronze Coins.', TALKTYPE_CHANNEL_W, 0)
		result:free()
	end
	return true
end