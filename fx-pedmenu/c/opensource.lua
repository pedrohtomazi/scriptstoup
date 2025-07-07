

RegisterCommand('pedhair', function (source, args)
    local hair = tonumber(args[1])
    if hair then
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, PlayerPedId(), hair, false)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, PlayerPedId(), currentSkinData.RandomOutfit, true)
    end
end, false)

RegisterCommand('pedoutfit', function(source, args)
    local input = args[1]
    if input then
        changeOutfit(PlayerPedId(), "RandomOutfitPlayer", input)
    end
end, false)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/pedoutfit', 'Change the ped\'s outfit', {
        { name = 'type', help = 'Use + / - to cycle or enter an outfit index (e.g. /pedoutfit +, /pedoutfit -, /pedoutfit 3)' }
    })
    TriggerEvent('chat:addSuggestion', '/pedhair', 'Change the ped\'s hair style', {
        { name = 'hair_index', help = 'Hair style index number' }
    })
end)



local meleeHash = GetHashKey("WEAPON_UNARMED")

local function IsPedKid(ped)
    local model = GetEntityModel(ped)
    for name in pairs(Config.KidPedModels) do
        if model == GetHashKey(name) then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local sleep = 2000

        if IsPedKid(ped) then
            sleep = 100
            local hasWeapon, weaponHash = GetCurrentPedWeapon(ped, false)

            if weaponHash ~= meleeHash then
                if not Config.UseWeaponKidPeds or not Config.whitelistKidWeapons[weaponHash] then
                    SetCurrentPedWeapon(ped, meleeHash, true)
                end
            end
        end

        Wait(sleep)
    end
end)


