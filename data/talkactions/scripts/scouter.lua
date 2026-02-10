function onSay(cid, words, param, channel) 
	if getPlayerItemCount(cid, 12767) > 0 or getPlayerItemCount(cid, 12768) > 0 or getPlayerItemCount(cid, 12769) > 0 then
		if(param == "") then 
			doPlayerSendCancel(cid, "Digite um nome a ser procurado.") 
			return true 
		end 
		local player = getPlayerByNameWildcard(param)
		
		-- É RB e tem Guild --
		local text1 = "Nick: "..getPlayerName(player).."\n".."Level: "..getPlayerLevel(player).."\n".."Ki Level: "..getPlayerMagLevel(player).."\n".."Health: "..getCreatureMaxHealth(player).."\n".."Ki: "..getCreatureMaxMana(player).."\n".."Vocation: "..getPlayerVocationName(player).."\n".."Rebornado Level: "..getPlayerStorageValue(player,30024).."\n".."Guild: "..getPlayerGuildName(player).."\n"
		
		-- Não é RB e não tem Guild --
		local text2 = "Nick: "..getPlayerName(player).."\n".."Level: "..getPlayerLevel(player).."\n".."Ki Level: "..getPlayerMagLevel(player).."\n".."Health: "..getCreatureMaxHealth(player).."\n".."Ki: "..getCreatureMaxMana(player).."\n".."Vocation: "..getPlayerVocationName(player).."\n".."Não Rebornado".."\n".."Guild: Não Tem".."\n"
		
		-- É RB e não tem Guild --
		local text3 = "Nick: "..getPlayerName(player).."\n".."Level: "..getPlayerLevel(player).."\n".."Ki Level: "..getPlayerMagLevel(player).."\n".."Health: "..getCreatureMaxHealth(player).."\n".."Ki: "..getCreatureMaxMana(player).."\n".."Vocation: "..getPlayerVocationName(player).."\n".."Rebornado Level: "..getPlayerStorageValue(player,30024).."\n".."Guild: Não Tem".."\n"
		
		-- Não é RB e tem Guild --
		local text4 = "Nick: "..getPlayerName(player).."\n".."Level: "..getPlayerLevel(player).."\n".."Ki Level: "..getPlayerMagLevel(player).."\n".."Health: "..getCreatureMaxHealth(player).."\n".."Ki: "..getCreatureMaxMana(player).."\n".."Vocation: "..getPlayerVocationName(player).."\n".."Não Rebornado".."\n".."Guild: "..getPlayerGuildName(player).."\n"
		
		if isPlayer(player) == TRUE then
			if (getPlayerStorageValue(player,30023) == 4 and getPlayerGuildId(player) > 0) then
				doShowTextDialog(cid, 12768, text1)
			elseif (getPlayerStorageValue(player,30023) ~= 4 and getPlayerGuildId(player) == 0) then
				doShowTextDialog(cid, 12768, text2)
			elseif (getPlayerStorageValue(player,30023) == 4 and getPlayerGuildId(player) == 0) then
				doShowTextDialog(cid, 12768, text3)
			elseif (getPlayerStorageValue(player,30023) ~= 4 and getPlayerGuildId(player) > 0) then
				doShowTextDialog(cid, 12768, text4)
			end
		else
			doPlayerSendCancel(cid, "Player Offline.") 
		end 
	else
		doPlayerSendCancel(cid, "Voce precisa de um Scouter.")
	end	
	return true 
end