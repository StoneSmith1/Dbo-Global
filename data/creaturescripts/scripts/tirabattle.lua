function onThink(cid, interval)
    if(getTilePzInfo(getCreaturePosition(cid))) then 
		addEvent(function()
			if isPlayer(cid) and (getTilePzInfo(getCreaturePosition(cid))) then
				doRemoveCondition(cid, CONDITION_INFIGHT)
			end
		end, 5000 * 1)
	end
end