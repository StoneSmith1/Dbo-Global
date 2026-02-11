-- vip_bonus.lua (creaturescript)
-- +10% EXP from monsters, +5% skill/magic tries while VIP
-- NOTE: event types must exist in your OTX build.
local EXP_BONUS = 1.10
local TRIES_BONUS = 1.05

function onGainExperience(cid, source, exp, rawExp)
    if not VIP.isVip(cid) then
        return exp
    end
    if source and isMonster(source) then
        return math.floor(exp * EXP_BONUS)
    end
    return exp
end

function onGainSkillTries(cid, skill, tries)
    if not VIP.isVip(cid) then
        return tries
    end
    return math.floor(tries * TRIES_BONUS)
end

function onGainManaSpent(cid, manaSpent)
    if not VIP.isVip(cid) then
        return manaSpent
    end
    return math.floor(manaSpent * TRIES_BONUS)
end
