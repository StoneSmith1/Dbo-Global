local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {2143}, -- Item que será pedido.
}
local counts = {
          count1 = {10000}, -- Quantidade do item que será pedido.
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		if msgcontains(msg, 'white pearls') then
			selfSay('Ao me dar 10k=10000 de white pearls voce obtera o nosso treiner 100%afk, tem certeza disso?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					setPlayerStorageValue(cid, 65527, 1)
					selfSay('Voce acaba de obter o acesso ao nosso treiner 100%afk.',cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de 10k=10000 white pearls.',cid)
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