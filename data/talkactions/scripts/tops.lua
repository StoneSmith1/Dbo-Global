function onSay(cid, words, param, channel)
if param == '' then
local lista = db.getResult("SELECT `name` FROM `guilds`;")
if(lista:getID() ~= -1) then
local v = ''
repeat
v = v .. lista:getDataString("name") .. "\n"
until not lista:next()
lista:free()
doShowTextDialog(cid, 2529, v)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Não existem guilds no servidor.")
end
else
local id = getGuildId(param)
if id then
local lista = db.getResult("SELECT `name`, `rank_id` FROM `players` WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = " .. id .. ");")
if(lista:getID() ~= -1) then
local v = ''
repeat
local rank = db.getResult("SELECT `name` FROM `guild_ranks` WHERE `id` = " .. lista:getDataInt("rank_id") .. " LIMIT 1;")
v = v .. lista:getDataString("name") .. " [" .. rank:getDataString("name") .. "]\n"
rank:free()
until not lista:next()
lista:free()
doShowTextDialog(cid, 2529, v)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No hay jugadores en este guild.")
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Está Guild não existe.")
end
end
return TRUE
end