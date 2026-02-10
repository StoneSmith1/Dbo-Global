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
	if msgcontains(msg, "defender") then
		selfSay("Diga yes e volte ao npc de reborn e tente nao morrer. HaHaHa", cid)
		talkState[talkUser] = 1
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 1) and (getPlayerItemCount(cid, 12750) >= 0 and getPlayerItemCount(cid, 12751) >= 0 and getPlayerItemCount(cid, 12752) >= 0 and getPlayerItemCount(cid, 12753) >= 0 and getPlayerItemCount(cid, 12754) >= 0 and getPlayerItemCount(cid, 12755) >= 0 and getPlayerItemCount(cid, 12756) >= 0) then
		doPlayerRemoveItem(cid, 12750, 0)
		doPlayerRemoveItem(cid, 12751, 0)
		doPlayerRemoveItem(cid, 12752, 0)
		doPlayerRemoveItem(cid, 12753, 0)
		doPlayerRemoveItem(cid, 12754, 0)
		doPlayerRemoveItem(cid, 12755, 0)
		doPlayerRemoveItem(cid, 12756, 0)
		setPlayerStorageValue(cid, 43234, 1)
		selfSay("Obrigada, Boa Sorte voce irá precisar. HaHaHa", cid)
		talkState[talkUser] = 0
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 1) and (getPlayerItemCount(cid, 12750) == 0 or getPlayerItemCount(cid, 12751) == 0 or getPlayerItemCount(cid, 12752) == 0 or getPlayerItemCount(cid, 12753) == 0 or getPlayerItemCount(cid, 12754) == 0 or getPlayerItemCount(cid, 12755) == 0 or getPlayerItemCount(cid, 12756) == 0) then
		selfSay("Desculpe, Retire qualquer esfera que estiver em sua backpack.", cid)
		talkState[talkUser] = 0
	end
   return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())