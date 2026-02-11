-- vip_stamina.lua (globalevent)
-- Adds extra stamina while in Protection Zone to double recovery rate for VIP
-- Runs every 60 seconds; adds +1 stamina minute if player is in PZ.
local EXTRA_STAMINA_PER_MINUTE = 1

local function isInProtectionZone(cid)
    local pos = getCreaturePosition(cid)
    local info = getTileInfo(pos)
    return info and info.protection
end

function onThink(interval)
    local players = getPlayersOnline()
    for i = 1, #players do
        local cid = players[i]
        if VIP.isVip(cid) and isInProtectionZone(cid) then
            doPlayerAddStamina(cid, EXTRA_STAMINA_PER_MINUTE)
        end
    end
    return true
end
