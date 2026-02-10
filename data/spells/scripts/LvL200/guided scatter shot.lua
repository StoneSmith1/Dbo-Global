local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 9)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 18)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -350.0, 0, -365.0, 0)

local function onCastSpell1(parameters)
if isCreature(parameters.cid) and getCreatureTarget(parameters.cid) then
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13102) == TRUE then
		doPlayerSendCancel(cid, "Podera usar novamente dentro de 5 segundos.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
local parameters = { cid = cid, var = var, combat1 = combat1}
addEvent(onCastSpell1, 0, parameters)
exhaustion.set(cid, 13102, 5.0)
return true
end