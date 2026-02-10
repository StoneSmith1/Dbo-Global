local STORAGE = 65506 -- Storage necessária para viajar
local treineafk = {x=178, y=171, z=10}
 
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
	if msgcontains(msg, "upgrade island") then
		selfSay("Eu posso te levar para a {Upgrade Island}.", cid)
	end
	if msgcontains(msg, "upgrade island") then
		selfSay("Voce realmente quer si teleportar para a {upgrade island}?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid,65506) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, treineafk)
			doSendMagicEffect(treineafk, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,65506) ~= 1 then
			selfSay("Desculpe, voce nao possui acesso!", cid)
		end
	talkState[talkUser] = 0
	end
	
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())