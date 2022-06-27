local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")

gScriptArsenal = {}
Tunnel.bindInterface("nav_arsenal", gScriptArsenal)

function gScriptArsenal.Perms()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"Owner") or vRP.hasPermission(user_id,"Armas")
end