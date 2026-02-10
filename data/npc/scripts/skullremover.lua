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

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid




if msgcontains(msg, "remover") then
npcHandler:say("Voce quer remover seu red skull? {yes} ou {no}.", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
npcHandler:say("Esta bem, quando decidir fale comigo novamente.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
if getCreatureSkullType(cid) < SKULL_RED then
npcHandler:say("Voce nao esta red skull.", cid)
else
if doPlayerRemoveItem(cid, 2160, 5) then
db.executeQuery("UPDATE killers SET unjustified = '0' WHERE id IN (SELECT kill_id FROM player_killers WHERE player_id = "..getPlayerGUID(cid)..")")
doCreatureSetSkullType(cid, 1)
npcHandler:say("Seu red skull foi removido.", cid)
else
npcHandler:say("Voce nao tem o necessario para remover seu red skull.", cid)
end
end
end


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())