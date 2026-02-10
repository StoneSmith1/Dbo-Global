local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 67)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -35.0, 0, -40.5, 0)

local function onCastSpell1(parameters)
if isCreature(parameters.cid) and getCreatureTarget(parameters.cid) then
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end
end

function rs1(cid)
	if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
		local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
		doSendMagicEffect(position1, 42)
	end
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var, combat1 = combat1}

for k = 1, 11 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell1, 1, parameters)
		end
	end, 1 + ((k-1) * 225))
end
for i = 1, 2 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(rs1,1,cid)
		end
	end, 1 + ((i-1) * 650))
end
return true
end