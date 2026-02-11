-- vip.lua (creaturescript) - detects VIP start/end and evicts houses on VIP end
-- Also shows VIP status + remaining premium days on every login.
-- Requires VIP lib (data/lib/050-vip.lua) loaded before this file.

local function evictPlayerHousesToDepot(cid)
    -- Evict all houses owned by player (items should go to depot via cleanHouse)
    local guid = getPlayerGUID(cid)
    if not guid or guid <= 0 then
        return
    end

    local resultId = db.storeQuery("SELECT `id` FROM `houses` WHERE `owner` = " .. guid)
    if resultId then
        repeat
            local houseId = result.getDataInt(resultId, "id")
            if houseId and houseId > 0 then
                -- cleanHouse usually moves items to owner's depot (OTX behavior in many builds)
                cleanHouse(houseId)
                setHouseOwner(houseId, NO_OWNER_PHRASE, true)
            end
        until not result.next(resultId)
        result.free(resultId)
    end
end

local function sendVipStatus(cid)
    local days = getPlayerPremiumDays(cid)
    if days > 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
            "VIP: ATIVO | Dias restantes: " .. days .. " | Benefícios: +10% EXP, +5% skill/magic, stamina 2x no PZ, VIP compra casa.")
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
            "VIP: INATIVO | Benefícios desativados. Use um PACC (10/30/90) para ativar.")
    end
end

function onLogin(cid)
    local mark = getPlayerStorageValue(cid, VIP.STORAGE_PREMIUM_MARK)
    local days = getPlayerPremiumDays(cid)

    if days > 0 then
        if mark == -1 then
            setPlayerStorageValue(cid, VIP.STORAGE_PREMIUM_MARK, 1)
            VIP.sendBenefitsMessage(cid)
        end
        sendVipStatus(cid)
        return true
    end

    -- Premium ended
    if mark == 1 then
        setPlayerStorageValue(cid, VIP.STORAGE_PREMIUM_MARK, -1)

        evictPlayerHousesToDepot(cid)

        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), true)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
        doPlayerPopupFYI(cid, "Sua VIP (Premium) acabou. Casas foram removidas e itens enviados ao depot.")
    end

    sendVipStatus(cid)
    return true
end
