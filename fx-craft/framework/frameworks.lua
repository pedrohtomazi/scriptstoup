Framework = "none"
onPlayerLoadEvent = "none" 
LoadTimeout = 5
if GetResourceState('vorp_core') == 'started' then
    Framework = "VORP"
    onPlayerLoadEvent = "vorp:SelectedCharacter" 
    LoadTimeout = 5
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


CurrentBookId = nil

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
     
    function FXRegisterUsableItem(itemName, callBack)
        exports.vorp_inventory:registerUsableItem(itemName, function(data)
            local src = data.source
            local item = data.item
            local metadata = item.metadata or {}
            if type(metadata) ~= "table" then metadata = {} end
    
            if not metadata.craftBookId then
                local randomId = string.format("%04d", math.random(1000, 9999))
                local bookId = "FX-" .. randomId
                metadata.craftBookId = bookId
    
                local now = os.date("*t")
                local dateStr = string.format("%02d/%02d/%04d", now.day, now.month, now.year)
    
                metadata.description =
                    "Craft Book: " .. bookId .. "<br>" ..
                    "Creation Date: <span style='color:#ffe291'>" .. dateStr .. "</span>"
    
                local success = exports.vorp_inventory:setItemMetadata(src, item.id, metadata)
                if not playerBookData[src] then
                    playerBookData[src] = {}
                end
                playerBookData[src].bookId = bookId
            else
                if not playerBookData[src] then
                    playerBookData[src] = {}
                end
                playerBookData[src].bookId = metadata.craftBookId                
            end
            TriggerEvent("fx-craft:server:SenkronData", playerBookData[src])
            callBack({
                source = src,
                item = {
                    name = item.name,
                    label = item.label,
                    metadata = metadata,
                    slot = item.id,
                    count = item.count
                },
                craftBookId = metadata.craftBookId
            })
        end, GetCurrentResourceName())
    end
    
    function FXRegisterCallback(eventName, callBack,...)
        VorpCore.addRpcCallback(eventName, function(source, cb, ...)
            callBack(source,cb,...)
        end)
    end
    
    function FXCloseInventory(src)
        VorpInv.CloseInv(src)
    end
    
    function FXRemoveItem(src,itemName,itemCount,Metadata)
        if string.sub(itemName, 1, string.len("WEAPON_")) == "WEAPON_" or string.sub(itemName, 1, string.len("WEAPON_")) == "weapon_" then
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

    function generateSerialNumber()
        local serialNumber = ""
        for i = 1, 4 do
            serialNumber = serialNumber .. tostring(math.random(0, 9))
        end
        return serialNumber
    end

    function FXAddItem(src,itemName,itemCount, itemLabel,Metadata)
        if string.sub(itemName, 1, string.len("WEAPON_")) == "WEAPON_" or string.sub(itemName, 1, string.len("WEAPON_")) == "weapon_" then
            -- local serial = "PREMIUM-"..generateSerialNumber()
            for i=1, itemCount do
                -- exports.vorp_inventory:createWeapon(src, itemName, {}, {}, {}, function(success)
                -- end,serial,itemLabel)
                exports.vorp_inventory:createWeapon(src, itemName, {}, {}, {}, function(success)
                end)
            end
        else
            VorpInv.addItem(src, itemName, itemCount, Metadata)
        end
    end
    
    function FXGetItemCount(src, ItemName, cb)
        if string.sub(ItemName, 1, 7) == "WEAPON_" then
            exports.vorp_inventory:getUserInventoryWeapons(src, function(weaponData)
                local weaponCount = 0
                for _, weapon in pairs(weaponData) do
                    if weapon.name == ItemName then
                        weaponCount = weaponCount + 1
                    end
                end
                cb(weaponCount or 0)
            end)
        else
            local retval = exports.vorp_inventory:getUserInventoryItems(src)
            if not retval then
                cb(0)
                return
            end
            
            local itemCount = 0
            for key, value in pairs(retval) do
                if value.name == ItemName then
                    itemCount = itemCount + value.count
                end
            end
            
            cb(itemCount)
        end
    end
    

    function FXCanCarry(src,item,count)
        if string.sub(item, 1, string.len("WEAPON_")) == "WEAPON_" or string.sub(item, 1, string.len("WEAPON_")) == "weapon_" then
            return exports.vorp_inventory:canCarryWeapons(src, count, nil, item)
        else
            return VorpInv.canCarryItem(src, item, count)
        end
    end
    
    function FXGetPlayerData(src)
        local User = VorpCore.getUser(src)
        local array = {}
        if not User then
            return array
        end
        local Character = User.getUsedCharacter
        array = {
            firstname = Character.firstname,
            lastname = Character.lastname,
            job = Character.job,
            grade = Character.jobGrade,
            charid = Character.charIdentifier
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

        local invVersion = GetResourceMetadata("rsg-inventory", 'version', 0)

        function FXRegisterUsableItem(itemName, callBack)
            RSGCore.Functions.CreateUseableItem(itemName, function(source, item)
                local Player = RSGCore.Functions.GetPlayer(source)
                if not Player then return end
        
                local items = Player.PlayerData.items
                local foundSlot = nil
        
                if not item.info or not item.info.craftBookId then
                    local randomId = string.format("%04d", math.random(1000, 9999))
                    local bookId = "FX-" .. randomId
                    local now = os.date("*t")
                    local dateStr = string.format("%02d/%02d/%04d", now.day, now.month, now.year)
        
                    local newMeta = {
                        craftBookId = bookId, 
                        description = "Creation Date: <span style='color:#ffe291'>" .. dateStr .. "</span>"
                    }

        
                    if item.amount and item.amount > 1 then
                        Player.Functions.RemoveItem(item.name, 1, item.slot)
                        Wait(50)
                        Player.Functions.AddItem(item.name, 1, false, newMeta)
                    else
                        for slot, v in pairs(items) do
                            if v.name == item.name and v.slot == item.slot then
                                items[slot].info = newMeta
                                foundSlot = slot
                                break
                            end
                        end
                        if foundSlot then
                            Player.Functions.SetPlayerData("items", items)
                        end
                    end
        
                    CurrentBookId = bookId
                else
                    CurrentBookId = item.info.craftBookId
                end
        
                currentCraftCoord = false
        
                callBack({
                    source = source,
                    item = {
                        name = item.name,
                        label = item.label or item.name,
                        metadata = item.info,
                        slot = item.slot,
                        count = item.amount or item.count or 1
                    },
                    craftBookId = item.info and item.info.craftBookId
                })
            end)
        end
        
        
        function FXRegisterCallback(eventName, callBack,...)
            RSGCore.Functions.CreateCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end
    
        function FXCanCarry(src,item,count)
            local canAdd, reason = exports['rsg-inventory']:CanAddItem(src, item,count)
            if canAdd then
                return true
            else
                return false
            end
        end
    
        function FXGetItemCount(src, ItemName, cb)
            local Player = RSGCore.Functions.GetPlayer(src)
            if not Player or not Player.PlayerData or not Player.PlayerData.items then
                cb(0)
                return
            end
            local foundItem = 0
            for _, item in pairs(Player.PlayerData.items) do
                if item.name and item.name:lower() == ItemName:lower() then
                    foundItem = item.amount
                    break
                end
            end
            cb(foundItem or 0)
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
        
        function FXAddItem(src,itemName,itemCount, itemLabel,Metadata)
            local Player = RSGCore.Functions.GetPlayer(src)
            exports['rsg-inventory']:AddItem(src, itemName, itemCount, false, Metadata, 'fx-craft:FXAddItem')
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
    
        function FXGetPlayerData(src)
            local Player = RSGCore.Functions.GetPlayer(src)
            local array = {
                firstname = Player.PlayerData.charinfo.firstname,
                lastname = Player.PlayerData.charinfo.firstname,
                job = Player.PlayerData.job.name,
                grade = Player.PlayerData.job.grade.level,
                charid = Player.PlayerData.citizenid,
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
end
