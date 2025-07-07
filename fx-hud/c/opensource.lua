RegisterCommand('getxpclient',function()
    local xp = exports['fx-hud']:getXP()
    print(xp)
end)
RegisterCommand('getlevelclient',function()
    local level = exports['fx-hud']:getLevel()
    print(level)
end)

RegisterCommand('getstatus',function()
    local status = exports['fx-hud']:getStatus("hunger")
    print(status)
end)


-- temp 
-- logged 
-- hunger 
-- thirst 
-- alcohol 
-- stress 

-- Citizen.CreateThread(function()
--     while true do
--         Wait(3000)
--         if not onEdit and logged then
--             print(temp)
--         end
--     end
-- end)

--########### EXAMPLE #######################
-- Citizen.CreateThread(function()
--     while true do
--         Wait(3000)
--         local stress = exports['fx-hud']:getStatus("stress")
--         if stress > 70 then
--             SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0) 
--             SetTimeout(1000, function()
--                 ResetPedRagdollTimer(PlayerPedId())
--             end)
--         end
--     end
-- end)
-- Citizen.CreateThread(function()
--     while true do
--         Wait(3000)
--         print(temp)
--     end
-- end)
-- Example Use Event SERVER SIDE
-- TriggerClientEvent("fx-hud:client:CustomAddStatus", source, "hunger", 50)
RegisterNetEvent("fx-hud:client:CustomAddStatus", function(statusType, value)
    exports['fx-hud']:setStatus(statusType,100)
end)

RegisterCommand('hudload',function()
    if not logged then
        TriggerServerEvent('fx-hud:server:GetDataDeveloper')
    end
end)

local frontend_soundset_ref = "Consumption_Sounds"
local frontend_soundset_name =  "Core_Fill_Up"
--( Params: hunger,thirst,stress,alcohol and Value must be INT)
local function ForceHeal()
    local ped = PlayerPedId()
    local player = PlayerId()
    exports['fx-hud']:setStatus("hunger",100)
    exports['fx-hud']:setStatus("thirst",100)
    exports['fx-hud']:setStatus("stress",-100)-- or -100
    exports['fx-hud']:setStatus("alcohol",-100)-- or -100
    Citizen.InvokeNative(0xE3144B932DFDFF65,ped, 0.0, -1, 1, 1) -- Clean Dirty
    SetAttributeBaseRank(ped,16,0.0)
    SetAttributeBaseRank(ped,17,0.0)
    Citizen.InvokeNative(0xC6258F41D86676E0, ped, 0, 100)  --_SET_ATTRIBUTE_CORE_VALUE
	SetEntityHealth(ped, 600, 1)
	Citizen.InvokeNative(0xC6258F41D86676E0, ped, 1, 100)  --_SET_ATTRIBUTE_CORE_VALUE
	Citizen.InvokeNative(0x675680D089BFA21F, ped, 100.0) -- _RESTORE_PED_STAMINA
    Citizen.InvokeNative(0x4102732DF6B4005F, "RespawnPulseMP01", 0, true)
    Citizen.InvokeNative(0x0F2A2175734926D8,frontend_soundset_name, frontend_soundset_ref)   -- load sound frontend
    Citizen.InvokeNative(0x67C540AA08E4A6F5,frontend_soundset_name, frontend_soundset_ref, true, 0)  -- play sound frontend
    -- Citizen.InvokeNative(0xA9EC16C7,PlayerId(),Citizen.InvokeNative(0xE415EC5C,player)+100) --- Stamina
    SetTimeout(2000,function()
        AnimpostfxStopAll()
        Citizen.InvokeNative(0x9D746964E0CF2C5F,frontend_soundset_name, frontend_soundset_ref)  -- stop audio
    end)
end

RegisterNetEvent("fx-hud:client:ForceHeal", ForceHeal)

RegisterCommand('hidehud',function()
    exports['fx-hud']:hideHud()
end)

RegisterCommand('showhud',function()
    exports['fx-hud']:showHud()
end)


Citizen.CreateThread(function()
    local isHudHidden = false
    local mapOpenedOnce = false

    while true do
        Wait(1)
        local playerPed = PlayerPedId()
        local isPauseMenuActive = IsPauseMenuActive()
        local isMapActive = IsAppActive(`MAP`)

        if isPauseMenuActive and not isHudHidden then
            exports['fx-hud']:hideHud()
            isHudHidden = true
        elseif isMapActive == 1 and not isHudHidden then
            exports['fx-hud']:hideHud()
            isHudHidden = true
            mapOpenedOnce = true
        elseif not isPauseMenuActive and isMapActive == 0 and isHudHidden then
            exports['fx-hud']:showHud()
            isHudHidden = false
            mapOpenedOnce = false
        end
    end
end)

if Config.HudSettings.Hunger.decreaseOnRemoveHealthValue then
    CreateThread(function()
        while true do
            if logged then
                local ped = PlayerPedId()
                if hunger <= 0 then
                    hunger = 0
                    Citizen.InvokeNative(0x4102732DF6B4005F, "MP_HealthDrop", 0, true)
                    PlayPain(ped, 9, 1, true, true)
                    if GetEntityHealth(ped) > 0 then
                        SetEntityHealth(ped, GetEntityHealth(ped) - Config.HudSettings.Hunger.decreaseOnRemoveHealthValue)                    
                    else
                        SetEntityHealth(ped, 0)   
                    end
                    Notify({
                        text = Locale("hungry"),
                        time = 4000,
                        type = "warning"
                    })
                    SetTimeout(2000,function()
                        Citizen.InvokeNative(0xB4FD7446BAB2F394, "MP_HealthDrop")
                    end)
                end 
            end
            Wait(5000)
        end     
    end)
end

if Config.HudSettings.Thirst.decreaseOnRemoveHealthValue then
    CreateThread(function()
        while true do
            if logged then
                local ped = PlayerPedId()
                if thirst <= 0 then
                    thirst = 0
                    Citizen.InvokeNative(0x4102732DF6B4005F, "MP_HealthDrop", 0, true)
                    PlayPain(ped, 9, 1, true, true)
                    if GetEntityHealth(ped) > 0 then
                        SetEntityHealth(ped, GetEntityHealth(ped) - Config.HudSettings.Thirst.decreaseOnRemoveHealthValue)                    
                    else
                        SetEntityHealth(ped, 0)   
                    end
                    Notify({
                        text = Locale("thirsty"),
                        time = 4000,
                        type = "warning"
                    })
                    SetTimeout(2000,function()
                        Citizen.InvokeNative(0xB4FD7446BAB2F394, "MP_HealthDrop")
                    end)
                end 
            end
            Wait(5000)
        end     
    end)
end

if Config.HudSettings.Stress then
    if Config.HudSettings.Stress.speeding then
        Citizen.CreateThread(function() -- Speeding
            while true do
                if logged then
                    local ped = PlayerPedId()
                    -- if IsPedInAnyVehicle(ped, false) then
                    local ent = IsPedInAnyVehicle(ped, false) and GetEntitySpeed(GetVehiclePedIsIn(ped, false)) or GetEntitySpeed(ped)
                    local speed = ent * 2.237 --mph
                    if speed >= Config.HudSettings.Stress.speedingValue then
                        stress = stress + Config.HudSettings.Stress.speedStress or 1.0
                    end
                    -- end
                end
                Wait(1000)
            end
        end)
    end

    if Config.HudSettings.Stress.shooting then
        Citizen.CreateThread(function()
            while true do
                if logged then
                    local ped = PlayerPedId()
                    local random = math.random(1,100)
                    if random <= Config.HudSettings.Stress.shootingchange and IsPedShooting(ped) then
                        stress = stress + Config.HudSettings.Stress.shootingStress or 1.0
                        Wait(2000)
                    end
                end
                Wait(1)
            end
        end)
    end

    CreateThread(function()
        while true do
            local time = 10000
            if logged then
                local ped = PlayerPedId()
                if stress >= 100 then
                    time = time * 3 
                    local FallRepeat = math.random(2, 4)
                    local RagdollTimeout = FallRepeat * 1750
                    ShakeGameplayCam(Config.HudSettings.Stress.ShakeGameplayCam.Effect, Config.HudSettings.Stress.ShakeGameplayCam.Value)
                    if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                        SetPedToRagdollWithFall(ped, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                    end
        
                    Wait(500)
                    for i = 1, FallRepeat, 1 do
                        Wait(750)
                        DoScreenFadeOut(200)
                        Wait(1000)
                        DoScreenFadeIn(200)
                        ShakeGameplayCam(Config.HudSettings.Stress.ShakeGameplayCam.Effect, Config.HudSettings.Stress.ShakeGameplayCam.Value)
                    end
                elseif stress >= Config.HudSettings.Stress.shakeScreenValue then
                    ShakeGameplayCam(Config.HudSettings.Stress.ShakeGameplayCam.Effect, Config.HudSettings.Stress.ShakeGameplayCam.Value)
                end
            end
            Wait(time)
        end
    end)
    ---- STAMINA RAGDOLL
    -- Citizen.CreateThread(function()
    --     while true do
    --         Citizen.Wait(1000) 
    --         if logged then
    --             local ped = PlayerPedId()
    --             local stamina = tonumber(string.format("%.2f", Citizen.InvokeNative(0x775A1CA7893AA8B5, ped, Citizen.ResultAsFloat())))
    --             local chance = math.random(1, 100)
    --             if stamina <= 5 and not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
    --                 if chance <= 10 then
    --                     SetPedToRagdollWithFall(ped, 1500, 1500, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    --                     Wait(2000)
    --                     ResetPedRagdollTimer(ped)
    --                 end
    --             end
    --         end
    --     end
    -- end)
end

-- RegisterNetEvent('vorpmetabolism:snakedamage')
-- AddEventHandler('vorpmetabolism:snakedamage', function(number, number2)
--     exports['fx-hud']:setStatus("hunger", -number)
--     exports['fx-hud']:setStatus("thirst", -number2)
-- end)


Citizen.CreateThread(function()
    while true do
        local sleep = true
        if alcohol > 1 then
            exports['fx-hud']:setStatus("alcohol",-5)
        end
        Wait(15000)
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         -- local getTask = IsPedRunningTaskItemInteraction(PlayerPedId())
--         -- print(getTask) --- 0 or 1
--         -- local getPromptProgress = GetItemInteractionPromptProgress(PlayerPedId(), 0x07B8BEAF)
--         local state = GetItemInteractionState(PlayerPedId())
--         if state ~= 0 then
--             print(state)
--         end
--         Wait(1000)
--     end
-- end)

-- function METABOLISM()
--     exports['fx-hud']:setStatus("thirst", 30)
-- end
-- function WASHFACE()
--     Citizen.InvokeNative(0xE3144B932DFDFF65,PlayerPedId(), 0.0, -1, 1, 1) -- Clean Dirty
--     SetAttributeBaseRank(PlayerPedId(),16,0.0)
--     SetAttributeBaseRank(PlayerPedId(),17,0.0)
-- end
