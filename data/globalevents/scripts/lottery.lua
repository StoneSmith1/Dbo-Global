local config = {
	lottery_hour = "3 horas", -- Time to next lottery (only for broadcast message, real time you can set on globalevents.xml)
	rewards_id = {2160, 12779, 12780, 12631, 12655, 12675, 12693, 12708, 12730}, -- Rewards ID
	crystal_counts = 100, -- Used only if on rewards_id is crystal coin (ID: 2160).
	website = "yes" -- Only if you have php scripts and table `lottery` in your database!
	}
function onThink(interval, lastExecution)
if(getWorldCreatures(0) == 0)then
  return true
end

	local list = {}
	for i, tid in ipairs(getPlayersOnline()) do
  list[i] = tid
end

local winner = list[math.random(1, #list)]
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]

if (random_item == 2160) or (random_item == 12779) or (random_item == 12780) then
  doPlayerAddItem(winner, random_item, config.crystal_counts)
  doBroadcastMessage("[LOTTERY SYSTEM] Ganhador: " .. getCreatureName(winner) .. ", Recompensa: " .. config.crystal_counts .. " " .. getItemNameById(random_item) .. "s! Parabéns! (Próxima loteria em " .. config.lottery_hour .. ").")
else
  doBroadcastMessage("[LOTTERY SYSTEM] Ganhador: " .. getCreatureName(winner) .. ", Recompensa: " .. getItemNameById(random_item) .. "! Parabéns! (Próxima loteria em " .. config.lottery_hour .. ").")
  doPlayerAddItem(winner, random_item, 1)
end

if(config.website == "yes") then
  db.query("INSERT INTO `lottery` (`name`, `item`) VALUES ('".. getCreatureName(winner) .."', '".. getItemNameById(random_item) .."');")
end
return true
end