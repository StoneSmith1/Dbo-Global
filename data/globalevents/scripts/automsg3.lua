local messages = {
"Foi Adicionado Comando !save, seu Personagem foi salvo com sucesso!! Sempre que ganhar algum item ou fizer algo importante diga !save, pois nunca ce sabe oq vai acontecer. Castle Todas As Quarta e Sabado As 19:30 ate 21h"
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