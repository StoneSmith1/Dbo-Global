local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.90, 0, -0.98, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13132) == TRUE then
		doPlayerSendCancel(cid, "You are exhauted.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+0, y=getThingPosition(getCreatureTarget(cid)).y+0, z=getThingPosition(getCreatureTarget(cid)).z}
	if(not doCombat(cid, combat, var)) then
		return false
	end
	doSendMagicEffect(position1, 249)
	exhaustion.set(cid, 13132, 2.0)
	return true
end
