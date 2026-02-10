local configuration = {
    day = "Saturday",
	day2 = "Wednesday",
    to_pos = {x = 654, y = 652, z = 7},
    pos = {x = 96, y = 191, z = 7},
	
	to_pos1 = {x = 650, y = 671, z = 8},
    pos1 = {x = 647, y = 669, z = 7},

    teleport_id = 1387,
}
local CTF1 = {
	fromPos = {x=614, y=645, z=8, stackpos=253},
	toPos = {x=718, y=783, z=8, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
local CTF2 = {
	fromPos = {x=643, y=722, z=9, stackpos=253},
	toPos = {x=670, y=741, z=9, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
local CTF3 = {
	fromPos = {x=622, y=647, z=7, stackpos=253},
	toPos = {x=723, y=778, z=7, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
local CTF4 = {
	fromPos = {x=627, y=677, z=6, stackpos=253},
	toPos = {x=712, y=775, z=6, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
local CTF5 = {
	fromPos = {x=627, y=677, z=5, stackpos=253},
	toPos = {x=712, y=775, z=5, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
local CTF6 = {
	fromPos = {x=627, y=677, z=4, stackpos=253},
	toPos = {x=712, y=775, z=4, stackpos=253},
	deTile = {x=655,y=399,z=7,stackpos=1}
}
function onTime()
    if os.date("%A") == configuration.day then
        local item = getTileItemById(configuration.pos, configuration.teleport_id).uid
		local item1 = getTileItemById(configuration.pos1, configuration.teleport_id).uid
        if item > 0 then
            doRemoveItem(item, 1)
			doRemoveItem(item1, 1)
            broadcastMessage("O Castle War foi fechado. Próxima abertura será no próximo sábado às 18h.", MESSAGE_STATUS_WARNING)
			 for _, pid in ipairs(getPlayersOnline()) do
			  if isInArea(getPlayerPosition(pid), CTF1.fromPos, CTF1.toPos) then
			   doTeleportThing(pid, CTF1.deTile, false)
			  end
			  if isInArea(getPlayerPosition(pid), CTF2.fromPos, CTF2.toPos) then
			   doTeleportThing(pid, CTF2.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF3.fromPos, CTF3.toPos) then
			   doTeleportThing(pid, CTF3.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF4.fromPos, CTF4.toPos) then
			   doTeleportThing(pid, CTF4.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF5.fromPos, CTF5.toPos) then
			   doTeleportThing(pid, CTF5.deTile, false)
			  end
			  if isInArea(getPlayerPosition(pid), CTF6.fromPos, CTF6.toPos) then
			   doTeleportThing(pid, CTF6.deTile, false)
			  end
			 end
        else
            doCreateTeleport(configuration.teleport_id, configuration.to_pos, configuration.pos)
			doCreateTeleport(configuration.teleport_id, configuration.to_pos1, configuration.pos1)
            broadcastMessage("O Castle War foi aberto e fechará as 21h. Quem passará a ser a nova guild dominante?", MESSAGE_STATUS_WARNING)
        end
    end
	if os.date("%A") == configuration.day2 then
        local item = getTileItemById(configuration.pos, configuration.teleport_id).uid
		local item1 = getTileItemById(configuration.pos1, configuration.teleport_id).uid
        if item > 0 then
            doRemoveItem(item, 1)
			doRemoveItem(item1, 1)
            broadcastMessage("O Castle War foi fechado. Próxima abertura será no próximo sábado às 18h.", MESSAGE_STATUS_WARNING)
			for _, pid in ipairs(getPlayersOnline()) do
			  if isInArea(getPlayerPosition(pid), CTF1.fromPos, CTF1.toPos) then
			   doTeleportThing(pid, CTF1.deTile, false)
			  end
			  if isInArea(getPlayerPosition(pid), CTF2.fromPos, CTF2.toPos) then
			   doTeleportThing(pid, CTF2.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF3.fromPos, CTF3.toPos) then
			   doTeleportThing(pid, CTF3.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF4.fromPos, CTF4.toPos) then
			   doTeleportThing(pid, CTF4.deTile, false)
			  end
			   if isInArea(getPlayerPosition(pid), CTF5.fromPos, CTF5.toPos) then
			   doTeleportThing(pid, CTF5.deTile, false)
			  end
			  if isInArea(getPlayerPosition(pid), CTF6.fromPos, CTF6.toPos) then
			   doTeleportThing(pid, CTF6.deTile, false)
			  end
			 end
        else
            doCreateTeleport(configuration.teleport_id, configuration.to_pos, configuration.pos)
			doCreateTeleport(configuration.teleport_id, configuration.to_pos1, configuration.pos1)
            broadcastMessage("O Castle War foi aberto e fechará as 21h. Quem passará a ser a nova guild dominante?", MESSAGE_STATUS_WARNING)
        end
    end
    return true
end