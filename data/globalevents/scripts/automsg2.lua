local messages = {
"Ola, A Parti Do Dia 10/12/2018 o Double Point Sera Retirado e Sera Aumentado O Valor Das Voc Vip Para 25Points, Aproveitem o Double Xp, Dura Ate Domingo Somete Players Inferior a LvL 400,  Attr Daniel."
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
for _, pid in ipairs(getPlayersOnline()) do
doPlayerSendTextMessage(pid, 20, "".. message .."")
i = i + 1
end
return TRUE
end