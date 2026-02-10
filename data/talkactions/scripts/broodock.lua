local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Broly
[136] = { 250, 137, 118, 121},
-- Bardock
[240] = { 250, 241, 118, 121}
}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "Broodock", 19)
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa estar no level " .. voc[1] .. " para se fundir.")
end
else
doPlayerSendCancel(cid, "Nao é possível se fundir.")
end
return true
end