local config = {
	storage = 030220122041,
	version = 1, 
	marks = {
		{mark = 3, pos = {x = 396, y = 697, z = 7}, desc = "Esfera De 1 Estrela"},
		{mark = 3, pos = {x = 428, y = 567, z = 7}, desc = "Esfera De 2 Estrelas"},
		{mark = 3, pos = {x = 276, y = 843, z = 7}, desc = "Esfera De 3 Estrelas"},
		{mark = 3, pos = {x = 483, y = 381, z = 5}, desc = "Esfera De 4 Estrelas"},
		{mark = 3, pos = {x = 178, y = 350, z = 5}, desc = "Esfera De 5 Estrelas"},
		{mark = 3, pos = {x = 37, y = 342, z = 7}, desc = "Esfera De 6 Estrelas"},
		{mark = 3, pos = {x = 100, y = 98, z = 7}, desc = "Esfera De 7 Estrelas"}
		}
}

local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	for _, m  in pairs(config.marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
	doPlayerSendTextMessage(cid, 25, "Agora voce tem as localizações das esferas no seu mini mapa.")
	setPlayerStorageValue(cid, config.storage, config.version)
	return TRUE
end