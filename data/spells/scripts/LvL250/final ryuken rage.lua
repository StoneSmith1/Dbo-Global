local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_YELLOW)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 34)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 40)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -175.7, 0, -172.7, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 44)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -175.7, 0, -172.7, 0)
 
local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell3(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function frr1(cid)
for r = 1, 1 do
	addEvent(function()
		if isCreature(cid) then
			local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
			doSendMagicEffect(position1, 48)
		end
	end, 1 + ((r-1) * 500))
end
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var, combat1 = combat1, combat3 = combat3}

for k = 1, 2 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell1, 1, parameters)
		end
	end, 1 + ((k-1) * 200))
end
for i = 1, 1 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(onCastSpell3, 400, parameters)
		end
	end, 1 + ((i-1) * 400))
end
for l = 1, 1 do
	addEvent(function()
		if isCreature(cid) then
			addEvent(frr1,500,cid)
		end
	end, 1 + ((l-1) * 500))
end
return true
end