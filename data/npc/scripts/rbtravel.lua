local STORAGE = 30023 -- Storage necessária para viajar
local DESTINO = {x = 424, y = 400, z = 13} -- POSIÇÃO DE DESTINO
 
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
	if msgcontains(msg, "reborn") then
		selfSay("Já falou com a Bulma?, Tem Certesa Que Deseja Proceseguir ?.", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if (getPlayerStorageValue(cid,30023) ~= 4) and (getPlayerStorageValue(cid,43234) == 1) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, DESTINO)
			doSendMagicEffect(DESTINO, 10)
		elseif getPlayerStorageValue(cid,30023) == 4 then
			selfSay("Voce ja rebornou, vaza daqui fdp antes que eu retire seu Reborn!", cid)
		elseif getPlayerStorageValue(cid,43234) ~= 1 then
			selfSay("Primeiro encontre a Bulma que esta a procura de danos para reparar em Small City.", cid)
		end
	talkState[talkUser] = 0
	end
 
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())