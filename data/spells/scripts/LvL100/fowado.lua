local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)

arr1 = {
{1, 1, 1},
{1, 2, 1},
{1, 1, 1},
}
local area1 = createCombatArea(arr1)
setCombatArea(combat, area1)

function onTarget(cid, target) return doChallengeCreature(cid, target) end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTarget")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
