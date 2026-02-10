skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}
skillStages = {}
skillStages[SKILL_FIST] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_CLUB] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_SWORD] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_AXE] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_DISTANCE] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_SHIELD] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_FISHING] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL__MAGLEVEL] = {{0,5},{100,4},{120,3},{135,2},{150,1},{155,0}}
showInfoOnAdvance = true
showInfoOnLogin = true

function getPlayerSkillRatesText(cid)
local skillInfo = getPlayerRates(cid)
return "Rates Info: [ Magic Level: " .. skillInfo[SKILL__MAGLEVEL] * skillConfig.magiclevel .. "x || Attack Speed: " .. skillInfo[SKILL_FIST] * skillConfig.skill .. "x | Weapon: " .. skillInfo[SKILL_CLUB] * skillConfig.skill .. "x |  Sword: " .. skillInfo[SKILL_SWORD] * skillConfig.skill .. "x | Strenght: " .. skillInfo[SKILL_AXE] * skillConfig.skill .. "x |  Ki Blasting: " .. skillInfo[SKILL_DISTANCE] * skillConfig.skill .. " | Defense: " .. skillInfo[SKILL_SHIELD] * skillConfig.skill .. "x ]"
end