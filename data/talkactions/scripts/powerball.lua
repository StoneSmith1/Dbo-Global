local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Vegeta
[17] = { 30, 18, 20, 34},
-- Gohan
[57] = { 30, 58, 56, 34},
-- Broly
[127] = { 50, 128, 109, 34},
-- Bardock
[230] = { 30, 231, 189, 34},
[236] = { 50, 237, 189, 34},
-- Tsuful
[226] = { 200, 227, 184, 34},
-- Jenk
[321] = { 50, 322, 258, 34},
-- Turles
[352] = { 50, 353, 281, 34},
}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "PowerBall", 19)
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Nao é possível transformar.")
end
return true
end