local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false
local pos = {x=99, y=188, z=7}

function onThingMove(creature, thing, oldpos, oldstackpos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
  	if focus == cid then
          selfSay('Hey!.')
          focus = 0
          talk_start = 0
  	end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
  	msg = string.lower(msg)

  	if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 5 then
				doTeleportThing(cid, pos)
					selfSay('Adeus!')
					focus = 0
					talk_start = 0

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 5 then
  		selfSay('Sorry, ' .. getCreatureName(cid) .. '! ????????.')

  	elseif focus == cid then
		talk_start = os.clock()
				

		elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 5 then
			selfSay('Good bye, ' .. getCreatureName(cid) .. '!')
			focus = 0
			talk_start = 0
		end
	end


function onThink()
	doNpcSetCreatureFocus(focus)
  	if (os.clock() - talk_start) > 45 then
  		if focus > 0 then
  			selfSay('Next Please...')
  		end
  			focus = 0
  	end
 	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 6 then
 			selfSay('Good bye then.')
 			focus = 0
 		end
 	end
end
