local points = 0
function onUse(player, item, fromPosition, itemEx, toPosition)	
		db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + "..points.." WHERE id=" ..player:getAccountId())
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você recebeu '..points..' premium points!')
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		Item(item.uid):remove(1)
	return true
end