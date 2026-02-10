local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 15000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, 25)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13101) == TRUE then
		doPlayerSendCancel(cid, "Podera usar novamente dentro de 15 segundos.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	for k = 1, 30 do
		addEvent(function()
			if isCreature(cid) then
				local pos1 = {x = getPlayerPosition(cid).x + 0, y = getPlayerPosition(cid).y + 0, z = getPlayerPosition(cid).z}
				doSendMagicEffect(pos1, 113)
			end
		end, 1 + ((k-1) * 500))
	end
	exhaustion.set(cid, 13101, 15.0)
	return doCombat(cid, combat, var)
end
