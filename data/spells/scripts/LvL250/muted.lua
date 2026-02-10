local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)

local chance = 50

function silence(tar, text)
    if(isCreature(tar) == true) then
        doSendAnimatedText(getCreaturePosition(tar), text, 215)
        doAddCondition(tar, condition)
    end
    return true
end

function onCastSpell(cid, var)
	if exhaustion.check(cid, 13117) == TRUE then
		doPlayerSendCancel(cid, "Podera usar novamente dentro de 15 segundos.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	local tar = getCreatureTarget(cid)
	if hasCondition(tar, CONDITION_MUTED) == true then
		return false
	else
		if isCreature(tar) == true then
			if math.random(1,100) <= chance then
				local text = "SILENCE"
				silence(tar, text)     
			else
				local text = "MISS"
				doSendAnimatedText(getCreaturePosition(tar), text, 215)
			end
			else
				if isCreature(cid) == true then
					doPlayerSendCancel(cid, "Silence can be cast only on other creatures.")
				end
			return false
		end
	end
	exhaustion.set(cid, 13117, 15.0)
	return true
end