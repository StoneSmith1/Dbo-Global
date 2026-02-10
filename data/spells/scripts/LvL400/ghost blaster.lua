local config = {
jumps = 50,
walktime = 200
}

combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 18)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -22.0, 0, -23.0, 0)

function onCastSpell(cid)
if exhaustion.check(cid, 13104) == TRUE then
	doPlayerSendCancel(cid, "Podera usar novamente dentro de 10 segundos.")
	doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
end
function move(cid, pos, n)
local n = n or 0

if (n < config.jumps) then
if (isCreature(cid)) then
local pos = pos or getCreaturePosition(cid)
local target = getCreatureTarget(cid)

local dir = (target ~= 0) and getDirectionTo(pos, getCreaturePosition(target)) or getCreatureLookDirection(cid)
local tpos = (target ~= 0) and getCreaturePosition(target)

local newPos

if ((target ~= 0) and ((pos.x == tpos.x) and (pos.y == tpos.y))) then
newPos = tpos
else
newPos = getPosByDir(pos, dir)
end

if ((getTopCreature(newPos).uid == 1) and doTileQueryAdd(cid, newPos) ~= 0) then return false end

doCombat(cid, combat, {
pos = newPos,
type = 2
})

addEvent(move, config.walktime, cid, newPos, n + 1)
end
end
end

move(cid)
exhaustion.set(cid, 13104, 10.0)
return true
end