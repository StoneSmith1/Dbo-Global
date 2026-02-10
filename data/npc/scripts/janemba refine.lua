local STORAGE = 64982 -- Storage necessária para viajar
local saladerefine = {x=676, y=219, z=11}
 
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
	if msgcontains(msg, "travel") then
		selfSay("Eu posso te levar para o {Sala De Refine}.", cid)
	end
	if msgcontains(msg, "sala de refine") then
		selfSay("Voce realmente quer si teleportar para a {sala de refine}?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid,64982) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, saladerefine)
			doSendMagicEffect(saladerefine, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,64982) ~= 1 then
			selfSay("Desculpe, voce nao pagou os blue barrs ao npcs na sala de quest!", cid)
		end
	talkState[talkUser] = 0
	end
	
   return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())