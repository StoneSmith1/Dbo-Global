local config = {
	creationTime = 7 * 86400,
	checkTime = 7 * 86400,
	viceCount = 4,
	memberCount = 10
}

local positions = {
	pos1 = {x = 385, y = 250, z = 15},
	pos2 = {x = 406, y = 250, z = 15},
	pos3 = {x = 432, y = 250, z = 15},
	pos4 = {x = 455, y = 250, z = 15},
	pos5 = {x = 383, y = 271, z = 15},
	pos6 = {x = 406, y = 271, z = 15},
	pos7 = {x = 432, y = 271, z = 15},
	pos8 = {x = 457, y = 271, z = 15},
	pos9 = {x = 419, y = 226, z = 15},
	pos10 = {x = 419, y = 305, z = 15},
	pos11 = {x = 642, y = 718, z = 6},
	pos12 = {x = 636, y = 730, z = 5},
	pos13 = {x = 636, y = 707, z = 5},
	pos14 = {x = 654, y = 841, z = 3},
	pos15 = {x = 641, y = 841, z = 3},
	pos16 = {x = 459, y = 1085, z = 6},
}

function onStartup()
	db.query("DELETE FROM `guild_wars` WHERE `status` = 0 AND `begin` < " .. (os.time() - 2 * 86400) .. ";")
	db.query("UPDATE `guild_wars` SET `status` = 5, `end` = " .. os.time() .. " WHERE `status` = 1 AND `end` > 0 AND `end` < " .. os.time() .. ";")
	doCreateMonster('RB Goku SSJ4', positions.pos1)
	doCreateMonster('RB Vegeta SSJ4', positions.pos2)
	doCreateMonster('RB Gohan SSJ4', positions.pos3)
	doCreateMonster('RB Trunks SSJ4', positions.pos4)
	doCreateMonster('RB Raditz SSJ4', positions.pos5)
	doCreateMonster('RB Broly SSJ4', positions.pos6)
	doCreateMonster('RB Turles SSJ4', positions.pos7)
	doCreateMonster('RB Bardock SSJ4', positions.pos8)
	doCreateMonster('RB Gogeta SSJ4', positions.pos9)
	doCreateMonster('Porunga', positions.pos10)
	doCreateMonster('Fire Guardian1', positions.pos11)
	doCreateMonster('Fire Guardian2', positions.pos12)
	doCreateMonster('Fire Guardian3', positions.pos13)
	doCreateMonster('Hawk', positions.pos14)
	doCreateMonster('Warlock', positions.pos15)
	doCreateMonster('Titanius', positions.pos16)
	local data, time, result = {}, os.time(), db.getResult("SELECT `id`, `ownerid`, `creationdata`, `checkdata` FROM `guilds` WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	if(result:getID() ~= -1) then
		repeat
			data[result:getDataInt("id")] = {result:getDataInt("ownerid"), result:getDataInt("creationdata"), result:getDataInt("checkdata")}
		until not(result:next())
		result:free()
	end

	for id, v in ipairs(data) do
		local owner, created, check = v[1], v[2], v[3]
		if(created < (time - config.creationTime)) then
			result = db.getResult("SELECT `id`, `level` FROM `guild_ranks` WHERE `guild_id` = " .. id .. ";")
			if(result:getID() ~= -1) then
				local rank, ranks = 0, {}
				repeat
					ranks[result:getDataInt("id")] = result:getDataInt("level")
					if(result:getDataInt("level") == 1) then
						rank = result:getDataInt("id")
					end
				until not(result:next())
				result:free()

				local members = {0, 0, 0, 0}
				for k, v in ipairs(ranks) do
					result = db.getResult("SELECT COUNT(`id`) AS `count` FROM `players` WHERE `rank_id` = " .. k .. ";")
					if(result:getID() ~= -1) then
						members[v] = members[v] + result:getDataInt("count")
						result:free()
					end

					if(v == 2) then
						result = db.getResult("SELECT `p`.`id` FROM `players` p LEFT JOIN `accounts` a ON `p`.`account_id` = `a`.`id` WHERE `p`.`rank_id` = " .. k .. " AND (`a`.`premdays` = 0 OR (`a`.`lastday` + (`a`.`premdays` * 86400) <= 0));")
						if(result:getID() ~= -1) then
							local demote = ""
							repeat
								demote = demote .. result:getDataInt("id") .. ","
								members[2] = members[2] - 1
								members[1] = members[1] + 1
							until not(result:next())
							result:free()

							if(demote ~= "" and rank ~= 0) then
								db.query("UPDATE `players` SET `rank_id` = " .. rank .. " WHERE `id` IN (" .. demote:sub(1, -2) .. ");")
							end
						end
					end
				end

				for i = 1, 3 do
					members[4] = members[4] + members[i]
				end

				if(members[2] < config.viceCount or members[4] < config.memberCount) then
					if(check == 0) then
						db.query("UPDATE `guilds` SET `checkdata` = " .. (time + config.checkTime) .. " WHERE `id` = " .. id .. ";")
					elseif(check < time) then
						local tmp = ""
						for rank, _ in ipairs(ranks) do
							tmp = tmp .. rank .. ","
						end

						db.query("UPDATE `players` SET `rank_id` = 0, `guildnick` = '', `guildjoin` = 0 WHERE `rank_id` IN (" .. tmp:sub(1, -2) .. ");")
						db.query("DELETE FROM `guilds` WHERE `id` = " .. id .. ";")
					end
				end
			end
		end
	end

	db.query("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. " AND `online` > 0;")
	db.query("UPDATE `bans` SET `active` = 0 WHERE `expires` <= " .. time .. " AND `expires` >= 0 AND `active` = 1")
	db.query("DELETE FROM `guild_wars` WHERE `status` = 0 AND `begin` < " .. (time - 2 * 86400) .. ";")
	return true
end

function onGlobalSave()
	if(getGameState() ~= GAMESTATE_CLOSING) then
		return onStartup()
	end

	return true
end
