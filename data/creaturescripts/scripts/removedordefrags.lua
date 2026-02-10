function onThink(cid, interval)
local itemid = 7440

if isPlayer(cid) then
if getPlayerItemCount(cid, itemid) >= 1 then
doPlayerRemoveItem(cid, itemid, 1)
addEvent(doRemoveCreature, 1, cid)
db.query("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
end
end
return true
end