Config = {}
Config.Webhook = "https://discord.com/api/webhooks/1275842002759581758/PkI47qPuVCIyPYxPwTXYYz0kenWHf7K2oc5d3Dju2jO1ITxaFYjKcIakeVkmvhlN3QLO" --- robbery start log and reward log
Config.Language = "en"
Config.Keybinds = {
    ["startrobbery"] = 0x760A9C6F,
    ["takemoney"] = 0x760A9C6F,
}
-- Notify text color = ~COLOR_YELLOW~  ~COLOR_RED~ ~COLOR_WHITE~
Config.Locale = {
    ["en"] = {
        --- PROMPTS ---
        ["startrobbery"] = "STORE ROBBERY",
        ["robbery_progress"] = "Robbing..",
        ["take_drawtext"] = "[G] Take",
        --- NOTIFY -----
        ["storerobbed"] = "This store has been robbed, try again later!",
        ["allowedjob"] = "You have a whitelisted job. You can't commit robbery!",
        ["insufficientjob"] = "This robbery cannot happen now. There are not enough lawmen!",
        ["robbery_started"] = "A store is being robbed nearby. Look at your map!",
        ["not_itemcount"] = "You need ${count}x ${item} to rob the safe!",
        ["failed_minigame"] = "You couldn't open the safe!",
        ["take_money"] = "You took ${cash} dollars !",
        ["not_reward"] = "The safe is empty, nothing came out!",
        ["no_items_found"] = "Couldn't find an item!",
        ["reward_item"] = "You won a total of ${cash} dollars and ${item} in this robbery",
        ["cantcarry"] = "You can't carry any more ${count}x ${item}! Empty your bag..",
        ["no_register_nearby"] = "No safe to rob was found nearby !",
        ["robbery_log"] = "Player robbed a store and take ${cash} dollars + ${items}",
        ["robberystart_log"] = "Player store robbery in ${name} !",
        ["storeinrobbery"] = "The safe is being robbed by someone else!",
        ["robberyDrawText"] = "Press G to rob the safe"
    }
}

Config.Props = {
    "p_register01x",
    "p_register03x",
    "p_register04x",
    "p_register05x",
    "p_register06x",
    "p_register07x",
    "p_register08x",
}

Config.RobberyStores = {
    ["Blackwater"] = {
        promptOnly = false, --- If you don't want to use prompts, set it to false. When set to false, drawtext is activated
        promptTitle = "Blackwater General Store", -- Promp title
        distance = 2.0, -- If promptOnly = false, how far away will you interact
        coord = vector3(-785.32, -1323.03, 43.93),
        NotifyJobsDelay = 30,  -- Delay between notifications in second
        NotifyRange = 200.0,  -- Bildirimlerin gönderileceği maksimum mesafe (metre cinsinden)
        ActiveJobs = false,
        RobberyTimeout = 5, --- If the robbery does not end after how many minutes after it starts, it will be automatically canceled and the coins will be deleted
        NotifyChancePercentage = 100,  -- Chance of notification being sent (a value between 0-100)
        RobberyDelay = 60,  --  Time required for the robbery to be carried out again (in minutes)
        MinigameActive = true, -- Should the minigame for the robbery be open?
        ProgressBar = 5, -- or ProgressBar = false, (How many seconds to wait when robbing the safe)
        requiredItems = false,
        RewardChance = 100, -- What percentage chance to find money or items from the safe
        Rewards = {
            Cash = {10, 100},
            Items = { --- or false
                [1] = {item = "goldnugget", itemLabel = "Gold Nugget", count = 1, chance = 100},
            },
        }
    },
    ["Strawberry"] = {
        promptOnly = false, --- If you don't want to use prompts, set it to false. When set to false, drawtext is activated
        promptTitle = "Strawberry General Store", -- Promp title
        distance = 2.0, -- If promptOnly = false, how far away will you interact
        coord = vector3(-1789.94, -386.94, 160.37),
        NotifyJobsDelay = 30,  -- Delay between notifications in second
        NotifyRange = 200.0,  -- Bildirimlerin gönderileceği maksimum mesafe (metre cinsinden)
        ActiveJobs = { -- If there are enough active players of the specified professions, the heist can begin (for example 3 sheriffs and 3 police have to be active)
            ["sheriff"] = 1,   
            ["police"] = 3     
        },
        RobberyTimeout = 5, --- If the robbery does not end after how many minutes after it starts, it will be automatically canceled and the coins will be deleted
        NotifyChancePercentage = 100,  -- Chance of notification being sent (a value between 0-100)
        RobberyDelay = 60,  --  Time required for the robbery to be carried out again (in minutes)
        MinigameActive = true, -- Should the minigame for the robbery be open?
        ProgressBar = 30, -- or ProgressBar = false, (How many seconds to wait when robbing the safe)
        requiredItems = { -- or requiredItem = false, (Items needed for robbery. If the minigame is active, 1 amount is deleted if it fails)
            {item = "lockpick", label = "Lockpick", count = 2, removefail = true, removesuccess = true},
            {item = "water", label = "Water", count = 1, removefail = true, removesuccess = true}
        },
        RewardChance = 100, -- What percentage chance to find money or items from the safe
        Rewards = {
            Cash = {10, 100},
            Items = { --- or false
                [1] = {item = "goldnugget", itemLabel = "Gold Nugget", count = 1, chance = 100},
            },
        }
    },
    ["Valentine"] = {
        promptOnly = false, --- If you don't want to use prompts, set it to false. When set to false, drawtext is activated
        promptTitle = "Valentine General Store", -- Promp title
        distance = 2.0, -- If promptOnly = false, how far away will you interact
        coord = vector3(-323.38, 804.335, 117.93),
        NotifyJobsDelay = 30,  -- Delay between notifications in second
        NotifyRange = 200.0,  
        ActiveJobs = { -- If there are enough active players of the specified professions, the heist can begin (for example 3 sheriffs and 3 police have to be active)
            ["sheriff"] = 1,   
            -- ["police"] = 3     
        },
        RobberyTimeout = 5, --- If the robbery does not end after how many minutes after it starts, it will be automatically canceled and the coins will be deleted
        NotifyChancePercentage = 100,  -- Chance of notification being sent (a value between 0-100)
        RobberyDelay = 60,  --  Time required for the robbery to be carried out again (in minutes)
        MinigameActive = true, -- Should the minigame for the robbery be open?
        ProgressBar = 30, -- or ProgressBar = false, (How many seconds to wait when robbing the safe)
        requiredItems = { -- or requiredItem = false, (Items needed for robbery. If the minigame is active, 1 amount is deleted if it fails)
            {item = "lockpick", label = "Lockpick", count = 2, removefail = true, removesuccess = true},
            {item = "water", label = "Water", count = 1, removefail = true, removesuccess = true}
        },
        RewardChance = 100, -- What percentage chance to find money or items from the safe
        Rewards = {
            Cash = {10, 100},
            Items = { --- or false
                [1] = {item = "goldnugget", itemLabel = "Gold Nugget", count = 1, chance = 100},
            },
        }
    },
    ["Rhodes"] = {
        promptOnly = false, --- If you don't want to use prompts, set it to false. When set to false, drawtext is activated
        promptTitle = "Rhodes General Store", -- Promp title
        distance = 2.0, -- If promptOnly = false, how far away will you interact
        coord = vector3(1329.385, -1293.30, 77.05),
        NotifyJobsDelay = 30,  -- Delay between notifications in second
        NotifyRange = 200.0,  -- Bildirimlerin gönderileceği maksimum mesafe (metre cinsinden)
        ActiveJobs = { -- If there are enough active players of the specified professions, the heist can begin (for example 3 sheriffs and 3 police have to be active)
            ["sheriff"] = 1,   
            -- ["police"] = 3     
        },
        RobberyTimeout = 5, --- If the robbery does not end after how many minutes after it starts, it will be automatically canceled and the coins will be deleted
        NotifyChancePercentage = 100,  -- Chance of notification being sent (a value between 0-100)
        RobberyDelay = 60,  --  Time required for the robbery to be carried out again (in minutes)
        MinigameActive = true, -- Should the minigame for the robbery be open?
        ProgressBar = 30, -- or ProgressBar = false, (How many seconds to wait when robbing the safe)
        requiredItems = { -- or requiredItem = false, (Items needed for robbery. If the minigame is active, 1 amount is deleted if it fails)
            {item = "lockpick", label = "Lockpick", count = 2, removefail = true, removesuccess = true},
            {item = "water", label = "Water", count = 1, removefail = true, removesuccess = true}
        },
        RewardChance = 100, -- What percentage chance to find money or items from the safe
        Rewards = {
            Cash = {10, 100},
            Items = { --- or false
                [1] = {item = "goldnugget", itemLabel = "Gold Nugget", count = 1, chance = 100},
            },
        }
    },
    ["SaintDenis"] = {
        promptOnly = false, --- If you don't want to use prompts, set it to false. When set to false, drawtext is activated
        promptTitle = "SaintDenis General Store", -- Promp title
        distance = 2.0, -- If promptOnly = false, how far away will you interact
        coord = vector3(2825.68, -1319.37, 46.813),
        NotifyJobsDelay = 30,  -- Delay between notifications in second
        NotifyRange = 200.0,  -- Bildirimlerin gönderileceği maksimum mesafe (metre cinsinden)
        ActiveJobs = { -- If there are enough active players of the specified professions, the heist can begin (for example 3 sheriffs and 3 police have to be active)
            ["sheriff"] = 1,   
            -- ["police"] = 3     
        },
        RobberyTimeout = 5, --- If the robbery does not end after how many minutes after it starts, it will be automatically canceled and the coins will be deleted
        NotifyChancePercentage = 100,  -- Chance of notification being sent (a value between 0-100)
        RobberyDelay = 60,  --  Time required for the robbery to be carried out again (in minutes)
        MinigameActive = true, -- Should the minigame for the robbery be open?
        ProgressBar = 30, -- or ProgressBar = false, (How many seconds to wait when robbing the safe)
        requiredItems = { -- or requiredItem = false, (Items needed for robbery. If the minigame is active, 1 amount is deleted if it fails)
            {item = "lockpick", label = "Lockpick", count = 2, removefail = true, removesuccess = true},
            {item = "water", label = "Water", count = 1, removefail = true, removesuccess = true}
        },
        RewardChance = 100, -- What percentage chance to find money or items from the safe
        Rewards = {
            Cash = {10, 100},
            Items = { --- or false
                [1] = {item = "goldnugget", itemLabel = "Gold Nugget", count = 1, chance = 100},
            },
        }
    },
}

Config.AlertBlips = { --- or Config.Blip = false (Will there be a blip on the sheriffs' map when a robbery is taking place?)
    blipname = "Store Robbery !",
    blipsprite = -2018361632,
    blipscale = 0.5,
    blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
    blipradius = 5.0,
    alerttime = 2 -- After how many minutes will the blip be deleted? 1 Minute
}

Config.MinigameFunction = function(callback)
    local finished = exports["fx-minigame"]:taskBar(3700, 1)
    if finished == 100 then 
        callback(true)
    else
        callback(false)
    end
end

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
                TriggerClientEvent("vorp:TipBottom",src, text, time, type)
            end
        end
    else
        if Framework == "RSG" then
            TriggerEvent('ox_lib:notify', { title = text, type = type, duration = time })
        elseif Framework == "VORP" then
            if icon then
                TriggerEvent("vorp:ShowAdvancedRightNotification", text, dict, icon, color, time)
            else
                TriggerEvent("vorp:TipBottom", text, time, type)
            end
        end
    end
end

function Locale(key, subs)
  local translate = Config.Locale[Config.Language][key] and Config.Locale[Config.Language][key] or "Config.Locale[" .. Config.Language .. "][" .. key .. "] doesn't exist"
  subs = subs and subs or {}
  for k, v in pairs(subs) do
      local templateToFind = '%${' .. k .. '}'
      local safeValue = tostring(v):gsub("%%", "%%%%")
      translate = translate:gsub(templateToFind, safeValue)
  end
  translate = tostring(translate):gsub("%%%%", "%%")
  return tostring(translate)
end