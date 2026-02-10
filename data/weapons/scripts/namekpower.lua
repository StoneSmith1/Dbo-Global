local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 11)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1, -3000, -1, -3000)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
