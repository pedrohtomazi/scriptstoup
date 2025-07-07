RegisterNetEvent('fx-store:server:buyorSellActions')
AddEventHandler("fx-store:server:buyorSellActions", function(data)
    local src = source
    local moneytype = data.moneytype
    local count = tonumber(data.count)
    local itemName = data.itemName
    local claimedPrice = tonumber(data.price)
    local itemLabel = data.itemLabel
    if not count or count <= 0 then return end
    if not itemName or not claimedPrice or claimedPrice <= 0 then return end

    local itemList = (data.type == "buy" and currentBuyItems or currentSellItems)
    local realPrice = nil

    for _, item in pairs(itemList) do
        if item.itemName == itemName and (item.moneytype == nil or item.moneytype == moneytype) then
            realPrice = tonumber(item.price)
            break
        end
    end

    if not realPrice or realPrice ~= claimedPrice then
        local identifiers = GetPlayerIdentifiers(src)
        local steamHex = "N/A"
        for _, id in ipairs(identifiers) do
            if string.sub(id, 1, 6) == "steam:" then
                steamHex = id
                break
            end
        end

        DropPlayer(src, "Price manipulation or invalid item detected.")

        print(("^1[FX-STORE SECURITY]^0 Player ^3[%s]^0 with Steam Hex ^5[%s]^0 attempted ^1price manipulation^0. Claimed: ^3%s€^0 | Real: ^2%s€^0 | Item: ^3%s^0")
            :format(src, steamHex, claimedPrice or "nil", realPrice or "nil", itemName))
        return
    end

    local totalPrice = count * realPrice
    local money = FXGetPlayerMoney(src, moneytype)

    if data.type == "buy" then
        if money >= totalPrice then
            if FXCanCarry(src, itemName, count) then
                FXRemoveMoney(src, totalPrice, moneytype)
                FXAddItem(src, itemName, count)
                if Config.Log then
                    SendWebhook(src, itemLabel, totalPrice, count, "buy")
                end
                Notify({source = src, text = Locale('additems', {item = itemLabel, count = count}), time = 3000, type = "success"})
            else
                Notify({source = src, text = Locale('carryitem'), time = 3000, type = "error"})
            end
        else
            Notify({source = src, text = Locale('nomoney'), time = 3000, type = "error"})
        end
    else
        FXGetItemCount(src, itemName, function(itemCount)
            if itemCount and itemCount >= count then
                FXRemoveItem(src, itemName, count)
                FXAddMoney(src, totalPrice, moneytype)
                if Config.Log then
                    SendWebhook(src, itemLabel, totalPrice, count, "sell")
                end
                Notify({source = src, text = Locale('yousell', {item = itemLabel, count = count, price = totalPrice}), time = 3000, type = "success"})
            else
                Notify({source = src, text = Locale('noitemcount'), time = 3000, type = "error"})
            end
        end)
    end
end)
