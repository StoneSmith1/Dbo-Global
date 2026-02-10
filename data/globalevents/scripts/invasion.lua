local i = {

["18:18"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=73, y=189, z=7}, monster = {"5 Ventinho"}},


["18:19"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=86, y=189, z=7}, monster = {"10 Ventinho"}},


["18:20"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=101, y=196, z=7}, monster = {"10 Ventinho"}},


["18:21"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=111, y=187, z=7}, monster = {"5 Ventinho"}},


["18:22"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=107, y=171, z=7}, monster = {"10 Ventinho"}},


["18:23"] = {nome = "Precisamos Da Ajuda De Todos, A Cidade Esta Sendo Invadidae", pos = {x=83, y=168, z=7}, monster = {"5 Ventinho"}},

}

function onTime()

hours = tostring(os.date("%X")):sub(1, 5)

tb = i[hours]

if tb then

doBroadcastMessage(hours .. " - " .. tb.nome .. " iníciou ! Todos na City Principal !.")

for _,x in pairs(tb.monster) do

for s = 1, tonumber(x:match("%d+")) do

doSummonCreature(x:match("%s(.+)"), tb.pos)

end

end

end

return true

end