-- [( Script created by Matheus for TibiaKing.com )] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Encontrou algum Bug? Ajude-nos a resolver, usando o comando !report. \n Quer ficar ligado nas novidades do servidor? Digite !notice.Estamos Com Double Points Aproveitem",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return true
end