function onSay(cid, words, param)

	local t = string.explode(param, ",")
	
	if param == '' then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do jogador.")
		return true
	end  
	
	local player, balance, pid = getPlayerByName(t[1]), t[2], getPlayerByNameWildcard(t[1])  
	
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then   
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O jogador não existe ou está offline.")  
		return true  
	end
	
	if t[2] == null then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite a quantidade de pontos.")
		return true
	end 
	
	local accountName = getPlayerAccount(player)
	local accountPoints = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `name` = '" .. accountName .. "'")
	local points = tonumber(accountPoints:getDataInt("premium_points"))
	local name = getPlayerName(cid)
	
	if(words == "/addpoints") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce adicionou "..balance.." premium points para o jogador "..t[1]..".")
		doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce recebeu "..balance.." premium points de "..name..".")  
		points = (points+balance)
		db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "'")
	elseif (words == "/removepoints") then
		points = (points-balance)
		if points <= 0 then
			doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, ""..name.." retirou todos os seus premium points.")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce removeu todos os premium points do jogador "..t[1]..".")
			db.query("UPDATE `accounts` SET `premium_points` = '0' WHERE `name`='" .. accountName .. "'")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce removeu "..balance.." premium points do jogador "..t[1]..".")
			db.query("UPDATE `accounts` SET `premium_points` = " .. points .. " WHERE `name`='" .. accountName .. "'")	
			doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, ""..name.." removeu "..balance.." premium points de sua conta.") 
		end
	end
	
	return true
end  