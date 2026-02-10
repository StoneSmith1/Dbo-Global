    local config = {
    storage = 1444,
    
    }
     
    function onSay(cid, words, param, channel)
     if os.time() > getPlayerStorageValue(cid,12397)+(300) or getPlayerStorageValue(cid,12397) == -1  then
    if(getPlayerStorageValue(cid,config.storage) < 1) then
     setPlayerStorageValue(cid, config.storage, 1)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce mudou sua HP/MP para o modo normal.")
    else
setPlayerStorageValue(cid, config.storage, nil)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce mudou sua HP/MP para o modo porcentagem.")
    end
     doCreatureAddHealth(cid, -1)
doPlayerAddMana(cid, -1)
setPlayerStorageValue(cid, 12397, os.time())
else
		doPlayerSendCancel(cid, "Voce podera usar novamente dentro de 5 minutos.")end
    return true
    end