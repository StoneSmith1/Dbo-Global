local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 30000)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUBPERCENT, 200)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORDPERCENT, 200)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXEPERCENT, 200)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCEPERCENT, 200)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELDPERCENT, 200)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13101) == TRUE then
		doPlayerSendCancel(cid, "Podera usar novamente dentro de 30 segundos.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	local pos1 = {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z}
	doSendMagicEffect(pos1, 48)
	exhaustion.set(cid, 13101, 1.0)
	return doCombat(cid, combat, var)
end
