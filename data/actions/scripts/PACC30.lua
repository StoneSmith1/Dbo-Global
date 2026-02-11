-- PACC30.lua (VIP/Premium Days)
-- Keeps original behavior; adds a VIP benefits message.
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if item.itemid == 5958 then
        doRemoveItem(item.uid, 1)
        doPlayerAddPremiumDays(cid, 30)
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
            "VIP ativado/renovado: +10% EXP (monstros), +5% skill/magic tries (treino), stamina 2x no PZ, e somente VIP compra casa.")
        return true
    end
    return false
end
