local config = {
cooldown = 60, -- tempo entre uma magia e outra
tempo = 60, -- tempo em segundos que ficará healando
storage = 45382,
effect = 113 --- efeito que vai sair
}

function onCastSpell(cid, var)
if getPlayerLevel(cid) < 200 then
if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
for i = 1, config.tempo do
addEvent(function()
 if isCreature(cid) then
 local lifedraw = 1000
 local pos = getPlayerPosition(cid)
              doCreatureAddMana(cid, lifedraw, 1) 
              doSendAnimatedText(pos, "+"..lifedraw , TEXTCOLOR_PURPLE)		  
				doSendMagicEffect(pos, config.effect)
end
end, 1000*i)
end
doPlayerSetStorageValue(cid, config.storage, os.time())
else
doPlayerSendCancel(cid, "Podera usar novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." segundos.")
return false
end
else
doPlayerSendCancel(cid, "Somente level menores que 200 podem usar esta magia.")
return false
end
return true
end