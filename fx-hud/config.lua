Config = {}
Config.Language = "en"
Config.Locale = {
    ["en"] = {
        ["loaded"] = "Hud data loaded!", 
        ["saved"] = "Hud data saved!", 
        ["coldmessage"] = "It's cold, you're cold!", 
        ["hotmessage"] = "It's so hot, you're burning up!", 
        ["onlyhorse"] = "You can only use it on a horse!", 
        ["hungry"] = "You're hungry!", 
        ["thirsty"] = "You're thirsty!", 
        ["usableitem"] = "Bon Appetit!", 
        ["promptsmoketitle"] = "Smoking Interaction", 
        ["stopsmoking"] = "Stop Smoking", 
        ["smoke"] = "Smoke", 
        ["stance"] = "Stance", 
        ["dragmessage"] = "You can change the location of the huds by dragging them with the mouse!", 
        ["remainingUsage"] = "Remaining Usage: ${val}",
        ["bandage"] = "Using bandages..",
        ["itemIsDegradable"] = "${label} is spoilt and unusable",
        ["notuniqueItem"] = "Item Name: ${itemName}, since this item is not set as unique, the usageLimit property cannot be used. Notify the server owner.",
        ["animationinprogress"] = "You cannot use another item while you have an active animation!",
    },
    ["de"] = {
        ["loaded"] = "HUD-Daten geladen!",
        ["saved"] = "HUD-Daten gespeichert!", 
        ["coldmessage"] = "Es ist kalt, du frierst!",
        ["hotmessage"] = "Es ist sehr heiß, du schwitzt!",
        ["onlyhorse"] = "Das geht nur bei einem Pferd!",
        ["hungry"] = "Du bist hungrig!",
        ["thirsty"] = "Du bist durstig!",
        ["usableitem"] = "Guten Appetit!",
        ["promptsmoketitle"] = "Interaktion Rauchen",
        ["stopsmoking"] = "Aufhören zu rauchen",
        ["smoke"] = "Rauchen",
        ["stance"] = "Haltung", 
        ["dragmessage"] = "Du kannst die Position der HUDs ändern, indem Du sie mit der Maus verschiebst!", 
        ["remainingUsage"] = "Remaining Usage: ${val}",
        ["bandage"] = "Using bandages..",
        ["itemIsDegradable"] = "${label} is spoilt and unusable",
        ["notuniqueItem"] = "Item Name: ${itemName}, since this item is not set as unique, the usageLimit property cannot be used. Notify the server owner.",
        ["animationinprogress"] = "You cannot use another item while you have an active animation!",
    }
}

Config.DisableNumbersAboveCores = false -- NEW!!!
Config.HealAdminCommand = "heal" -- /heal id or /heal
Config.DegreeUnit = "C" -- OR F (Temp Setting)
Config.DefaultHudSettings = '[]' -- NEW !! --- check sql fx_hud copy paste -- 'pastedata'
Config.HudMenuCommand = "hudmenu"
Config.VoiceRangeChangeUi = true ---The ui that appears above the character when the volume changes
Config.UseMapCode = true        -- If there is a map setting in another script, set it to false. For example, if vorp_core's script works
Config.mapTypeOnFoot = 0        -- Radar type when on foot. 0 = Off, 1 = Regular, 2 = Expanded, 3 = Simple (compass).
Config.mapTypeOnMount = 1       -- Radar type when on horse. Same options as on foot.
Config.SaveStatusInterval = 3 -- Minute
Config.DisableRedmCores = true

Config.SpeakerSettings = {
    SpeakerIcon = true, --- If false, the icon will not appear when players are talking
    ShowDistance = 15, --- 15m show icon
    SpeakerIconHash = GetHashKey('SPEAKER'), -- https://pastebin.com/xx6rEgiG
    SpeakerIconColor = GetHashKey('COLOR_YELLOWSTRONG'), --- https://github.com/femga/rdr3_discoveries/blob/master/useful_info_from_rpfs/colours/README.md
}


Config.HudAutoHide = true  -- For example, if stress is 0, it will be hidden automatically.

Config.HideHuds = { -- Set to true if there is a hud you do not want to use
    -- STATS
    level = false,
    cash = false,
    gold = false,
    logo = false,
    hour = false,
    playerid = false,
    -- HUD
    dirty = false,
    stress = false,
    alcohol = false,
    temp = false,
    onesync = false,
}

Config.VoiceChat = "pma-voice" -- "saltychat" -- pma-voice
Config.VoiceChatDistances = { ---- should be the same as the values in your sound script.
    ["3.0"] = 25,
    ["7.0"] = 50,
    ["15.0"] = 75,
    ["32.0"] = 100,
}

Config.Levels = {
    --[level] = needed xp,
    [1] = 1000, -- needed xp
    [2] = 2000, -- needed xp
    [3] = 3000, -- needed xp
    [4] = 4000, -- needed xp
    [5] = 5000, -- needed xp
    [6] = 6000, -- needed xp
    [7] = 7000, -- needed xp
    [8] = 8000, -- needed xp
    [9] = 9000 -- needed xp
}

Config.WearingValues = {
    ["hat"] = 1,
    ["shirt"] = 1,
    ["pants"] = 1,
    ["boots"] = 1,
    ["coat"] = 2,
    ["opencoat"] = 2,
    ["gloves"] = 1,
    ["vest"] = 1,
    ["poncho"] = 2,
    ["skirts"] = 1,
    ["chaps"] = 1,
}

Config.CheckHungerAndThirstTick = 120 -- second
Config.decreaseSprintRemoveValueTick = 1 -- Second
Config.HudSettings = {
    Stress = { -- or false
        speeding = true, -- or false (Will it gain stress when running fast or running with the wagon?)
        shooting = false, -- or false (Will the stress level increase when shooting?)
        speedingValue = 34.0, -- If the player's speed exceeds 35.0, the stress level will start to increase. horse and vagon maximum speed 35.0 player run 17.5
        speedStress = 1.0, -- How much stress the player will gain every 1 second if they exceed the speedingValue limit
        shootingchange = 100, -- 1-100 What percentage chance the player will win stress when he shoots
        shootingStress = 1.0, -- How much stress will the player gain when he shoots
        shakeScreenValue = 70, -- If the stress level is greater than shakeScreenValue, the player's screen will dim and light up (If you don't want to use it, leave it as 101)
        ShakeGameplayCam = { -- Stress Effect
            Effect = "SMALL_EXPLOSION_SHAKE",
            Value = 0.32,
        }
    },
    Dirty = { -- or false
        minimumDirtyValue = 80,
        flyEffect = true, -- NEW !!
        AutoMessage = false,
        emoteMessage = "do The person emits bad odours",
        checkMinute = 3,
    },
    Stamina = {
        reduceStaminaOnRunning = 1.2, --- Reduce endurance when running
        removeHealthOnNoStamina = false, -- Remove Health in the Absence of Stamina
    },
    Temperature = { -- or false
        cold = -10, -- Cold Decrease
        hot = 45, -- Hot Decrease
        Damage = 2,
        showNotfiy = true,
        checkSecond = 10,
    },
    Hunger = {
        decreaseValue = 0.8, 
        decreaseSprintRemoveValue = false, 
        decreaseOnRunningValue = 0.2, 
        hotValue = 45.0, -- Hot Decrease
        decreaseOnHotValue = 1.0,
        decreaseOnRemoveHealthValue = 15, --- or false (If the hunger value is less than 0, the player's health will decrease by the specified value)
    },
    Thirst = {
        decreaseValue = 1.0, 
        decreaseSprintRemoveValue = true, 
        decreaseOnRunningValue = 0.3, 
        hotValue = 45.0, -- Hot Decrease
        decreaseOnHotValue = 1.0,
        decreaseOnRemoveHealthValue = 15, --- or false (If the thirst value is less than 0, the player's health will decrease by the specified value)
    },
    Alcohol = {
        minimumValue = 70,
        alcoholEffect = true,
        AutoMessage = false,
        emoteMessage = "do The person smells of alcohol",
        checkMinute = 5,
    }
}

function Notify(data)
    local text = data.text or "No message" 
    local time = data.time or 5000  
    local type = data.type or "info" 
    local dict = data.dict
    local icon = data.icon
    local color = data.color or 0
    local src = data.source

    if IsDuplicityVersion() then
        if Framework == "RSG" then
            TriggerClientEvent('ox_lib:notify', src, { title = text, type = type, duration = time })
        elseif Framework == "VORP" then
            if icon then
                TriggerClientEvent('vorp:ShowAdvancedRightNotification', src, text, dict, icon, color, time)
            else
                -- TriggerClientEvent("vorp:TipBottom",src, text, time, type)
                TriggerClientEvent("fx-hud:client:showNotify",src, text, time, type)
            end
        end
    else
        if Framework == "RSG" then
            TriggerEvent('ox_lib:notify', { title = text, type = type, duration = time })
        elseif Framework == "VORP" then
            if icon then
                TriggerEvent("vorp:ShowAdvancedRightNotification", text, dict, icon, color, time)
            else
                -- TriggerEvent("vorp:TipBottom", text, time, type)
                TriggerEvent("fx-hud:client:showNotify", text, time, type)
            end
        end
    end
end

function Locale(key,subs)
    local translate = Config.Locale[Config.Language][key] and Config.Locale[Config.Language][key] or "Config.Locale["..Config.Language.."]["..key.."] doesn't exits"
    subs = subs and subs or {}
    for k, v in pairs(subs) do
        local templateToFind = '%${' .. k .. '}'
        translate = translate:gsub(templateToFind, tostring(v))
    end
    return tostring(translate)
end
