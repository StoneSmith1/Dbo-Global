function onThink(interval, lastExecution)
pos = {x = 96, y = 182, z = 6} -- Coordenada de onde sairá o texto
pos2 = {x = 107, y = 182, z = 6} -- Coordenada de onde sairá o texto
doSendAnimatedText(pos, 'Shop Vip', 180)
doSendAnimatedText(pos2, 'Quests', 180)
return true
end