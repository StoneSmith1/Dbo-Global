local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_YELLOW)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -350.0, 0, -365.0, 0)
 
arr1 = {
{0, 3, 0}
}
 
local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
if isCreature(parameters.cid) and getCreatureTarget(parameters.cid) then
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end
 
function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 100, parameters)
doSendMagicEffect(position1, 65)
return true
end
