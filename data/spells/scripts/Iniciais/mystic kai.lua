local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(cid, var)
doRemoveCondition(cid, CONDITION_MANASHIELD)
return doCombat(cid, combat, var)
end