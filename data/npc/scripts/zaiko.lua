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
local moeda = 2160
local t = {
		 ["mega shunkanido"] = {price = 1000}
		 }
if (msgcontains(msg, 'spells'))then
local str = ""
for name, pos in pairs(t) do
str = str.."Posso lhe ensinar apenas o {"..name.."} por "..pos.price.." Golds."
end
str = str .. "."
npcHandler:say(str, cid)
elseif t[msg] then
			 if not getPlayerLearnedInstantSpell(cid, msg) then
			 if doPlayerRemoveItem(cid,moeda,t[msg].price) then
					 doPlayerLearnInstantSpell(cid, msg)
					 npcHandler:say("Voce aprendeu o Shunkanido Blasting!", cid)
			 else
					 npcHandler:say("Voce precisa de 1000 Golds.", cid)
			 end
			 else
					 npcHandler:say("Voce já aprendeu esta magia.", cid)
			 end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())