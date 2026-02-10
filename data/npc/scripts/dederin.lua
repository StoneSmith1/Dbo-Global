local STORAGE = 4150 -- Storage necessária para viajar
local smallcity = {x=107, y=200, z=7}
local namekisland = {x=461, y=447, z=5}
local bigcity = {x=117, y=102, z=7}
local icecity = {x=315, y=179, z=7}
local frozencity = {x=477, y=643, z=7}
local westisland = {x=83, y=39, z=7}
local eastisland = {x=111, y=39, z=7}
local brokencity = {x=99, y=343, z=7}
local assassintower = {x=254, y=393, z=7}
 
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
		selfSay("Eu posso te levar para {Small City}, {Namek Island}, {Big City}, {Ice City}, {Frozen City}, {West Island}, {East Island}, {Broken City}, {Assassin Tower} e {Castle War}.", cid)
	end
	if msgcontains(msg, "small city") then
		selfSay("Voce realmente quer viajar para {Small City}?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, smallcity)
			doSendMagicEffect(smallcity, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "namek island") then
		selfSay("Voce realmente quer viajar para {Namek Island}?", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, namekisland)
			doSendMagicEffect(namekisland, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
 
	if msgcontains(msg, "big city") then
		selfSay("Voce realmente quer viajar para {Big City}?", cid)
		talkState[talkUser] = 3
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 3 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, bigcity)
			doSendMagicEffect(bigcity, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "ice city") then
		selfSay("Voce realmente quer viajar para {Ice City}?", cid)
		talkState[talkUser] = 4
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, icecity)
			doSendMagicEffect(icecity, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "frozen city") then
		selfSay("Voce realmente quer viajar para {Frozen City}?", cid)
		talkState[talkUser] = 5
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 5 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, frozencity)
			doSendMagicEffect(frozencity, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "west island") then
		selfSay("Voce realmente quer viajar para {West Island}?", cid)
		talkState[talkUser] = 6
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 6 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, westisland)
			doSendMagicEffect(westisland, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "east island") then
		selfSay("Voce realmente quer viajar para {East Island}?", cid)
		talkState[talkUser] = 7
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 7 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, eastisland)
			doSendMagicEffect(eastisland, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "broken city") then
		selfSay("Voce realmente quer viajar para {Broken City}?", cid)
		talkState[talkUser] = 8
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 8 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, brokencity)
			doSendMagicEffect(brokencity, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
	if msgcontains(msg, "assassin tower") then
		selfSay("Voce realmente quer viajar para {Assassin Tower}?", cid)
		talkState[talkUser] = 9
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 9 then
		if getPlayerStorageValue(cid,4150) == 1 then
		if not isPlayerPzLocked(cid) then
			doSendMagicEffect(getThingPos(cid), 10)
			npcHandler:releaseFocus(cid)
			doTeleportThing(cid, assassintower)
			doSendMagicEffect(assassintower, 10)
		else
			selfSay("Voce deve estar sem pz locked!", cid)
		end
		elseif getPlayerStorageValue(cid,4150) ~= 1 then
			selfSay("Desculpe, voce nao possui passagem!", cid)
		end
	talkState[talkUser] = 0
	end
	
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())