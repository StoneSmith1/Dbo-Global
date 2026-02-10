local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {2150}, -- Item que será pedido.
}
local counts = {
          count1 = {500}, -- Quantidade do item que será pedido.
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		if msgcontains(msg, 'divindade essencias') then
			selfSay('Ao me dar 500 divindade essencias voce obtera a nossa area de upgrade, tem certeza disso?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					setPlayerStorageValue(cid, 65506, 1)
					selfSay('Voce acaba de obter o acesso a nossa area de upgrade.',cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de 500 divindade essencias.',cid)
					talkState[talkUser] = 0
				end
			else
				selfSay('Tudo bem.',cid)
				talkState[talkUser] = 0
			end
		end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())