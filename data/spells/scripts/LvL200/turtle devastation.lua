local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 22)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_YELLOW)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -35.0, 0, -40.5, 0)
 
local function onCastSpell1(parameters)
if isCreature(parameters.cid) and getCreatureTarget(parameters.cid) then
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = {cid = cid, var = var, combat1 = combat1, combat2 = combat2}

for k = 1, 1 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell1, 1, parameters)
		end
	end, 1 + ((k-1) * 225))
end
for i = 1, 11 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell2, 1, parameters)
		end
	end, 1 + ((i-1) * 225))
end
return true
end