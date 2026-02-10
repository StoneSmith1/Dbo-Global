function onCastSpell(cid, var)
	
	local cloth, health, maxhealth, summons = getCreatureOutfit(cid), getCreatureHealth(cid), getCreatureMaxHealth(cid), getCreatureSummons(cid)
	local MaximoSummon = 4

	if(table.maxn(summons) < MaximoSummon) then 
		local pos = getPlayerPosition(cid)
		local bpos = {x=pos.x+2, y = pos.y, z = pos.z}
		local farAwayPos = {x = 590, y = 464, z = 7}
		
		-- SUMMON 1
		local Teste1 = doCreateMonster("Clone Ghost", farAwayPos)
		doConvinceCreature(cid, Teste1)
		setCreatureMaxHealth(Teste1, maxhealth)
		doCreatureAddHealth(Teste1, health)
		addEvent(doTeleportThing, 100, Teste1, pos)
		
		addEvent(doSendMagicEffect, 100, pos, 10)
		return true	
	end
	
	return true	
end