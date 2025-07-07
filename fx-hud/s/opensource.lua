-- RegisterCommand('addxp',function(source,args,raw)
--     exports['fx-hud']:addXP(tonumber(args[1]),tonumber(args[2]))
-- end)
-- RegisterCommand('removexp',function(source,args,raw)
--     exports['fx-hud']:removeXP(tonumber(args[1]),tonumber(args[2]))
-- end)
RegisterCommand('getxp',function(source,args,raw)
    exports['fx-hud']:getXP(tonumber(args[1]),function(xp)
        print(xp)
    end)
end)
RegisterCommand('getlevel',function(source,args,raw)
    exports['fx-hud']:getLevel(tonumber(args[1]),function(level)
        print(level)
    end)
end)

RegisterCommand(Config.HealAdminCommand,function(source,args,raw)
    local User = FXGetPlayerData(source)
    local admin = User.admin
    local target = args[1] and args[1] or source
    if admin then
        TriggerClientEvent("fx-hud:client:ForceHeal", target)
    else
        Notify({
            source = source,
            text = "You are not admin !",
            time = 4000,
            type = "error"
        })
    end
end)

local ExpLoopWait = 15 * 60 * 1000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(ExpLoopWait) 
        local players = GetPlayers()

        for _, playerId in ipairs(players) do
            local src = tonumber(playerId)
            addXP(src, 10)
        end
    end
end)

RegisterNetEvent("fx-hud:server:GetDataDeveloper", function()
    local src = source 
    local Character = FXGetPlayerData(src)
    if not Character.admin then
        return Notify({ source = src, text = "You are not admin!", time = 4000, type = "success" })
    end
    GetHudData(src)
end)