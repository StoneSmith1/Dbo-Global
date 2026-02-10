local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Gohan
[61] = { 175, 62, 60, 127}

}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "Click", 19)
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa estar no level " .. voc[1] .. " para se disfarçar.")
end
else
doPlayerSendCancel(cid, "Nao é possível se disfarçar.")
end
return true
end