local configuration = {
    day = "Saturday",
	day2 = "Wednesday",
	to_pos2 = {x = 642, y = 731, z = 7},
    pos2 = {x = 642, y = 729, z = 7},
	
	to_pos3 = {x = 642, y = 707, z = 7},
    pos3 = {x = 642, y = 709, z = 7},
	
    teleport_id = 1387,                --ID do teleport.
}
function onTime()
    if os.date("%A") == configuration.day then
		local item2 = getTileItemById(configuration.pos2, configuration.teleport_id).uid
		local item3 = getTileItemById(configuration.pos3, configuration.teleport_id).uid
        if item2 > 0 then
			doRemoveItem(item2, 1)
			doRemoveItem(item3, 1)
            broadcastMessage("O último teleport de dentro do Castle War foi fechado.", MESSAGE_STATUS_WARNING)
        else
			doCreateTeleport(configuration.teleport_id, configuration.to_pos2, configuration.pos2)
			doCreateTeleport(configuration.teleport_id, configuration.to_pos3, configuration.pos3)
            broadcastMessage("O último teleport de dentro do Castle War foi aberto e fechará em 5 minutos.", MESSAGE_STATUS_WARNING)
        end
    end
	if os.date("%A") == configuration.day2 then
		local item2 = getTileItemById(configuration.pos2, configuration.teleport_id).uid
		local item3 = getTileItemById(configuration.pos3, configuration.teleport_id).uid
        if item2 > 0 then
			doRemoveItem(item2, 1)
			doRemoveItem(item3, 1)
            broadcastMessage("O último teleport de dentro do Castle War foi fechado.", MESSAGE_STATUS_WARNING)
        else
			doCreateTeleport(configuration.teleport_id, configuration.to_pos2, configuration.pos2)
			doCreateTeleport(configuration.teleport_id, configuration.to_pos3, configuration.pos3)
            broadcastMessage("O último teleport de dentro do Castle War foi aberto e fechará em 5 minutos.", MESSAGE_STATUS_WARNING)
        end
    end
    return true
end