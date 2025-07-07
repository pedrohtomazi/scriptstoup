Config = {}
Config.Language = "en"

---- NEW ----
Config.Log = true -- if true webhook channel send buy or sell log
Config.Webhook = {
    WebhookLogo = "", --- LOGO 
    WebhookImage = "", --- BANNER IMAGE
    WebhookChannel = "" -- CHANNEL WEBHOOK
}

Config.DisableShowingItemQuantities = false -- More optimised
Config.OpenStoreKey = 0x760A9C6F -- G
-----------
Config.Locale = {
    ["en"] = {
        ["nomoney"] = "You have no money!",
        ["carryitem"] = "You can't carry more than this item!",
        ["noitemcount"] = "You don't have this many items on you!",
        ["additems"] = "You bought ${count}x ${item}!",
        ["yousell"] = "You sell ${count}x ${item} and won $${price}!",
        ["promptstore"] = "Store",
        ["dontaccess"] = "You don't acces here!",
        ["invalidCount"] = "Invalid Count!",
        ["shopisclose"] = "Shop is closed!",
        ["buylog"] = "I bought ${count}x of ${item} for ${price} dollars",
        ["sellog"] = "I sold ${count}x of ${item} for ${price} dollars",
    }
}

Config.Stores = {
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        pedSpawnDistance = 10,
        coords = {
            vector4(-755.36, -1361.10, 43.77, -92.84),
            vector4(-772.8853, -1382.0974, 43.6905, 128.1395),
        },
        promptitle = "Fishing Store",
        image = "/ui/img/fishing-store.png",
        ---- BLIP ---
        showblip = true,
        blipname = "Fishing Store",
        blipsprite = 3442726182,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = false,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false, -- or  requiredJobs = false,
        -- requiredJobs = {["doctor"] = "0"}, -- or  requiredJobs = false,
        SellItems = { 
            {itemName = "bandage",itemLabel = "bandage",price = 9},
            {itemName = "a_c_fishbluegil_01_sm",itemLabel = "Small Bluegil",price = 9},
            {itemName = "a_c_fishbluegil_01_sm",itemLabel = "Small Bluegil",price = 9, moneytype = "gold"},
            {itemName = "a_c_fishbluegil_01_ms",itemLabel = "Medium Bluegil",price = 13},
            {itemName = "a_c_fishchannelcatfish_01_xl",itemLabel = "Channel Catfish (Extra Large)",price = 12},
            {itemName = "a_c_fishbullheadcat_01_sm",itemLabel = "Small Bullhead",price = 10},
            {itemName = "a_c_fishbullheadcat_01_ms",itemLabel = "Medium Bullhead",price = 12},
            {itemName = "a_c_fishchainpickerel_01_sm",itemLabel = "Small Pickerel",price = 12},
            {itemName = "a_c_fishchainpickerel_01_ms",itemLabel = "Medium Pickerel",price = 14},
            {itemName = "a_c_fishlargemouthbass_01_lg",itemLabel = "Large Mouth Bass (Large)",price = 17},
            {itemName = "a_c_fishlakesturgeon_01_lg",itemLabel = "Lake Sturgeon (Large)",price = 19},
            {itemName = "a_c_fishlargemouthbass_01_ms",itemLabel = "Lardgemouth Bass",price = 20},
            {itemName = "a_c_fishlongnosegar_01_lg",itemLabel = "Long Nose Gar (Large)",price = 24},
            {itemName = "a_c_fishnorthernpike_01_lg",itemLabel = "Northern Pike (Large)",price = 22},
            {itemName = "a_c_fishperch_01_sm",itemLabel = "Small Perch",price = 12},
            {itemName = "a_c_fishperch_01_ms",itemLabel = "Medium Perch",price = 15},
            {itemName = "a_c_fishredfinpickerel_01_sm",itemLabel = "Small Redfin Pickerel",price = 16},
            {itemName = "a_c_fishredfinpickerel_01_ms",itemLabel = "Medium Redfin Pickerel",price = 19},
            {itemName = "a_c_fishrockbass_01_sm",itemLabel = "Small Rockbass",price = 15},
            {itemName = "a_c_fishrockbass_01_ms",itemLabel = "Medium Rockbass",price = 17},
            {itemName = "a_c_fishsalmonsockeye_01_lg",itemLabel = "Salmon Sockeye (Large)",price = 19},
            {itemName = "a_c_fishsalmonsockeye_01_ml",itemLabel = "Salmon Sockeye (Medium-Large)",price = 17},
            {itemName = "a_c_fishsalmonsockeye_01_ms",itemLabel = "Sockeye Salmon",price = 19},
            {itemName = "a_c_fishsmallmouthbass_01_lg",itemLabel = "Small Mouth Bass (Large)",price = 22},
            {itemName = "a_c_fishsmallmouthbass_01_ms",itemLabel = "Smallmouth Bass",price = 24},
        },
        BuyItems = {
            {itemName = "bandage",itemLabel = "bandage",price = 9},
            {itemName = "fishingrod",itemLabel = "Fishing Rod",price = 50},
            {itemName = "fishbait",itemLabel = "Yem",price = 2},
            {itemName = "efsun",itemLabel = "Efsun",price = 1000},
            {itemName = "blessing_paper",itemLabel = "Blessing Paper",price = 150},
            {itemName = "rituel10",itemLabel = "Rituel 10",price = 300},
            {itemName = "rituel20",itemLabel = "Rituel 20",price = 350},
            {itemName = "rituel30",itemLabel = "Rituel 30",price = 400},
            {itemName = "rituel50",itemLabel = "Rituel 50",price = 450},
        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01",
        pedSpawnDistance = 10,
        coords = {
            vector4(-785.9388, -1322.1508, 43.9342, 133.0034), --- BLACKWATER
            vector4(-1789.8792, -388.3725, 160.3787, 50.4069), --- STRAWBERRY
            vector4(-324.1314, 803.6735, 117.9317, 279.9772), --- VALENTINE
            vector4(1329.7538, -1294.4561, 77.0718, 64.7175), --- RHODES
            vector4(2824.4702, -1319.3683, 46.8057, 319.2672), --- SAINT DENIS
            vector4(-3687.3721, -2623.2693, -13.3812, 271.5801), --- ARMADILLO
            vector4(-5485.7217, -2938.2261, -0.3493, 124.7918), --- TUMBLEWEED
            vector4(3025.5771, 562.4277, 44.7718, 259.9684), --- VANHORN
            vector4(2931.7944, 1365.7040, 45.2338, 255.8304), --- ANNESBURG
        },
        promptitle = "General Store",
        image = "/ui/img/store.png",
        ---- BLIP ---
        showblip = true,
        blipname = "General Store",
        blipsprite = 444204045,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = false,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2,
        requiredJobs = false, -- or  requiredJobs = {["fishingman"] = "0"},
        SellItems = {
            {itemName = "bandage",itemLabel = "Bandage",price = 20},

        },                                               -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "bandage",itemLabel = "Bandage",price = 9},

        }
    },
    {
        ped = true,
        model = "u_m_m_valbutcher_01", 
        pedSpawnDistance = 10,
        coords = {
            vector4(-756.3467, -1307.3907, 43.6798, 284.1867), --- Blackwater
        },
        promptitle = "Butcher Store",
        image = "/ui/img/butcher-store.png", 
        ---- BLIP ---
        showblip = true,
        blipname = "Butcher Store",
        blipsprite = 218395012,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",                    --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = false,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2.5,
        requiredJobs = false, 
        BuyItems = {},                                           -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        SellItems = {
            {itemName = "game",itemLabel = "Et",price = 0.40},
            {itemName = "biggame",itemLabel = "Buyuk Et",price = 0.60},
            {itemName = "leather",itemLabel = "Deri",price = 0.55},

        }
    },
    {
        ped = true,
        model = "U_M_M_NbxGeneralStoreOwner_01", 
        pedSpawnDistance = 10,
        coords = {
            vector4(-787.0439, -1299.4016, 43.7843, 359.3194), --- Blackwater
            vector4(-281.1747, 778.9503, 119.5874, 352.9932), --- Valentine
            vector4(-1840.1729, -419.4863, 161.6848, 55.6940), --- Strawberry
            vector4(-3676.5435, -2605.6570, -13.6780, 189.5556), --- Armadillo
            vector4(1322.5837, -1323.2070, 77.9389, 341.7410), --- Rhodes
        },
        promptitle = "Silah Dukkani",
        image = "/ui/img/store.png", 
        ---- BLIP ---
        showblip = true,
        blipname = "Silah Dukkani",
        blipsprite = 202506373,
        blipscale = 0.6,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
        ---- PED SCENARİO AND ANİM ----
        pedScenario = "WORLD_HUMAN_SMOKE_NERVOUS_STRESSED",                    --## Ped scenario /You can add optionally. You can delete the code or turn it false
        anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
        }, 
        ----- NEW -------
        storeTimeSettings = {                                          --## You can set when the store opens and closes.
            allowed = false,                                            --## If you do false, the store will always be open
            open = 8,
            close = 21,
            blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the store is closed
        },
        ---- Can Interact -----
        canInteract = {
            func = true,                                              -- ## Checks to be carried out before interacting with the ped. If you don't know what to do, leave it like this.
            error = "none"
        },
        distance = 2.5,
        requiredJobs = false, 
        SellItems = {
            {itemName = "WEAPON_MELEE_KNIFE",itemLabel = "Avci Bicagi",price = 5},
        },                                           -- ## this feature switches off automatically if there is no data input. Close SellItems Store
        BuyItems = {
            {itemName = "WEAPON_MELEE_KNIFE",itemLabel = "Avci Bicagi",price = 5},
            {itemName = "WEAPON_MELEE_HATCHET_HUNTER",itemLabel = "Balta",price = 15},
            {itemName = "WEAPON_BOW",itemLabel = "Yay",price = 10},
            {itemName = "WEAPON_LASSO",itemLabel = "Kement",price = 10},
            {itemName = "WEAPON_KIT_BINOCULARS_IMPROVED",itemLabel = "Durbun",price = 15},
            {itemName = "WEAPON_MELEE_DAVY_LANTERN",itemLabel = "Fener",price = 10},
            -- {itemName = "WEAPON_THROWN_BOLAS",itemLabel = "Bola",price = 20},
            -- {itemName = "ammobolla",itemLabel = "Bola Mermisi",price = 2},
            -- {itemName = "WEAPON_REPEATER_EVANS",itemLabel = "Evans Repeater",price = 120},
            {itemName = "WEAPON_REVOLVER_CATTLEMAN",itemLabel = "Revolver Cattleman",price = 50},
            {itemName = "WEAPON_REVOLVER_DOUBLEACTION",itemLabel = "Revolver Doubleaction",price = 30},
            {itemName = "WEAPON_REVOLVER_SCHOFIELD",itemLabel = "Revolver Schofield",price = 90},
            {itemName = "ammorevolvernormal",itemLabel = "Revolver Mermisi",price = 3},
            {itemName = "ammoarrownormal",itemLabel = "Ok",price = 0.50},
            {itemName = "ammorepeaternormal",itemLabel = "Repeater Mermisi",price = 5},
            {itemName = "ammopistolnormal",itemLabel = "Pistol Mermisi",price = 4},
            -- {itemName = "ammoriflenormal",itemLabel = "Rifle Mermisi",price = 90},
        }
    },
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
            text = string.gsub(text, "~.-~", "")
            TriggerClientEvent('ox_lib:notify', src, { title = text, type = type, duration = time })
        elseif Framework == "REDEMRP" then
            text = string.gsub(text, "~.-~", "")
            TriggerClientEvent("redem_roleplay:Tip", src, text, time)
        elseif Framework == "VORP" then
            if icon then
                TriggerClientEvent('vorp:ShowAdvancedRightNotification', src, text, dict, icon, color, time)
            else
                TriggerClientEvent("vorp:TipBottom",src, text, time, type)
            end
        end
    else
        if Framework == "RSG" then
            text = string.gsub(text, "~.-~", "")
            TriggerEvent('ox_lib:notify', { title = text, type = type, duration = time })
        elseif Framework == "REDEMRP" then
            text = string.gsub(text, "~.-~", "")
            TriggerEvent("redem_roleplay:Tip", text, time)
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