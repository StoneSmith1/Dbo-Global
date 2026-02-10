local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

arr1 = {
{0, 3, 0}
}

local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 4, 8000, -10000)
setCombatCondition(combat1, condition)

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end
 
function onCastSpell(cid, var)
if exhaustion.check(cid, 13112) == TRUE then
	doPlayerSendCancel(cid, "Podera usar novamente dentro de 60 segundos.")
	doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+0, y=getThingPosition(getCreatureTarget(cid)).y+0, z=getThingPosition(getCreatureTarget(cid)).z}
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 0, parameters)
doSendMagicEffect(position1, 86)
exhaustion.set(cid, 13112, 60.0)
return true
end
