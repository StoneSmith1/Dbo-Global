local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 10)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -135.0, 0, -150.0, 0)

local function onCastSpell1(parameters)
	doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function ms1(cid)
	local postarget = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	local target = getCreatureTarget(cid)
	if target == isMonster or isCreature then
		doTeleportThing(cid, postarget)
		doSendMagicEffect(postarget, 62)
		doSendMagicEffect(postarget, 10)
	end
end

function ms2(cid)
	local postarget = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
	local target = getCreatureTarget(cid)
	if target == isMonster or isCreature then
		doTeleportThing(cid, postarget)
		doSendMagicEffect(postarget, 10)
	end
end

function ms3(cid)
	local postarget = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	local target = getCreatureTarget(cid)
	if target == isMonster or isCreature then
		doTeleportThing(cid, postarget)
		doSendMagicEffect(postarget, 10)
	end
end

function ms4(cid)
	local postarget = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
	local target = getCreatureTarget(cid)
	if target == isMonster or isCreature then
		doTeleportThing(cid, postarget)
		doSendMagicEffect(postarget, 10)
	end
end

function onCastSpell(cid, var)
	local pos = {}
	table.insert(pos, getCreaturePosition(cid))
	local parameters = { cid = cid, var = var, combat1 = combat1 }
	doSendMagicEffect(getCreaturePosition(cid), 98)
	doPlayerSay(cid, 'Aaaaaaaahhh!!!', TALKTYPE_ORANGE_1)
	for i = 1, 3 do
		addEvent(function()
			if isCreature(cid) then
				addEvent(onCastSpell1, 1, parameters)
			end
		end, 1 + ((i-1) * 150))
	end
	addEvent(function()
		if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
			ms1(cid)
		end
	end, 100 * 1)
	addEvent(function()
		if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
			ms2(cid)
		end
	end, 200 * 1)
	addEvent(function()
		if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
			ms3(cid)
		end
	end, 300 * 1)
	addEvent(function()
		if isCreature(cid) and isCreature(getCreatureTarget(cid)) then
			ms4(cid)
		end
	end, 400 * 1)
	addEvent(function()
		if isCreature(cid) then
			doTeleportThing(cid, pos[1])
			doSendMagicEffect(pos[1], 10)
			table.remove(pos)
		end
	end, 500 * 1)
	return true
end