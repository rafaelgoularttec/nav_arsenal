local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
gScriptArsenal = Tunnel.getInterface("nav_arsenal")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("arsenal", function ()
	if gScriptArsenal.Perms() then
	ToggleActionMenu()
	end
end)

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
local armas = { "GRENADE", "MOLOTOV", "PISTOL_MK2", "BZGAS", "STICKYBOMB", "PROXMINE", "SNOWBALL", "PIPEBOMB", "BALL", "SMOKE", "FLARE", "PARACHUTE",
"PISTOL", "COMBATPISTOL", "APPISTOL", "STUNGUN", "PISTOL50", "SNSPISTOL", "SNSPISTOL_MK2", "HEAVYPISTOL", "VINTAGEPISTOL", "FLAREGUN", "MARKSMANPISTOL",
"RESOLVER", "REVOLVER_MK2", "DOUBLEACTION", "RAYPISTOL", "CERAMICPISTOL", "NAVYREVOLVER", "GADGETPISTOL", "STUNGUN", "MICROSMG",  "SMG", "SMG_MK2", "ASSAULTSMG", 
"COMBATPDW", "MACHINEPISTOL", "MINISMG", "RAYCARBINE", "PUMPSHOTGUN", "PUMPSHOTGUN_MK2", "SAWNOFFSHOTGUN", "ASSAULTSHOTGUN", "BULLPUPSHOTGUN", "MUSKET", "HEAVYSHOTGUN", 
"DBSHOTGUN", "AUTOSHOTGUN", "COMBATSHOTGUN", "ASSAULTRIFLE", "ASSAULTRIFLE_MK2", "CARBINERIFLE", "CARBINERIFLE_MK2", "ADVANCEDRIFLE", "SPECIALCARBINE", "SPECIALCARBINE_MK2", 
"BULLPUPRIFLE", "BULLPUPRIFLE_MK2", "COMPACTRIGLE", "MILITARYRIFLE", "HEAVYRIFLE", "MG", "COMBATMG", "COMBATMG_MK2", "GUSENBERG", "SNIPERRIFLE", "HEAVYSNIPER", "HEAVYSNIPER_MK2", 
"MARKSMANRIFLE", "MARKSMANRIFLE_MK2",  "RPG", "GRENADELAUNCHER", "MINIGUN", "FIREWORK", "RAILGUN", "HOMINGLAUNCHER", "COMPACTLAUNCHER", "RAYMINIGUN", "EMPLAUNCHER" }

RegisterNUICallback("ButtonClick",function(data,cb)
    local ped = PlayerPedId()

    if data == "limpar" then RemoveAllPedWeapons(ped, true) end
    if data == "fechar" then ToggleActionMenu() end
    if data == "COLETE" then SetPedArmour(ped,100) end
    -- if data == "PISTOL_MK2" then GiveWeaponToPed(ped, GetHashKey("WEAPON_PISTOL_MK2"), 25, 0, 1) end
    if data == "FIREEXTINGUISHER" then GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREEXTINGUISHER"), 250000, 0, 1) end

		

    for k,v in ipairs(armas) do
        if data == v then
            local rLabel = "WEAPON_"..v
            GiveWeaponToPed(ped, GetHashKey(rLabel), 250, 0, 1)
        end
    end
end)
