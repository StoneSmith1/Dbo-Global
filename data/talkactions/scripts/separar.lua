local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Goku
[5] = { 0, 4, 5, 121},
[14] = { 0, 13, 14, 121},
-- Vegeta
[21] = { 0, 20, 22, 121},
[29] = { 0, 28, 29, 121},
-- Broly
[137] = { 0, 136, 117, 121},
-- Bardock
[241] = { 0, 240, 197, 121},
-- Goten
[166] = { 0, 165, 136, 121},
[167] = { 0, 165, 136, 121},
[168] = { 0, 165, 136, 121},
[173] = { 0, 172, 143, 121},
-- Chibi Trunks
[180] = { 0, 179, 150, 121},
[181] = { 0, 179, 150, 121},
[182] = { 0, 179, 150, 121},
[187] = { 0, 186, 152, 121},
}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "Separar", 19)
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa estar no level " .. voc[1] .. " para se separar.")
end
else
doPlayerSendCancel(cid, "Nao é possível se separar.")
end
return true
end