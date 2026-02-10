function onSay(cid, words, param, channel)
local storage = 6708
local delaytime = 60
local a = "data/txt/bugs.txt"

local f = io.open(a, "a+")
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local exhaust = exhaustion.get(cid, storage)
	if(not exhaust) then
		exhaustion.set(cid, storage, delaytime)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bug reportado! Obrigado pela ajuda.")
		f:write("\n"..getPlayerName(cid).." reportou um bug em: \n" .. os.date("%d %B %Y - %X ", os.time()) .."\n"..param.."\nPosition: [x="..getPlayerPosition(cid).x..", y="..getPlayerPosition(cid).y..", z="..getPlayerPosition(cid).z.."].\n")
		f:close()
	else
		doPlayerSendCancel(cid, "Poderá reportar novamente dentro de 1 minuto.")
	end
	return true
end

