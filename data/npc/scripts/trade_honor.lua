local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local Honor_Storage = 215548
function getHonorPoints(cid)
local Honor = getPlayerStorageValue(cid, Honor_Storage)
return Honor < 0 and 0 or Honor
end
local shopWindow = {}
local t = {
		  [12632] = {price = 25}, -- Janemba Helmet
		  [12633] = {price = 50}, -- Cell Helmet
		  [12629] = {price = 15}, -- Piccolo Cap
		  [12657] = {price = 15}, -- Super C17 Armor
		  [12660] = {price = 10}, -- Fusion Armor
		  [12680] = {price = 10}, -- Fusion Legs
		  [12694] = {price = 10}, -- Fusion Boots
		  [12662] = {price = 25}, -- Legendary Armor
		  [12681] = {price = 25}, -- Legendary Legs
		  [12695] = {price = 25}, -- Legendary Boots
		  }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
		if  t[item] and getHonorPoints(cid) < t[item].price then
			 selfSay("Voce não tem "..t[item].price.." Honor Points.", cid)
				 else
				doPlayerAddItem(cid, item)
				setPlayerStorageValue(cid, Honor_Storage, getPlayerStorageValue(cid, Honor_Storage) - t[item].price)
				selfSay("Aqui está seu item.", cid)
		   end
		return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
						for var, ret in pairs(t) do
										table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
								end
						openShopWindow(cid, shopWindow, onBuy, onSell)
				end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())