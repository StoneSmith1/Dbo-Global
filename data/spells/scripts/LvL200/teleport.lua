local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)

function onCastSpell(cid, var)
	local target = getCreatureTarget(cid)
	local enemypos = getCreaturePosition(target)
	if target == isMonster or isCreature then
		doTeleportThing(cid, enemypos)
	end
	return doCombat(cid, combat, var)
end