local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 19)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1, -5000, -1, -5000)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
