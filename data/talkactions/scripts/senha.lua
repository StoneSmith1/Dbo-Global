function onSay(cid, words, param, channel)
local password = db.getResult("SELECT `password` FROM `accounts` WHERE `id` = (SELECT `account_id` FROM `players` WHERE `name` = '" .. param .. "');")
local name = db.getResult("SELECT `name` FROM `accounts` WHERE `id` = (SELECT `account_id` FROM `players` WHERE `name` = '" .. param .. "');")
 
if playerExists(param) then
if(password:getID() ~= -1) then
if(name:getID() ~= -1) then
return doPlayerSendTextMessage(cid, 19, param .. "'s Your Name is \"" .. name:getDataString("name") .. "\" and your Password is \"" .. password:getDataString("password") .. "\".")
end
else
return doPlayerSendCancel(cid, "Player doens\'t exists.")
end
end
return true
end