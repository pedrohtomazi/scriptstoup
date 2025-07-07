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
elseif GetResourceState('redem_roleplay') == 'started' then
    Framework = "REDEMRP"
    LoadTimeout = 5
    onPlayerLoadEvent = ""
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
        local Core = exports.vorp_core:GetCore()

        function FXGetPlayerData(src)
            local User = Core.getUser(src)
            if not User then return false end
            local Character = User.getUsedCharacter
            local array = {
                firstname = Character.firstname,
                lastname = Character.lastname,
                job = Character.job,
                comps = Character.comps,
                charIdentifier = Character.charIdentifier
            }
            return array
        end

        function FXIsAdmin(src)
            local User = Core.getUser(src)
            if not User then return false end 
            local charid = User.getUsedCharacter.charIdentifier
            local admin = User.getGroup == "admin"
            local permissionCharid = { -- Enter the charid of the players you want to authorize here
                ["1"] = true,
                ["12"] = true,
            }
        
            return admin or permissionCharid[charid] 
        end
        
        function FXRegisterCallback(eventName, callBack,...)
            Core.addRpcCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end

    else
        local Core = exports.vorp_core:GetCore()
        function FXTriggerServerCallback(eventName,callBack,...)
            Core.RpcCall(eventName,function(...)
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
    
        function FXIsAdmin(src)
            local admin = RSGCore.Functions.HasPermission(src, "admin")
            return admin
        end
    
        function FXGetPlayerData(src)
            local Player = RSGCore.Functions.GetPlayer(src)
            local array = {
                firstname = Player.PlayerData.charinfo.firstname,
                lastname = Player.PlayerData.charinfo.firstname,
                job = Player.PlayerData.job.name,
                charIdentifier = Player.PlayerData.citizenid
            }
            return array
        end

        function FXRegisterCallback(eventName, callBack,...)
            RSGCore.Functions.CreateCallback(eventName, function(source, cb, ...)
                callBack(source,cb,...)
            end)
        end
    else
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
    
        function FXGetPlayerData(src)
            local array = {}
            TriggerEvent("redemrp:getPlayerFromId", src, function(user)
                array = {
                    firstname = user.getFirstname(),
                    lastname = user.getLastname(),
                    job = user.getJob(),
                    grade = user.getJobgrade(),
                    charIdentifier = user.getSessionVar("charid")
                }
            end)
            return array
        end
    
        function FXIsAdmin(src)
            local admin = false
            TriggerEvent('redemrp:getPlayerFromId', src, function(pg)
                if pg.getGroup() == "admin" or pg.getGroup() == "superadmin" then
                    admin = true
                end
            end)
            return admin
        end
    end
end
