local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(condition, -0.90, 0, -0.96, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    if not isPlayer(cid) then	
	return true
	end
	if exhaustion.check(cid, 13132) == TRUE then
		doPlayerSendCancel(cid, "You are exhauted.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+0, y=getThingPosition(getCreatureTarget(cid)).y+0, z=getThingPosition(getCreatureTarget(cid)).z}
	if(not doCombat(cid, combat, var)) then
		return false
	end
	doSendMagicEffect(position1, 28)
	exhaustion.set(cid, 13132, 9.0)
	return true
end
