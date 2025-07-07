FXRegisterCallback('fx-pedmenu:server:callback:getPlayerComps', function(source, cb)
    local src = source

    if Framework == "RSG" then
        local Character = FXGetPlayerData(src)
        if not Character then return cb(nil) end

        local citizenid = Character.charIdentifier

        exports.oxmysql:execute('SELECT * FROM playerskins WHERE citizenid = ?', { citizenid }, function(result)
            if result and result[1] then
                local skinData = json.decode(result[1].skin or "{}")
                local clothesData = json.decode(result[1].clothes or "{}")
                result[1].skin = skinData
                result[1].clothes = clothesData
                cb(result[1])
            else
                cb(nil)
            end
        end)

    elseif Framework == "VORP" then
        local Character = FXGetPlayerData(src)
        if not Character then return cb(nil) end
        cb(Character.comps)
    end
end)
