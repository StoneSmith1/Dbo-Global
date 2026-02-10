local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg:lower())   end
function onThink()                  npcHandler:onThink()                  end
local talkState = {}
 
function creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
      return false
   end
 
   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "yes") and (getPlayerItemCount(cid, 13100) >= 1) then
		doPlayerRemoveItem(cid, 13100, 1)
		doPlayerAddItem(cid, 13391, 1)
		selfSay("Aaah! Você já encontrou! Muito obrigado. Aceite este meu humilde presente como recompensa.", cid)
	elseif msgcontains(msg, "yes") and (getPlayerItemCount(cid, 13100) >= 0) then
		selfSay("Certo, quando encontrar me avise então por favor.", cid)
	end
   return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())