local prompts = GetRandomIntInRange(0, 0xffffff)
local movements = {} 
local BlipIndex = {}
OpenBook = false
local keysTable = {
    {Locale("promptlabel"), 0x760A9C6F}, -- 1
}

local cam = nil

RegisterNetEvent("fx-craft:client:startHandCraft", function(data, duration, fastCraftProp, handCraftAnims)
    local durationMs = duration * 1000

    SendNUIMessage({
        action = 'startHandCraft',
        duration = durationMs,
        text = data.itemLabel .. " Crafting.." or "Crafting...",
        image = data.itemName and (Config.Framework == "RSG" and ("nui://rsg-inventory/html/images/" .. data.itemName .. ".png") or ("nui://vorp_inventory/html/img/items/" .. data.itemName .. ".png")) or ""
    })

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local forward = GetEntityForwardVector(ped)

    local spawnX = coords.x + (forward.x * 0.7)
    local spawnY = coords.y + (forward.y * 0.7)
    local spawnZ = coords.z

    local bag
    if fastCraftProp then
        bag = CreateObjectNoOffset(GetHashKey(fastCraftProp), spawnX, spawnY, spawnZ, true, true, false)
        PlaceObjectOnGroundProperly(bag)
        FreezeEntityPosition(bag, true)
    end

    FreezeEntityPosition(ped, true)

    local interior = GetInteriorFromEntity(PlayerPedId())
    if not interior ~= 0 then 
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

        -- 3 metre sağ-arka-yukarıdan bakış (sağ = +x, arka = -y, yukarı = +z)
        local camOffset = GetOffsetFromEntityInWorldCoords(ped, 4.0, -3.0, 1.6)
        SetCamCoord(cam, camOffset.x, camOffset.y, camOffset.z)
        
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.6, true)
        
        SetCamFov(cam, 60.0) 
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 1000, true, false)
        ShakeCam(cam, "HAND_SHAKE", 0.1)
    end

    if handCraftAnims then
        local dicts = handCraftAnims
    
        CreateThread(function()
            local ped = PlayerPedId()
            local loopIndex = 1
            local startTime = GetGameTimer()
        
            while (GetGameTimer() - startTime < durationMs) do
                local anim = dicts[loopIndex]
        
                RequestAnimDict(anim.dict)
                while not HasAnimDictLoaded(anim.dict) do Wait(10) end
        
                TaskPlayAnim(ped, anim.dict, anim.anim, 2.0, -2.0, anim.dur, 1, 0, false, 0, false, 0, false)
        
                Wait(anim.dur)
        
                loopIndex = loopIndex + 1
                if loopIndex > #dicts then
                    loopIndex = 1
                end
            end
        end)    
    end

    SetTimeout(durationMs, function()
        if bag and DoesEntityExist(bag) then DeleteEntity(bag) end
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)

        if cam then
            RenderScriptCams(false, true, 1000, true, false)
            DestroyCam(cam, false)
            cam = nil
        end

        TriggerServerEvent("fx-craft:server:finishHandCraft", data)
    end)

    CreateThread(function()
        while true do
            Wait(500)
            if IsPedDeadOrDying(ped) then
                if bag and DoesEntityExist(bag) then DeleteEntity(bag) end
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                if cam then
                    RenderScriptCams(false, true, 1000, true, false)
                    DestroyCam(cam, false)
                    cam = nil
                end

                -- Notify({ text = Locale("craftcancelled"), type = "error" })
                return
            end
        end
    end)
end)


--- PRESS CRAFT BTN ---
RegisterNUICallback('craftItem',function(data)
    if tonumber(data.amount) < 1 then
        data.amount = 1
    end
    -- Your code
    TriggerServerEvent('fx-craft:server:craftItem',data)
end)

Citizen.CreateThread(function()
    Citizen.Wait(10)
    for _, keyData in pairs(keysTable) do
        local str = "TEST"
        local movement = PromptRegisterBegin() 
        PromptSetControlAction(movement, keyData[2])
        str = CreateVarString(10, 'LITERAL_STRING', keyData[1])
        PromptSetText(movement, str)
        PromptSetEnabled(movement, 1)
        PromptSetVisible(movement, 1)
        PromptSetStandardMode(movement,1)
        PromptSetGroup(movement, prompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C,movement,true)
        PromptRegisterEnd(movement)
        table.insert(movements, movement) 
        --PromptSetMashMode(movements[3], 50)
        PromptSetHoldMode(movements[_], 1000)
        PromptRegisterEnd(movements[_])
    end
end)

RegisterNetEvent("fx-craft:client:OpenBook", function(data,image, jobs)
    TriggerServerEvent("fx-craft:server:setCurrentData", data)
    openCraftBook(data,image, jobs) 
    --[[
        You can duplicate the config file so that different combinations of different craft items will appear.
    ]]
end)


local function SetFramework()
    SendNUIMessage({
        action = 'setFramework',
        framework = Framework,
    })
end

-- RegisterCommand('craft',function()
--     openCraftBook(Config.CraftItems,Config.DefaultImage) 
-- end)

RegisterNetEvent("fx-craft:client:ChangeBookState", function(val)
    OpenBook = val
end)

Citizen.CreateThread(function()
    Wait(2000)
    SetFramework()
    while true do
        local sleep = true
        for k,v in pairs(Config.CraftBooks) do
            local data = v.Settings
            local coords = data.coords
            for i=1, #coords do
                local pCoord = GetEntityCoords(PlayerPedId())
                local dist = #(vector3(pCoord.x, pCoord.y, pCoord.z) - vector3(coords[i].x, coords[i].y, coords[i].z))
                if dist <= data.distance then
                    sleep = false
                    if data.bookTimeSettings.isOpen and not OpenBook then
                        local title = CreateVarString(10, 'LITERAL_STRING', data.promptitle)
                        PromptSetActiveGroupThisFrame(prompts, title)
                        if PromptHasHoldModeCompleted(movements[1]) then
                            Wait(200)
                            if data.bookTimeSettings.isOpen then
                                local craftdata = v.Categories
                                local jobs = data.joblocked
                                OpenBook = true
                                TriggerServerEvent("fx-craft:server:OpenBook", jobs, craftdata,data.image, k, v.bookID)
                            else
                                Notify({
                                    text = Locale("bookisclose"),
                                    time = 3000,
                                    type = "error",
                                })
                            end 
                        end
                    end
                end
            end
        end
        if sleep then
            Wait(2000)
        end
        Wait(1)
    end
end)



local function spawnPed(v,coords)
    local modelHash = GetHashKey(v.model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(10)
    end
    local npc = CreatePed(modelHash, coords.x, coords.y, coords.z-1, coords.w, false, 0)
    SetEntityCoords(npc, coords.x, coords.y, coords.z-1)
    FreezeEntityPosition(npc, true)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    SetEntityCanBeDamaged(npc, false)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetModelAsNoLongerNeeded(modelHash)
    SetEntityAsMissionEntity(npc, true, true)
    if v.pedScenario and not Citizen.InvokeNative(0xAA135F9482C82CC3, npc, v.pedScenario) then
        TaskStartScenarioInPlace(npc, GetHashKey(v.pedScenario), 0, true, false, false, false)
    elseif v.anim.animDict and v.anim.animName then
        RequestAnimDict(v.anim.animDict)
        while not HasAnimDictLoaded(v.anim.animDict) do
            Citizen.Wait(100)
        end
        TaskPlayAnim(npc, v.anim.animDict, v.anim.animName, 1.0, -1.0, -1, 1, 0, true, 0, false, 0, false)
    end
    return npc
end

local function IsMarketCanOpen(settings)
    if not settings then
        return true
    end
    if not settings.allowed then
        return true
    end
    local time = GetClockHours()
    return time >= settings.open and time <= settings.close
end


local function spawnBlip(v, index, status, k)
    local currentHour = GetClockHours()
    local isWithinAllowedHours = not v.bookTimeSettings.allowed or (currentHour >= v.bookTimeSettings.open and currentHour < v.bookTimeSettings.close)
    
    if index then
        if not v.bookTimeSettings.blip then
            v.bookTimeSettings.blip = {}
        end
        if v.bookTimeSettings.blip[index] then
            if isWithinAllowedHours then
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip[index], joaat(v.blipmodifier))
            else
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip[index], joaat(v.bookTimeSettings.blipmodifier))
            end
        else
            v.bookTimeSettings.blip[index] = N_0x554d9d53f696d002(1664425300, v.coords[index].x, v.coords[index].y, v.coords[index].z)
            Citizen.InvokeNative(0x0DF2B55F717DDB10, v.bookTimeSettings.blip[index], false)
            if isWithinAllowedHours then
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip[index], joaat(v.blipmodifier))
            else
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip[index], joaat(v.bookTimeSettings.blipmodifier))
            end
            SetBlipSprite(v.bookTimeSettings.blip[index], v.blipsprite, 1)
            SetBlipScale(v.bookTimeSettings.blip[index], v.blipscale)
            Citizen.InvokeNative(0x9CB1A1623062F402, v.bookTimeSettings.blip[index], v.blipname)
            v.bookTimeSettings.blip[index] = v.bookTimeSettings.blip[index]
        end
    else
        if v.bookTimeSettings.blip then
            if isWithinAllowedHours then
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip, joaat(v.blipmodifier))
            else
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip, joaat(v.bookTimeSettings.blipmodifier))
            end
        else
            v.bookTimeSettings.blip = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
            Citizen.InvokeNative(0x0DF2B55F717DDB10, v.bookTimeSettings.blip, false)
            if isWithinAllowedHours then
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip, joaat(v.blipmodifier))
            else
                Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip, joaat(v.bookTimeSettings.blipmodifier))
            end
            SetBlipSprite(v.bookTimeSettings.blip, v.blipsprite, 1)
            SetBlipScale(v.bookTimeSettings.blip, v.blipscale)
            Citizen.InvokeNative(0x9CB1A1623062F402, v.bookTimeSettings.blip, v.blipname)
            v.bookTimeSettings.blip = v.bookTimeSettings.blip
        end
    end
end


local function firstload()
    local coords = GetEntityCoords(PlayerPedId())
    for k,val in pairs(Config.CraftBooks) do
        local v = val.Settings
        if type(v.coords) == "table" then
            for i = 1, #v.coords do
                if v.showblip then
                    spawnBlip(v,i,true,k)
                end
            end
        else
            if v.showblip then
                spawnBlip(v,nil,true,k)
            end
        end
    end
end
CreateThread(function()
    firstload()
    while true do
        local sleep = 2000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,val in pairs(Config.CraftBooks) do
            local v = val.Settings
            if type(v.coords) == "table" then
                if not v.NPC then
                    v.NPC = {}
                end  
                if not v.bookTimeSettings.blip then
                    v.bookTimeSettings.blip = {}
                end  
                for i = 1, #v.coords do
                    local dist = #(coords-vector3(v.coords[i].x,v.coords[i].y,v.coords[i].z))
                    if IsMarketCanOpen(v.bookTimeSettings) then
                        if v.ped then
                            if (dist < Config.pedSpawnDistance and not v.NPC[i]) then
                                v.NPC[i] = spawnPed(v,v.coords[i])
                                v.bookTimeSettings.isOpen = true
                            end
                        elseif dist < Config.pedSpawnDistance then
                            v.bookTimeSettings.isOpen = true
                        end
                        if v.showblip then
                            spawnBlip(v,i,true,k)
                        end
                    else
                        v.bookTimeSettings.isOpen = nil
                        if v.ped then
                            DeletePed(v.NPC[i])
                            v.NPC[i] = nil
                        end
                        if v.showblip then
                            Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip[i], joaat(v.bookTimeSettings.blipmodifier))
                        end
                    end
                    if v.ped then
                        if dist >= Config.pedSpawnDistance and v.NPC[i] then
                            if v.showblip then
                                spawnBlip(v,i,false,k)
                            end
                            DeletePed(v.NPC[i])
                            v.NPC[i] = nil
                        end
                    elseif dist >= Config.pedSpawnDistance then
                        if v.showblip then
                            spawnBlip(v,i,false,k)
                        end
                    end
                end
            else
                local dist = #(coords-vector3(v.coords.x,v.coords.y,v.coords.z))
                if IsMarketCanOpen(v.bookTimeSettings) then
                    if v.showblip then
                        spawnBlip(v,nil,true,k)
                    end
                    if v.ped then
                        if (dist < Config.pedSpawnDistance and not v.NPC) then
                            v.NPC = spawnPed(v,v.coords)
                            v.bookTimeSettings.isOpen = true
                        end
                    elseif dist < Config.pedSpawnDistance then
                        v.bookTimeSettings.isOpen = true
                    end
                else
                    v.bookTimeSettings.isOpen = nil
                    if v.showblip then
                        Citizen.InvokeNative(0x662D364ABF16DE2F, v.bookTimeSettings.blip, joaat(v.bookTimeSettings.blipmodifier))
                    end
                    if v.ped then
                        DeletePed(v.NPC)
                        v.NPC = nil
                    end
                end
                if v.ped then
                    if dist >= Config.pedSpawnDistance and v.NPC then
                        if v.showblip then
                            spawnBlip(v,nil,false,k)
                        end
                        DeletePed(v.NPC)
                        v.NPC = nil
                    end
                elseif dist >= Config.pedSpawnDistance then
                    if v.showblip then
                        spawnBlip(v,nil,false,k)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

--- Prop Interaction

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local sleep = true
        local ped = PlayerPedId()
        local pedcoord = GetEntityCoords(ped)

        for propName, config in pairs(Config.PropCraftBook) do
            local obj = GetClosestObjectOfType(pedcoord.x, pedcoord.y, pedcoord.z, 2.0, GetHashKey(propName), false, false, false)
            
            if obj and obj ~= 0 then
                local propCoord = GetEntityCoords(obj)
                local distance = #(pedcoord - propCoord)

                if distance <= 2.0 and not OpenBook then
                    sleep = false
                    local title = CreateVarString(10, 'LITERAL_STRING', "Craft")
                    PromptSetActiveGroupThisFrame(prompts, title)

                    if PromptHasHoldModeCompleted(movements[1]) then
                        Wait(100)
                        OpenBook = true
                        TriggerServerEvent("fx-craft:server:OpenBook", config.Jobs, config.craftData, config.bookImage, propName, propName)
                    end
                end
            end
        end

        if sleep then
            Wait(1500)
        end
    end
end)



AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k,v in pairs(Config.CraftBooks) do
        local data = v.Settings
        for i=1, #data.NPC do
            DeletePed(data.NPC[i]) 
        end
        for i=1, #data.bookTimeSettings.blip do
            RemoveBlip(data.bookTimeSettings.blip[i])
        end
    end
    if cam then
        RenderScriptCams(false, true, 1000, true, false)
        DestroyCam(cam, false)
        cam = nil
    end
end)