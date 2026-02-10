local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -365.0, 0, -380.0, 0)

function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local target = getCreatureTarget(cid)
local enemypos = getCreaturePosition(target)
if target == isMonster or isCreature then
doTeleportThing(cid, enemypos)
doSendMagicEffect(position1, 54)
end
return doCombat(cid, combat, var)
end