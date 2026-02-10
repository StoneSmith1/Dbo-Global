local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

local keys = {
["bone key"] = {id_key = 2092, price = 100000, action_id = 2092},
["golden key"] = {id_key = 2091, price = 100000, action_id = 2091},
["silver key"] = {id_key = 2088, price = 1000000, action_id = 2088},
["cooper key"] = {id_key = 2089, price = 1000000, action_id = 2089},
}

local m = keys[msg]

if (not m) then
selfSay("Eu nao vendo esta chave.", cid)
return FALSE
end

if doPlayerRemoveMoney(cid, m.price) == TRUE then
a = doPlayerAddItem(cid, m.id_key, 1)
doItemSetAttribute(a, "aid", m.action_id)
selfSay("Obrigado, aqui esta sua chave.", cid)
talkState[talkUser] = 0
else  
selfSay("Voce nao tem dinheiro suficiente.", cid)
talkState[talkUser] = 0
end

return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())