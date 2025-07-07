
local invVersion = GetResourceMetadata("rsg-inventory", 'version', 0)
 
Framework = "none"
onPlayerLoadEvent = "none" 
LoadTimeout = 5
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
else
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(2000)
            print("^1[ERROR]^0 No suitable framework found. ^2Please install ^3vorp_core^2 or ^3rsg-core^2.")
            print("^1[ERROR]^0 Make sure to start ^3fx-idcard^0 after the frameworks in your ^2server.cfg^0 file.")
        end
    end)
end 


if Framework == "VORP" then
    if IsDuplicityVersion() then
        --[[
            Server Side
        ]]
        VorpCore = {}

        TriggerEvent("getCore", function(core)
            VorpCore = core
        end)

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

        function FXRemoveItem(src,itemName,itemCount,Metadata)
            if string.sub(itemName, 1, string.len("WEAPON_")) == "WEAPON_" then
                for i=1, itemCount do
                    exports.vorp_inventory:getUserInventoryWeapons(src, function(result)
                        for k,v in pairs(result) do
                        
                            if v.name == itemName then
                                VorpInv.subWeapon(src, v.id)
                                break
                            end
                        end
                    end)
                
                end
            else
                VorpInv.subItem(src, itemName, itemCount, Metadata)
            end
        end

        function FXCanCarry(src,item,count)
            if string.sub(item, 1, string.len("WEAPON_")) == "WEAPON_" then
                return exports.vorp_inventory:canCarryWeapons(src, count, nil, item)
            else
                return VorpInv.canCarryItem(src, item, count)
            end
        end

        function FXAddItem(src,itemName,itemCount,Metadata)
            if string.sub(itemName, 1, string.len("WEAPON_")) == "WEAPON_" then
                for i=1, itemCount do
                    exports.vorp_inventory:createWeapon(src, itemName, {}, {}, {}, function(success)
                    end)
                end
            else
                VorpInv.addItem(src, itemName, itemCount, Metadata)
            end
        end


        function FXRemoveMoney(src,count, moneytype)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            if moneytype == "cash" then
                Character.removeCurrency(0, count)
            else
                Character.removeCurrency(1, count)
            end
        end
        function FXAddMoney(src,count, moneytype)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            if moneytype == "cash" then
                Character.addCurrency(0,count)
            else
                Character.addCurrency(1,count)
            end
        end

        function FXGetItemCount(src,ItemName,cb)
            if string.sub(ItemName, 1, string.len("WEAPON_")) == "WEAPON_" then
                local retval = 0
                exports.vorp_inventory:getUserInventoryWeapons(src, function(result)
                    for k,v in pairs(result) do
                        if v.name == ItemName then
                            retval = retval + 1
                        end
                    end
                    cb(retval)
                end)
            else
                local retval = VorpInv.getItem(src, ItemName)
                cb(retval and retval.count or 0)
            end
        end
        function FXGetPlayerMoney(src, moneytype)
            local User = VorpCore.getUser(src)
            local Character = User.getUsedCharacter
            if moneytype == "cash" then
                return Character.money
            else
                return Character.gold
            end
        end
        function FXGetPlayerData(src)
            local User = VorpCore.getUser(src)
            if not User then return nil end
            local Character = User.getUsedCharacter
            local array = {
                firstname = Character.firstname,
                lastname = Character.lastname,
                job = Character.job,
                grade = Character.jobGrade,
            }
            return array
        end

    else
    --[[
        Client Side
    ]]    

        VorpCore = {}
        TriggerEvent("getCore", function(core)
            VorpCore = core
        end)

        function FXTriggerServerCallback(eventName,callBack,...)
            VorpCore.RpcCall(eventName,function(...)
                callBack(...)
            end,...)
        end
    end
elseif Framework == "RSG" then
    if IsDuplicityVersion() then
        --[[
            Server Side
        ]]
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
    
        function FXCanCarry(src,item,count)
            local Player = RSGCore.Functions.GetPlayer(src)
            local retval = true
            -- if Player.Functions.AddItem(item, count) then
            --     retval = true
            --     Player.Functions.RemoveItem(item, count)
            -- end
            return retval
    
        end
    
        function FXCloseInventory(src)
            TriggerClientEvent("rsg-inventory:client:closeinv", src)
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
            Player.Functions.AddItem(itemName, itemCount,Metadata)
        end
        function FXAddItem(src,itemName,itemCount,Metadata)
            local Player = RSGCore.Functions.GetPlayer(src)
            if invVersion and invVersion:sub(1,1) == "1" then
                Player.Functions.AddItem(itemName, itemCount,Metadata)
            else
                Player.Functions.AddItem(itemName, itemCount, nil, Metadata)
            end
        end

        function FXGetItem(src,ItemName)
            local Player = RSGCore.Functions.GetPlayer(src)
            local founditem = false
            for slot,item in pairs(Player.PlayerData.items) do
                if item.name:lower() == ItemName:lower() then
                    founditem = item
                    break
                end
            end
            return founditem
        end
        function FXRemoveMoney(src,count, moneytype)
            local Player = RSGCore.Functions.GetPlayer(src)
            if moneytype == "cash" then
                Player.Functions.RemoveMoney('cash',count,"fx-store")
            else
                Player.Functions.RemoveMoney('bank',count,"fx-store")
            end
        end
        function FXAddMoney(src,count, moneytype)
            local Player = RSGCore.Functions.GetPlayer(src)
            if moneytype == "cash" then
                Player.Functions.AddMoney('cash',count,"fx-store")
            else
                Player.Functions.AddMoney('bank',count,"fx-store")
            end
        end
        function FXGetItemCount(src,ItemName,cb)
            local Player = RSGCore.Functions.GetPlayer(src)
            local founditem = 0
            for slot,item in pairs(Player.PlayerData.items) do
                if item.name:lower() == ItemName:lower() then
                    founditem = item.amount
                    break
                end
            end
            cb(founditem)
        end
        
        function FXGetPlayerMoney(src,moneytype)
            local Player = RSGCore.Functions.GetPlayer(src)
            if moneytype == "cash" then
                return Player.PlayerData.money['cash']
            else
                return Player.PlayerData.money['bank']
            end
        end
        
        function FXGetPlayerData(src)
            local Player = RSGCore.Functions.GetPlayer(src)
            local array = {
                firstname = Player.PlayerData.charinfo.firstname,
                lastname = Player.PlayerData.charinfo.firstname,
                job = Player.PlayerData.job.name,
                grade = Player.PlayerData.job.grade.level,
            }
            return array
        end
    
    else
    --[[
        Client Side
    ]]    
        RSGCore = exports['rsg-core']:GetCoreObject()
    
        function FXTriggerServerCallback(eventName,callBack,...)
            RSGCore.Functions.TriggerCallback(eventName,function(...)
                callBack(...)
            end,...)
        end
    end
elseif Framework == "REDEMRP" then
    if IsDuplicityVersion() then
        --[[
            Server Side
        ]]
        RedEM = exports["redem_roleplay"]:RedEM()
        
        data = {}
        TriggerEvent("redemrp_inventory:getData",function(call)
            data = call
        end)
        
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
        
        function FXCanCarry(src,item,count)
            return true
        end
        
        function FXAddItem(src,itemName,itemCount,Metadata)
            local ItemData = data.getItem(src, itemName) 
            ItemData.AddItem(itemCount, Metadata)
        end
        
        function FXGetItemCount(src,ItemName, cb)
            local ItemData = data.getItem(src, ItemName) 
            local count = ItemData.ItemAmount
            cb(count)
        end
        function FXRemoveMoney(src,count, moneytype)
            local Player = RedEM.GetPlayer(src)
            if moneytype == "cash" then
                Player.RemoveMoney(count)
            else
                Player.RemoveBankMoney(count)
            end
        end
        function FXAddMoney(src,count, moneytype)
            local Player = RedEM.GetPlayer(src)
            if moneytype == "cash" then
                Player.AddMoney(count)
            else
                Player.AddBankMoney(count)
            end
        end
    
        function FXGetPlayerMoney(src, moneytype)
            local Player = RedEM.GetPlayer(src)
            if moneytype == "cash" then
                return Player.money
            else
                return Player.bankmoney
            end
        end
        function FXGetPlayerData(src)
            local Character = RedEM.GetPlayer(src)
            local array = {
                firstname = Character.firstname,
                lastname = Character.lastname,
                job = Character.job,
                grade = Character.jobgrade,
            }
            return array
        end
    
    else
    --[[
        Client Side
    ]]    
    
        RedEM = exports["redem_roleplay"]:RedEM()
    
        function FXTriggerServerCallback(eventName,callBack,...)
            RedEM.TriggerCallback(eventName,function(...)
                callBack(...)
            end,...)
        end
    end
end    