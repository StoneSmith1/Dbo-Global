local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local items = {
          item1 = {12766, 12770}, -- item1 item que será pedido e que será dado na primeira troca
		  item2 = {12766, 12771},
		  item3 = {12766, 12772},
		  item4 = {12766, 12773},
		  item5 = {12766, 12774},
}
local counts = {
          count1 = {50, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
		  count2 = {75, 1},
		  count3 = {100, 1},
		  count4 = {150, 1},
		  count5 = {200, 1},
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		keywordHandler:addKeyword({'scrolls'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu troco diferentes Scrolls por Magic Leafs, tais como: {Pink Scroll}, {Yellow Scroll}, {Blue Scroll}, {Green Scroll} e {Red Scroll}.'})
		if msgcontains(msg, 'pink scroll') then
			selfSay('Voce deseja trocar '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'?',cid)
			talkState[talkUser] = 1
		elseif talkState[talkUser] == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
					doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
					doPlayerAddItem(cid, items.item1[2], counts.count1[2])
					selfSay('Obrigado! Voce acaba de trocar '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
				end
			end
		elseif msgcontains(msg, 'yellow scroll') then
			selfSay('Voce deseja trocar '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' por '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'?',cid)
			talkState[talkUser] = 2
		elseif talkState[talkUser] == 2 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
					doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
					doPlayerAddItem(cid, items.item2[2], counts.count2[2])
					selfSay('Obrigado! Voce acaba de trocar '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' por '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'.', cid)
				end
			end
		elseif msgcontains(msg, 'blue scroll') then
			selfSay('Voce deseja trocar '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..' por '.. counts.count3[2] ..' '.. getItemNameById(items.item3[2]) ..'?',cid)
			talkState[talkUser] = 3
		elseif talkState[talkUser] == 3 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
					doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
					doPlayerAddItem(cid, items.item3[2], counts.count3[2])
					selfSay('Obrigado! Voce acaba de trocar '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..' por '.. counts.count3[2] ..' '.. getItemNameById(items.item3[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..'.', cid)
				end
			end
		elseif msgcontains(msg, 'green scroll') then
			selfSay('Voce deseja trocar '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..' por '.. counts.count4[2] ..' '.. getItemNameById(items.item4[2]) ..'?',cid)
			talkState[talkUser] = 4
		elseif talkState[talkUser] == 4 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
					doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
					doPlayerAddItem(cid, items.item4[2], counts.count4[2])
					selfSay('Obrigado! Voce acaba de trocar '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..' por '.. counts.count4[2] ..' '.. getItemNameById(items.item4[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..'.', cid)
				end
			end
		elseif msgcontains(msg, 'red scroll') then
			selfSay('Voce deseja trocar '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..' por '.. counts.count5[2] ..' '.. getItemNameById(items.item5[2]) ..'?',cid)
			talkState[talkUser] = 5
		elseif talkState[talkUser] == 5 then
			if msgcontains(msg, 'yes') then
				if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
					doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
					doPlayerAddItem(cid, items.item5[2], counts.count5[2])
					selfSay('Obrigado! Voce acaba de trocar '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..' por '.. counts.count5[2] ..' '.. getItemNameById(items.item5[2]) ..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Voce precisa de '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..'.', cid)
				end
			end
		end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())