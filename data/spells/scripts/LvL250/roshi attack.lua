local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 250)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 40)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -355.0, 0, -370.0, 0)

local function onCastSpell1(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function onCastSpell(cid, var)
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
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