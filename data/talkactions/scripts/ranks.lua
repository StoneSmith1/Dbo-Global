local ranks = {

['fist'] = {0},
['weapon'] = {1},
['club'] = {1},
['sword'] = {2},
['strenght'] = {3},
['axe'] = {3},
['ki blasting'] = {4},
['distance'] = {4},
['defense'] = {5},
['shielding'] = {5},
['shield'] = {5},
['fish'] = {6},
['fishing'] = {6},
['ki level'] = {7},
['ki'] = {7},
['magic level'] = {7},
['magic'] = {7},
['level'] = {8},

}


function onSay(cid, words, param)

local msg = string.lower(param)
if ranks[msg] ~= nil then
str = getHighscoreString((ranks[msg][1]))
else
str = getHighscoreString((8))
end
doShowTextDialog(cid,13082, str)
return TRUE

end