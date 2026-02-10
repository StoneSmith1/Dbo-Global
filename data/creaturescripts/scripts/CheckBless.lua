function onLogin(cid)

if(getPlayerBlessing(cid, 1)) then
first = "Sim"
else
first = "Não"
end
if(getPlayerBlessing(cid, 2)) then
second = "Sim"
else
second = "Não"
end
if(getPlayerBlessing(cid, 3)) then
third = "Sim"
else
third = "Não"
end
if(getPlayerBlessing(cid, 4)) then
fourth = "Sim"
else
fourth = "Não"
end
if(getPlayerBlessing(cid, 5)) then
fifth = "Sim"
else
fifth = "Não"
end

doPlayerSendTextMessage(cid,20,'Suas Blessings: [1='.. first ..' / 2='.. second ..' / 3='.. third ..' / 4='.. fourth ..' / 5='.. fifth ..']')

return true
end