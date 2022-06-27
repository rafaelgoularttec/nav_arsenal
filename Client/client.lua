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
"PISTOL", "COMBATPISTOL", "APPISTOL", "STUNGUN", "PISTOL50", "SNSPISTOL", "SNSPISTOLMK2", "HEAVYPISTOL", "VINTAGEPISTOL", "FLAREGUN", "MARKSMANPISTOL",
"RESOLVER", "REVOLVER_MK2", "DOUBLEACTION", "RAYPISTOL", "CERAMICPISTOL", "NAVYREVOLVER", "GADGETPISTOL", "STUNGUN", "MICROSMG",  "SMG", "SMGMK2", "ASSAULTSMG", 
"COMBATPDW", "MACHINEPISTOL", "MINISMG", "RAYCARBINE", "PUMPSHOTGUN", "PUMPSHOTGUNMK2", "SAWNOFFSHOTGUN", "ASSAULTSHOTGUN", "BULLPUPSHOTGUN", "MUSKET", "HEAVYSHOTGUN", 
"DBSHOTGUN", "AUTOSHOTGUN", "COMBATSHOTGUN", "ASSAULTRIFLE", "ASSAULTRIFLEMK2", "CARBINERIFLE", "CARBINERIFLEMK2", "ADVANCEDRIFLE", "SPECIALCARBINE", "SPECIALCARBINEMK2", 
"BULLPUPRIFLE", "BULLPUPRIFLE_MK2", "COMPACTRIGLE", "MILITARYRIFLE", "HEAVYRIFLE", "MG", "COMBATMG", "COMBATMG_MK2", "GUSENBERG", "SNIPERRIFLE", "HEAVYSNIPER", "HEAVYSNIPERMK2", 
"MARKSMANRIFLE", "MARKSMANRIFLEMK2",  "RPG", "GRENADELAUNCHER", "MINIGUN", "FIREWORK", "RAILGUN", "HOMINGLAUNCHER", "COMPACTLAUNCHER", "RAYMINIGUN", "EMPLAUNCHER" }

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