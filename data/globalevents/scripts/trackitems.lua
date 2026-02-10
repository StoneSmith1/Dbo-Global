tablesToCheck = {"player_items", "player_depotitems", "tile_items", {"player_items", {"player_depotitems", "tile_items"}}, {"player_depotitems", "tile_items"}}

function onStartup()
local text, final = "", ""
local filex = "data/logs/duplicated.txt"
local f = io.open(filex, "a+")
local count = 0
for i = 1, table.maxn(tablesToCheck) do
if type(tablesToCheck) == "string" then
local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 1)")
if query:getID() ~= -1 then
while(true) do
local delete = db.executeQuery("delete from " .. tablesToCheck .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. " and player_id = " .. query:getDataInt("player_id") .. ";")
text = "[!] -> Deleting items with duplicated serial from '" .. tablesToCheck .. "': [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
count = (delete and count + 1 or count)
final = final .. (final ~= "" and "\n" or "") .. text
print(text)
if not query:next() then break end
end
end
else
if type(tablesToCheck[2]) == "string" then
local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[1] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[2] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
if query:getID() ~= -1 then
while(true) do
local query_ = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[2] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[1] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
local delete = db.executeQuery("delete from " .. tablesToCheck[1] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
count = (delete and count + 1 or count)
local delete2 = db.executeQuery("delete from " .. tablesToCheck[2] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
count = (delete2 and count + 1 or count)
text = "[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[1] .. "' [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!") ..
"\n[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[2] .. "' [Player: " .. getPlayerNameByGUID(query_:getDataInt("player_id")) .. ", Item: " .. query_:getDataInt("itemtype") .. ", Count: " .. query_:getDataInt("count") .. ", Serial: " .. query_:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
final = final .. (final ~= "" and "\n" or "") .. text
print(text)
if not query:next() then break end
end
end
else
for j = 1, #tablesToCheck[2] do
local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[1] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[2][j] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
if query:getID() ~= -1 then
while(true) do
local query_ = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM 18) AS 'track' FROM " .. tablesToCheck[2][j] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM 18) IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM 18) FROM " .. tablesToCheck[1] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM 18) HAVING COUNT(*) > 0)")
local delete = db.executeQuery("delete from " .. tablesToCheck[1] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
count = (delete and count + 1 or count)
local delete2 = db.executeQuery("delete from " .. tablesToCheck[i][2][j] .. " where SUBSTRING(CONVERT(attributes USING latin1) FROM 18) = " .. db.escapeString(query:getDataString("track")) .. ";")
count = (delete2 and count + 1 or count)
text = "[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][1] .. "' [Player: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: " .. query:getDataInt("itemtype") .. ", Count: " .. query:getDataInt("count") .. ", Serial: " .. query:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!") ..
"\n[!] -> Deleting item with duplicated serial from '" .. tablesToCheck[i][2][j] .. "' [Player: " .. getPlayerNameByGUID(query_:getDataInt("player_id")) .. ", Item: " .. query_:getDataInt("itemtype") .. ", Count: " .. query_:getDataInt("count") .. ", Serial: " .. query_:getDataString("track") .."]... " .. (delete and "Success!" or "Failed!")
final = final .. (final ~= "" and "\n" or "") .. text
print(text)
if not query:next() then break end
end
end
end
end
end
end
if f ~= nil then
f:write("[" .. os.date("%d %B %Y %X ", os.time()) .. "] >> [Anti-Dupe] " .. count .. " duplicated items have been deleted from the database.\n" .. (final == "" and "[!] -> No duplicated item was found in the database" or final) .. "\n\n")
f:close()
else
print("[!] -> [Anti-Dupe] Cannot save info to file!")
end
return true
end