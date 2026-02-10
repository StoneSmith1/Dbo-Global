local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {13215}, -- Item que será pedido.
}
local counts = {
          count1 = {1}, -- Quantidade do item que será pedido.
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		if msgcontains(msg, 'ticket') then
			selfSay('Ao me dar um Ticket voce obtera a passagem, tem certeza disso?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					setPlayerStorageValue(cid, 4150, 1)
					selfSay('Voce acaba de obter a passagem gratuita no meu amigo Dederin.',cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de um Ticket.',cid)
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