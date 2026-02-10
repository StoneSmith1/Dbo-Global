local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {13500}, -- Item que será pedido.
}
local counts = {
          count1 = {400}, -- Quantidade do item que será pedido.
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		if msgcontains(msg, 'blue barrs') then
			selfSay('Ao me dar 400 blue barrs voce vai obter acesso a sala de refinamento do seu seu janemba set, tem certeza disso?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					setPlayerStorageValue(cid,64982, 1)
					selfSay('Voce acaba de obter o acesso a area de melhorias do seu janemba set.',cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de 400 blue barrs.',cid)
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