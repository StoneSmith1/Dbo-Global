local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 32)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 39)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -75.0, 0, -100.0, 0)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 0, parameters)
return true
end