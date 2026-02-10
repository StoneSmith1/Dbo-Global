local message = [[Seja bem vindo!

Utilize o canal help para maiores informações.
Digite !notice ou !news para ver as novidades.

Bom jogo!]]
function onLogin(cid)
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NEW) then
		doPlayerPopupFYI(cid, message)
	end
	return true
end
