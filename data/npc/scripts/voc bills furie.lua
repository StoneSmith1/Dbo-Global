local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {2150, 13496}, -- item1 item que será pedido e que será dado na primeira troca
}
local counts = {
          count1 = {500, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		if msgcontains(msg, 'bills furie') then
			selfSay('Voce deseja se Transformar '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' em '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					doPlayerAddItem(cid, items.item1[2], counts.count1[2])
					selfSay('Parabéns agr voce é  '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' um '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
				end
			end
		end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())