LoadTimeout = 5 
Framework = "none"
onPlayerLoadEvent = "none" 

if GetResourceState('vorp_core') == 'started' then
    Framework = "VORP"
    onPlayerLoadEvent = "vorp:SelectedCharacter" 
    LoadTimeout = 25
    print("^2[INFO]^0 Framework selected: ^3" .. Framework .. "^0")
elseif GetResourceState('rsg-core') == 'started' then
    Framework = "RSG"
    LoadTimeout = 5
    onPlayerLoadEvent = "RSGCore:Client:OnPlayerLoaded"
    print("^2[INFO]^0 Framework selected: ^3" .. Framework .. "^0")
elseif GetResourceState('redem_roleplay') == 'started' then
    Framework = "REDEMRP"
    onPlayerLoadEvent = "redemrp_charselect:SpawnCharacter" 
    LoadTimeout = 10
    print("^2[INFO]^0 Framework selected: ^3" .. Framework .. "^0")
else
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2000)
            print("^1[ERROR]^0 No suitable framework found. ^2Please install ^3vorp_core^2 or ^3rsg-core^2.")
            print("^1[ERROR]^0 Make sure to start ^3fx-idcard^0 after the frameworks in your ^2server.cfg^0 file.")
        end
    end)
end

if IsDuplicityVersion() then
    if Framework == "VORP" then
        VorpCore = {}

        TriggerEvent("getCore", function(core)
            VorpCore = core
        end)

        --new vorp
        -- local VorpCore = exports.vorp_core:GetCore()
        ----
        VorpInv = {}
        VorpInv = exports.vorp_inventory:vorp_inventoryApi()

        function FXRegisterUsableItem(itemname,callBack)
            VorpInv.RegisterUsableItem(itemname, function(data)
                local array = {
                    source = data.source,
                    item = data.item
                }
                callBack(array)
            end)
        end

        function FXRegisterCallback(eventName, callBack)
            VorpCore.addRpcCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end

        function FXCloseInventory(src)
            VorpInv.CloseInv(src)
        end
        function FXOpenInventory(src, target)
            local data = {
                source = src, 
                target = target, 
                title = "Search inventory",
                -- blacklist = { -- OPTIONAL
                --     water = true, -- item name or weapon name
                -- },
                -- itemsLimit = { -- OPTIONAL
                --     weapons = { itemType = "item_weapon", limit = 1 }, -- how many weapons user is allowed to take
                --     items =   { itemType = "item_standard", limit = 2 }, -- how many items user is allowed to take
                -- },
                -- timeout = 60, -- OPTIONAL in seconds , if enabled when user reaches limits then a timeout is applied so player cant steal for that amount of time if removed then   once limit reached only after restart they can steal again
            }
            exports.vorp_inventory:openPlayerInventory(data)
        end
        function FXRemoveItem(src,itemName,itemCount,Metadata)
            VorpInv.subItem(src, itemName, itemCount, Metadata)
        end

        function FXAddItem(src,itemName,itemCount,Metadata)
            VorpInv.addItem(src, itemName, itemCount, Metadata)
        end

        function FXGetItem(src,ItemName)
            return VorpInv.getItem(src, ItemName)
        end

        function FXGetPlayerData(src)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            local array = {
                firstname = Character.firstname,
                lastname = Character.lastname,
                job = Character.job,
                jobgrade = Character.jobGrade,
                money = Character.money,
                gold = Character.gold,
                comps = Character.comps,
            }
            return array
        end

        function FXRemoveMoney(src,count)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            Character.removeCurrency(0, count)
        end
        function FXRemoveGold(src,count)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            Character.removeCurrency(1, count)
        end
        function FXAddMoney(src,count)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            Character.addCurrency(0,count)
        end
        function FXAddGold(src,count)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            Character.addCurrency(1,count)
        end

        function FXGetPlayerMoney(src)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            return Character.money
        end

        function FXRevive(src)
            TriggerClientEvent('vorp_core:Client:OnPlayerRevive', src)
        end
    elseif Framework == "RSG" then
        RSGCore = exports['rsg-core']:GetCoreObject()

        function FXRegisterUsableItem(itemname,callBack)
            RSGCore.Functions.CreateUseableItem(itemname, function(source,item)
                local array = {
                    source = source,
                    item = item
                }
                array.item.metadata = item.info
                callBack(array)
            end)
        end
        
        function FXRegisterCallback(eventName, callBack)
            RSGCore.Functions.CreateCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end
        
        function FXCloseInventory(src)
            TriggerClientEvent("rsg-inventory:client:closeinv", src)
        end

        function FXOpenInventory(src, target)
            local Player, TargetPlayer = RSGCore.Functions.GetPlayer(src), RSGCore.Functions.GetPlayer(tonumber(target))
            if Player and TargetPlayer then
                exports['rsg-inventory']:OpenInventoryById(src, tonumber(target))
            end
        end
        
        function FXRemoveItem(src,itemName,itemCount,Metadata)
            local Player = RSGCore.Functions.GetPlayer(src)
            local foundslot = false
            for slot,item in pairs(Player.PlayerData.items) do
                if item.name:lower() == itemName:lower() then
                    if Metadata then
                        if item.info.privateID == Metadata.privateID then
                            foundslot = slot
                            break
                        end
                    else
                        foundslot = slot
                        break
                    end
                end
            end
            if not foundslot then return false end
            Player.Functions.RemoveItem(itemName, itemCount,foundslot)
        end
        
        function FXAddItem(src,itemName,itemCount,Metadata)
            local Player = RSGCore.Functions.GetPlayer(src)
            Player.Functions.AddItem(itemName, itemCount,false,Metadata)
        end
        
        function FXGetItem(src,itemName)
            local Player = RSGCore.Functions.GetPlayer(src)
            local founditem = false
            for slot,item in pairs(Player.PlayerData.items) do
                if item.name:lower() == itemName:lower() then
                    founditem = item
                    founditem.metadata = founditem.info
                    break
                end
            end
            return founditem
        end
        
        function FXGetPlayerData(src)
            local Player = RSGCore.Functions.GetPlayer(tonumber(src))
            if not Player then return end
            local array = {
                firstname = Player.PlayerData.charinfo.firstname,
                lastname = Player.PlayerData.charinfo.lastname,
                job = Player.PlayerData.job.name,
                jobgrade = Player.PlayerData.job.grade.level,
                money = Player.PlayerData.money["cash"],
                bank = Player.PlayerData.money["bank"],
                comps = {},
            }
            return array
        end
    
        function FXRemoveMoney(src,count)
            local Player = RSGCore.Functions.GetPlayer(tonumber(src))
            if not Player then return end
            Player.Functions.RemoveMoney('cash',count,"fx-radialmenu")
        end
        function FXAddMoney(src,count)
            local Player = RSGCore.Functions.GetPlayer(tonumber(src))
            if not Player then return end
            Player.Functions.AddMoney('cash',count,"fx-radialmenu")
        end
    
        function FXRevive(src)
            TriggerClientEvent('rsg-medic:client:revive', src)
        end
    elseif Framework == "REDEMRP" then
        RedEM = exports["redem_roleplay"]:RedEM()
    
        data = {}
        TriggerEvent("redemrp_inventory:getData",function(call)
            data = call
        end)
        
        function FXRegisterUsableItem(itemname,callBack)
            RegisterServerEvent("RegisterUsableItem:"..itemname)
            AddEventHandler("RegisterUsableItem:"..itemname, function(source)
                local _source = source
                local ItemData = data.getItem(_source, itemname)
                local array = {
                    source = _source,
                    item = ItemData
                }
                array.item.metadata = ItemData.ItemMeta
    
         
                callBack(array)
            end)
        end
    
        function FXRegisterCallback(eventName, callBack)
            RedEM.RegisterCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end
        
        function FXCloseInventory(src)
            TriggerClientEvent("redemrp_inventory:closeinv", src)
        end
        
        function FXRemoveItem(src,itemName,itemCount,Metadata)
            local ItemData = data.getItem(src, itemName) 
            ItemData.RemoveItem(itemCount, Metadata)
        end
        
        function FXAddItem(src,itemName,itemCount,Metadata)
            local ItemData = data.getItem(src, itemName) 
            local retv = ItemData.AddItem(itemCount, Metadata)
            Wait(1000)
            local ItemDataNew = data.getItem(src, itemName) 
            ItemDataNew.ChangeMeta(Metadata)
        end
        
        function FXGetItem(src,ItemName)
            local ItemData = data.getItem(src, itemName) 
            local founditem = ItemData
    
            founditem.metadata = founditem.ItemMeta
            return founditem
        end
        
        function FXGetPlayerData(src)
            local Player = RedEM.GetPlayer(src)
            local array = {
                firstname = Player.firstname,
                lastname = Player.lastname,
                job = Player.job,
                jobgrade = Player.jobgrade,
                money = Player.money,
                gold = Player.gold,
                bank = Player.bankmoney,
            }
            return array
        end
    
        function FXRemoveMoney(src,count)
            local Player = RedEM.GetPlayer(src)
            Player.RemoveMoney(count)
        end
        function FXAddMoney(src,count)
            local Player = RedEM.GetPlayer(src)
            Player.AddMoney(count)
        end
    
        function FXGetPlayerMoney(src)
            local Player = RedEM.GetPlayer(src)
            return Player.money
        end
    
        function FXRevive(src)
            --- Please put here the functions for revive the player
            --- Example
            --  TriggerClientEvent("redemrp:revive", src)
        end
    end
else
--[[
    Client Side
]]    
    if Framework == "VORP" then
        VorpCore = {}
        TriggerEvent("getCore", function(core)
            VorpCore = core
        end)

        function FXTriggerServerCallback(eventName,callBack,...)
            VorpCore.RpcCall(eventName,function(...)
                callBack(...)
            end,...)
        end

        progressbar = exports.vorp_progressbar:initiate()

        function FXProgress(text,time,callBack,pType,pColor,pSize)
            progressbar.start(text, time, function ()
                callBack()
            end, pType,pColor,pSize)
        end
    elseif Framework == "RSG" then
        RSGCore = exports['rsg-core']:GetCoreObject()


        function FXTriggerServerCallback(eventName,callBack,...)
            RSGCore.Functions.TriggerCallback(eventName,function(...)
                callBack(...)
            end,...)
        end
    
        -- progressbar = exports.progressbar:initiate()
    
        -- function FXProgress(text,time,callBack,pType,pColor,pSize)
        --     progressbar.start(text, time, function ()
        --         callBack()
        --     end, pType,pColor,pSize)
        -- end
        function FXProgress(text, time, callBack, pType, pColor, pSize)
            -- Start the new progress circle
            if lib.progressBar({
                duration = time,
                label = text,
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
            }) then
                callBack()
            end
        end 
    elseif Framework == "REDEMRP" then

        RedEM = exports["redem_roleplay"]:RedEM()

        function FXTriggerServerCallback(eventName,callBack,...)
            RedEM.TriggerCallback(eventName,function(...)
                callBack(...)
            end,...)
        end
    
        progressbar = exports.progressbar:initiate()
    
        function FXProgress(text,time,callBack,pType,pColor,pSize)
            progressbar.start(text, time, function ()
                callBack()
            end, pType,pColor,pSize)
        end
    end
end