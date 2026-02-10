local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 16)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1, -1000, -1, -1000)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
