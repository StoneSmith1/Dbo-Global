local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 64)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1, -1000, -1, -1000)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
