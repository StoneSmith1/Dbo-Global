-- VIP System (OTX 8.60) - helpers
-- VIP is based on Premium Days (PACC items add premium days)
VIP = VIP or {}

-- storage to mark last-known premium state (used to detect expiration)
VIP.STORAGE_PREMIUM_MARK = 95498

function VIP.isVip(cid)
    return isPlayer(cid) and getPlayerPremiumDays(cid) > 0
end

function VIP.sendBenefitsMessage(cid)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
        "VIP ativo: +10% EXP (monstros), +5% skill/magic tries (treino), stamina 2x no PZ, e somente VIP compra casa.")
end
