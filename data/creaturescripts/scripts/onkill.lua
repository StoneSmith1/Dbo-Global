--__LVL 100 AO 199__--
local config1 = {
--	level menor
	{250000,2160,1},
--	mesmo level
	{500000,2160,2},
--	level maior
	{1000000,2160,3},
}
--__LVL 200 AO 399__--
local config2 = {
--	level menor
	{1000000,2160,1},
--	mesmo level
	{1500000,2160,3},
--	level maior
	{2000000,2160,5},
}
--__LVL 400 AO 600__--
local config3 = {
--	level menor
	{2500000,2160,3},
--	mesmo level
	{3000000,2160,5},
--	level maior
	{3500000,2160,10},
}
--__LVL 600 EM DIANTE__--
local config4 = {
--	level menor
	{4000000,2160,3},
--	mesmo level
	{4500000,2160,5},
--	level maior
	{5000000,2160,10},
}

function onKill(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if (getTileInfo(getThingPos(cid)).hardcore and getTileInfo(getThingPos(target)).hardcore) then return true end
		if getPlayerIp(cid) == getPlayerIp(target) then return true end
		if (getPlayerLevel(cid) > getPlayerLevel(target)+25) then
			return true
		else
			if getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 200 then
				if (getPlayerLevel(target) < getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config1[1][2], config1[1][3])
					doPlayerAddExp(cid, config1[1][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config1[1][1].." de exp.")
				elseif (getPlayerLevel(target) == getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config1[2][2], config1[2][3])
					doPlayerAddExp(cid, config1[2][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config1[2][1].." de exp.")
				elseif (getPlayerLevel(target) > getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config1[3][2], config1[3][3])
					doPlayerAddExp(cid, config1[3][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config1[3][1].." de exp.")
				end
			elseif getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) < 400 then
				if (getPlayerLevel(target) < getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config2[1][2], config2[1][3])
					doPlayerAddExp(cid, config2[1][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config2[1][1].." de exp.")
				elseif (getPlayerLevel(target) == getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config2[2][2], config2[2][3])
					doPlayerAddExp(cid, config2[2][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config2[2][1].." de exp.")
				elseif (getPlayerLevel(target) > getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config2[3][2], config2[3][3])
					doPlayerAddExp(cid, config2[3][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config2[3][1].." de exp.")
				end
			elseif getPlayerLevel(cid) >= 400 and getPlayerLevel(cid) < 600 then
				if (getPlayerLevel(target) < getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config3[1][2], config3[1][3])
					doPlayerAddExp(cid, config3[1][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config3[1][1].." de exp.")
				elseif (getPlayerLevel(target) == getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config3[2][2], config3[2][3])
					doPlayerAddExp(cid, config3[2][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config3[2][1].." de exp.")
				elseif (getPlayerLevel(target) > getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config3[3][2], config3[3][3])
					doPlayerAddExp(cid, config3[3][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config3[3][1].." de exp.")
				end
			elseif getPlayerLevel(cid) >= 600 then
				if (getPlayerLevel(target) < getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config4[1][2], config4[1][3])
					doPlayerAddExp(cid, config4[1][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config4[1][1].." de exp.")
				elseif (getPlayerLevel(target) == getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config4[2][2], config4[2][3])
					doPlayerAddExp(cid, config4[2][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config4[2][1].." de exp.")
				elseif (getPlayerLevel(target) > getPlayerLevel(cid)) then
					doPlayerAddItem(cid, config4[3][2], config4[3][3])
					doPlayerAddExp(cid, config4[3][1])
					doPlayerSendCancel(cid, "Voce recebeu "..config4[3][1].." de exp.")
				end
			end
		end
	end
	return true
end