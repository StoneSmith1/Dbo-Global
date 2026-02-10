local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('???')
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
if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
selfSay('Olá! Se voce está pronto, diga "reborn".')
focus = cid
talk_start = os.clock()
elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Desculpe, ' .. getCreatureName(cid) .. '! Hey!.')
elseif focus == cid then
talk_start = os.clock()
if msgcontains(msg, 'reborn') and getPlayerStorageValue(cid,30023) == 4 then
selfSay('Desculpe, mas voce já é rebornado.')
focus = 0
talk_start = 0
elseif msgcontains(msg, 'reborn') and (getPlayerLevel(cid) < 200 and getPlayerStorageValue(cid,30023) ~= 4) or (getPlayerLevel(cid) > 600 and getPlayerStorageValue(cid,30023) ~= 4) then
selfSay('Apenas level 200 até 600 podem rebornar.')
focus = 0
talk_start = 0
elseif msgcontains(msg, 'reborn') then
selfSay('Realmente quer isto?')
talk_state = 2
--_GOKU_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 8 then
doReborn(cid,1,10,9)
talk_state = 0

--_VEGETA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 23 then
doReborn(cid,1,25,24)
talk_state = 0

--_PICCOLO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 36 then
doReborn(cid,1,42,37)
talk_state = 0

--_C17_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 49 then
doReborn(cid,1,50,50)
talk_state = 0

--_GOHAN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 63 then
doReborn(cid,1,62,64)
talk_state = 0

--_TRUNKS_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 75 then
doReborn(cid,1,74,76)
talk_state = 0

--_CELL_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 87 then
doReborn(cid,1,81,88)
talk_state = 0

--_FREEZA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 101 then
doReborn(cid,1,88,102)
talk_state = 0

--_MAJIN BOO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 117 then
doReborn(cid,1,98,118)
talk_state = 0

--_BROLY_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 131 then
doReborn(cid,1,113,132)
talk_state = 0

--_C18_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 144 then
doReborn(cid,1,50,145)
talk_state = 0

--_UUB_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 156 then
doReborn(cid,1,128,157)
talk_state = 0

--_GOTEN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 170 then
doReborn(cid,1,142,171)
talk_state = 0

--_CHIBI TRUNKS_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 184 then
doReborn(cid,1,151,185)
talk_state = 0

--_COOLER_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 197 then
doReborn(cid,1,153,198)
talk_state = 0

--_DENDE_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 210 then
doReborn(cid,1,169,211)
talk_state = 0

--_TSUFUL_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 222 then
doReborn(cid,1,180,223)
talk_state = 0

--_BARDOCK_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 235 then
doReborn(cid,1,194,236)
talk_state = 0

--_KURIRIN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 248 then
doReborn(cid,1,205,249)
talk_state = 0

--_PAN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 260 then
doReborn(cid,1,212,261)
talk_state = 0

--_KAIO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 272 then
doReborn(cid,1,221,273)
talk_state = 0

--_VIDEL_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 284 then
doReborn(cid,1,227,285)
talk_state = 0

--_JANEMBA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 296 then
doReborn(cid,1,234,297)
talk_state = 0

--_TENSHINHAN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 308 then
doReborn(cid,1,246,309)
talk_state = 0

--_JENK_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 320 then
doReborn(cid,1,257,321)
talk_state = 0

--_RADITZ_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 332 then
doReborn(cid,1,265,333)
talk_state = 0

--_C16_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 344 then
doReborn(cid,1,277,345)
talk_state = 0

--_TURLES_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 356 then
doReborn(cid,1,285,357)
talk_state = 0

--_BULMA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 368 then
doReborn(cid,1,296,369)
talk_state = 0

--_SHENRON_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 380 then
doReborn(cid,1,302,381)
talk_state = 0

--_VEGETTO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 392 then
doReborn(cid,1,308,393)
talk_state = 0

--_TAPION_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 404 then
doReborn(cid,1,321,405)
talk_state = 0

--_KAME_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 417 then
doReborn(cid,1,335,418)
talk_state = 0

--_KING VEGETA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 429 then
doReborn(cid,1,347,430)
talk_state = 0

--_KAGOME_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 441 then
doReborn(cid,1,357,442)
talk_state = 0

--_ZAIKO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 453 then
doReborn(cid,1,368,454)
talk_state = 0

--_LORD CHILLED_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 465 then
doReborn(cid,1,375,466)
talk_state = 0

--_C8_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 482 then
doReborn(cid,1,578,483)
talk_state = 0

--_JIREN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 503 then
doReborn(cid,1,556,504)
talk_state = 0

--_BILLS_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 518 then
doReborn(cid,1,620,519)
talk_state = 0

--_GOKU JR_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 534 then
doReborn(cid,1,627,535)
talk_state = 0

--_BILLS FURIE_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 549 then
doReborn(cid,1,501,550)
talk_state = 0

--_TUPPER_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 564 then
doReborn(cid,1,642,565)
talk_state = 0

--_ZENNO SAMA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 579 then
doReborn(cid,1,651,580)
talk_state = 0

--_C13_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 594 then
doReborn(cid,1,660,595)
talk_state = 0

--_GIN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 609 then
doReborn(cid,1,668,610)
talk_state = 0

--_BOTAMO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 624 then
doReborn(cid,1,677,625)
talk_state = 0

--_FROST_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 639 then
doReborn(cid,1,713,640)
talk_state = 0

--_KITERA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 654 then
doReborn(cid,1,746,655)
talk_state = 0

--_KUSHI_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 669 then
doReborn(cid,1,755,670)
talk_state = 0

--_ALERQUINA_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 684 then
doReborn(cid,1,692,685)
talk_state = 0

--_ MR SATAN_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 699 then
doReborn(cid,1,772,700)
talk_state = 0

--_ ZAMASU_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 714 then
doReborn(cid,1,807,715)
talk_state = 0

--_ KYABE_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 729 then
doReborn(cid,1,704,730)
talk_state = 0

--_ GOKU BLACK_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 744 then
doReborn(cid,1,723,745)
talk_state = 0

--_ HITTO_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 759 then
doReborn(cid,1,737,760)
talk_state = 0

--_ LIQUIR_--_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 774 then
doReborn(cid,1,764,775)
talk_state = 0

--_ VERMOUTH_--
elseif msgcontains(msg, 'yes') and talk_state == 2 and getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) <= 600 and getPlayerVocation(cid) == 789 then
doReborn(cid,1,784,790)
talk_state = 0

elseif msgcontains(msg, 'yes') and talk_state == 2 then
selfSay('Desculpe, ' .. getCreatureName(cid) .. '! Voce deve estar na ultima transformação.')


elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
selfSay('Adeus!')
focus = 0
talk_start = 0
end
end
end

function onThink()
doNpcSetCreatureFocus(focus)
if (os.clock() - talk_start) > 45 then
if focus > 0 then
selfSay('Próximo por favor...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('Adeus!')
focus = 0
end
end
end