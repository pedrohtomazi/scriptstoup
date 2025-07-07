RegisterNetEvent('fx-radialmenu:startRob',function(target)
    TriggerServerEvent('fx-radialmenu:openINV',target)
    -- if VorpCore then
    --     -- vorp
    --     TriggerServerEvent('fx-radialmenu:openINV',target)
    -- elseif RSGCore then
    --     -- rsg
    --     TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", target)
    -- end
end)

RegisterNetEvent('fx-radialmenu:cl:searchsheriffmoney',function()
    TriggerEvent('fx-radialmenu:client:searchmoney',true)
end)

RegisterNetEvent("fx-radialmenu:client:sheriffsearch")
AddEventHandler('fx-radialmenu:client:sheriffsearch', function(data)
    local progress = Config.RobPlayer.robberyprogress and Config.RobPlayer.robberyprogress or 5000
    local player = PlayerPedId()
    local closestPlayer, closestDistance = GetClosestPlayer()
    local targetPed = GetPlayerPed(closestPlayer)
    if closestPlayer ~= -1 and closestDistance <= 2.0 then
        local isDead = IsEntityDead(player)
        local isDeadTarget = IsEntityDead(targetPed)
        local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, targetPed)
        local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, targetPed)
        local targetId = GetPlayerServerId(closestPlayer)
        if not isDead and ((isDeadTarget and Config.LootDead) or ((Config.RobPlayer.Handsup and IsEntityPlayingAnim(targetPed, Config.RobPlayer.HandsupAnimDict, Config.RobPlayer.HandsupAnim, 3)) or handcuffed or hogtied) or data.force) then
            FXProgress(Locale('robberyprogress'), progress, function ()
                TriggerServerEvent('fx-radialmenu:openINV',targetId)
            end, Config.progresstype, Config.progressbarcolor, '20vw')
        else
            Notify({
                text=Locale("norobbing"),
                time=4000,
                type="error",
            })
        end
    else
        Notify({
            text=Locale("notnear"),
            time=4000,
            type="error",
        })
    end
end)

---- Rob Money ---

RegisterNetEvent("fx-radialmenu:server:CheckMoney")
AddEventHandler("fx-radialmenu:server:CheckMoney", function(data, target)
    local cash = data.cash or 0
    local gold = data.gold or 0
    
    local dialog = exports['fx-input']:ShowInput({
        header = 'Target Player ID: ' .. target,
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                name = 'cash',
                text = 'Player Cash: '..cash..' $',
                isRequired = false,
            },
            {
                type = 'number',
                name = 'gold',
                text = 'Player Gold: '..gold..' Gold',
                isRequired = false,
            }
        }
    })

    if dialog then
        dialog.gold = tonumber(dialog.gold) or 0
        dialog.cash = tonumber(dialog.cash) or 0
        
        if dialog.cash > 0 then
            TriggerServerEvent('fx-radialmenu:server:TakePlayerCash', dialog.cash, target)
        end
        
        if dialog.gold > 0 then
            TriggerServerEvent('fx-radialmenu:server:TakePlayerGold', dialog.gold, target)   
        end
    end
end)

RegisterNetEvent("fx-radialmenu:client:searchmoney")
AddEventHandler('fx-radialmenu:client:searchmoney', function(force)
    local progress = 5000
    local player = PlayerPedId()
    local closestPlayer, closestDistance = GetClosestPlayer()
    local targetPed = GetPlayerPed(closestPlayer)
    if type(force) ~= "boolean" then
        force = false
    end
    if closestPlayer ~= -1 and closestDistance <= 2.0 then
        local isDead = IsEntityDead(player)
        local isDeadTarget = IsEntityDead(targetPed)
        local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, targetPed)
        local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, targetPed)
        local targetId = GetPlayerServerId(closestPlayer)
        if force or (not isDead and ((isDeadTarget and Config.LootDead) or ((Config.RobPlayer.Handsup and IsEntityPlayingAnim(targetPed, Config.RobPlayer.HandsupAnimDict, Config.RobPlayer.HandsupAnim, 3)) or handcuffed or hogtied))) then
            FXProgress(Locale('robberyprogress'), progress, function ()
                TriggerServerEvent('fx-radialmenu:server:CheckMoney', targetId)
            end, Config.progresstype, Config.progressbarcolor, '20vw')
        else
            Notify({
                text=Locale("norobbing"),
                time=4000,
                type="error",
            })
        end
    else
        Notify({
            text=Locale("notnear"),
            time=4000,
            type="error",
        })
    end
end)
