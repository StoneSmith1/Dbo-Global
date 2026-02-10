local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
-- Goku
[4] = { 100, 5, 6, 121},
-- Vegeta
[20] = { 100, 21, 6, 121},
-- Goten
[165] = { 50, 166, 137, 121},
[166] = { 75, 167, 138, 121},
[167] = { 100, 168, 139, 121},
[172] = { 100, 173, 144, 121},
-- Chibi Trunks
[179] = { 50, 180, 137, 121},
[180] = { 75, 181, 138, 121},
[181] = { 100, 182, 139, 121},
[186] = { 100, 187, 144, 121}
}
function onSay(cid, words, param, channel)
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
doCreatureSay(cid, "Fusão", 19)
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