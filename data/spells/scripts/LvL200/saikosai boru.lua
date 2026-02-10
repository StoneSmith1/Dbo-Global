local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 60)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -35.0, 0, -40.5, 0)

local function onCastSpell1(parameters)
if isCreature(parameters.cid) and getCreatureTarget(parameters.cid) then
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end
 
function skb1(cid)
    if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
        local position1 = {x = getThingPosition(getCreatureTarget(cid)).x + 1, y = getThingPosition(getCreatureTarget(cid)).y + 1, z = getThingPosition(getCreatureTarget(cid)).z}
        doSendMagicEffect(position1, 243)
    end
end
 
function onCastSpell(cid, var)
    local parameters = {cid = cid, var = var, combat1 = combat1}
    for k = 1, 11 do
        addEvent(function()
            if isCreature(cid) then
                onCastSpell1(parameters)
                skb1(cid)
            end
        end, 1 + ((k-1) * 225))
    end
    return true
end