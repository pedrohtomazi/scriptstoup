

function CheaterPlayer(src, txt)
    DropPlayer(src, txt)
    -- You can perform the desired operation by editing this function.
end

function hasRequiredJob(src, Jobs)
    local Character = FXGetPlayerData(src)
    if not Jobs or (Jobs[Character.job] and Jobs[Character.job] <= Character.grade) then
        return true
    end
    return false
end

RegisterNetEvent("fx-craft:server:OpenBook", function(Jobs, data, image, bookName, bookID)
    local src = source
    local ped = GetPlayerPed(src)
    if not playerBookData[src] then
        playerBookData[src] = {}
    end
    playerBookData[src].bookId = bookID
    playerBookData[src].currentCraftData = data

    if hasRequiredJob(src, Jobs) then
        TriggerClientEvent("fx-craft:client:OpenBook", src, data, image, Jobs)
        TriggerClientEvent("fx-craft:client:ChangeBookState", src, true)
    else
        TriggerClientEvent("fx-craft:client:ChangeBookState", src, false)
        Notify({
            text = Locale('dont_have_perm'),
            time = 4000,
            type = "error",
            source = src,
        })
    end
end)

RegisterNetEvent("fx-craft:server:setCurrentData", function(data)
    local src = source
    if not playerBookData[src] then
        playerBookData[src] = {}
    end
    playerBookData[src].currentCraftData = data
end)


for itemName, bookData in pairs(Config.ItemCraftBooks) do
    FXRegisterUsableItem(itemName, function(data)
        local src = data.source
        local Character = FXGetPlayerData(src)
        local DefaultImage = bookData.bookImage or "/ui/assets/img/craftman.png"
        local Jobs = bookData.Jobs
        local CraftData = bookData.craftData

        FXCloseInventory(src)
        if Jobs then
            if type(Jobs) == "table" and not hasRequiredJob(src, Jobs) then
                return Notify({
                    text = Locale('dont_have_perm'),
                    time = 4000,
                    type = "error",
                    source = src,
                })
            end
        end

        TriggerClientEvent("fx-craft:client:OpenBook", src, CraftData, DefaultImage, Jobs)
    end)
end




function sendWebhook(src, totalCrafts, craftXP, craftLevel, craftedItem, itemCount)
    local ids = {steam = "", ip = "", discord = "", license = "", xbl = "", live = ""}

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam") then
            ids.steam = id
        elseif string.find(id, "ip") then
            ids.ip = id
        elseif string.find(id, "discord") then
            ids.discord = id
        elseif string.find(id, "license") then
            ids.license = id
        elseif string.find(id, "xbl") then
            ids.xbl = id
        elseif string.find(id, "live") then
            ids.live = id
        end
    end

    local avatar = Config.Webhook.logo
    local steamHex = ids.steam ~= "" and tonumber(ids.steam:gsub("steam:", ""), 16) or 0
    local discordID = ids.discord ~= "" and ids.discord:gsub("discord:", "") or "N/A"
    local steamProfile = steamHex ~= 0 and string.format("https://steamcommunity.com/profiles/%d", steamHex) or "N/A"
    local playerName = GetPlayerName(src) or "Unknown"
    local rockstarID = ids.license ~= "" and ids.license or "N/A"

    totalCrafts = totalCrafts or 0
    craftLevel = craftLevel or 0
    craftXP = craftXP or 0
    craftedItem = craftedItem or "Unknown Item"
    itemCount = itemCount or 1

    local title = "**Crafting Log** 🔨"
    local description = string.format(
        "**Player Information:**\n\n" ..
        "**Player Name:** [%d] %s\n" ..
        "**Discord:** <@%s>\n" ..
        "**Steam Hex:** %s\n" ..
        "**Steam Profile:** %s\n" ..
        "**Rockstar ID:** %s\n\n" ..
        "**Crafting Stats:**\n" ..
        "**Total Crafts:** %d\n" ..
        "**Crafting Level:** %d\n" ..
        "**Craft XP:** %d\n" ..
        "**Crafted Item:** %s (x%d)\n",
        tonumber(src) or 0,
        playerName,
        discordID,
        ids.steam ~= "" and ids.steam or "N/A",
        steamProfile,
        rockstarID,
        totalCrafts,
        craftLevel,
        craftXP,
        craftedItem,
        itemCount
    )

    local embedData = {
        {
            ['title'] = title,
            ['color'] = Config.Webhook.color,
            ['footer'] = {
                ['text'] = 'Fixitfy Studio - FX-Craft',
            },
            ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ'),
            ['description'] = description,
            ['image'] = {
                ['url'] = Config.Webhook.banner,
            },
            ['author'] = {
                ['name'] = 'FX-Craft',
                ['icon_url'] = Config.Webhook.logo,
            },
        }
    }

    if not Config.Webhook.url or Config.Webhook.url == "" then
        print("[ERROR] Webhook URL is not configured!")
        return
    end
    PerformHttpRequest(Config.Webhook.url, function() end, 'POST', json.encode({ username = 'Fixitfy Logger', avatar_url = avatar, embeds = embedData}), { ['Content-Type'] = 'application/json' })
end