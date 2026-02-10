local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1, -250, -1, -250)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
