Config = {}
-----------------------------------------
Config.Keybind = 'F6'
Config.OpenMenu = 0x3C0A40F2 -- "F6"
Config.Toggle = true 
Config.UseWhilstWalking = true --- Can he look around when the menu opens?
-- ## Radialmenu fix command = f3fix
-- Set Language
Config.defaultlang = "en_lang"
Config.progressbarcolor = '#c40000'
Config.progresstype = 'innercircle'
-- Set Duel Settings
Config.DuelRevive = true    --- If someone dies in a duel, will they be revived?
-----------------------
-- Set Rob Player Settings
Config.HandCuffItemRequired = true
Config.HandCuffKeyItemRequired = true
---------------------------------------
Config.RobPlayer = {
    UseWebhook = true,
    SearchedWebhook = '',
    SearchedMoneyWebhook = '',
    SearchedName = 'Fixitfy Development',
    SearchedLogo = 'https://cdn.discordapp.com/attachments/1108845226233184377/1137539679407833138/dc.png',
    SearchedAvatar = 'https://cdn.discordapp.com/attachments/1108845226233184377/1111693343454396426/icon.png',
    -------------------------------------------------
    DeadLoot = true, -- can rob a dead person
    robberyprogress = 5000, -- second
    -- The following options work as or example : if hogtied or handsup or handcuff then
    Handsup = true, -- hands have to be up
    HandsupAnimDict = "script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs",
    HandsupAnim = "handsup_register_owner",
    -- or
    Hogtied = true, -- Do they have to be hands tied ?
    -- or
    Handcuff = true, -- Do they have to be handcuffed?
    -- Example --
    -- Handsup = false 
    -- -- or
    -- Hogtied = true, -- can only peel if her hands are tied
    -- -- or
    -- Handcuff = false, 
}

-------------------------


Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Interaction',
        icon = 'fxinteraction',
        items = {
            {
                id = 'carry',
                title = 'Carry',
                icon = 'fxcarry',
                type = 'client',
                event = 'fx-radialmenu:client:carry',
                shouldClose = true
            },
            {
                id = 'robplayer',
                title = 'Robbery',
                icon = 'fxrob',
                type = 'client',
                progress = 5000,
                event = 'fx-radialmenu:client:sheriffsearch',
                shouldClose = true
            },
            {
                id = 'robmoney',
                title = 'Search Money',
                icon = 'magnifying-glass-dollar',
                type = 'client',
                progress = 5000,
                event = 'fx-radialmenu:client:searchmoney',
                shouldClose = true
            },
            {
                id = 'duello',
                title = 'Duello',
                icon = 'fxduel',
                items = {
                    {
                        id = 'requestduel',
                        title = 'Duel Request',
                        icon = 'fxduel',
                        type = 'client',
                        event = 'fx-radialmenu:duel:request',
                        shouldClose = true
                    },
                    {
                        id = 'accepttduel',
                        title = 'Accept Duel',
                        icon = 'fxduelaccept',
                        type = 'client',
                        event = 'fx-radialmenu:client:acceptduel',
                        shouldClose = true
                    },
                    {
                        id = 'createduel',
                        title = 'Create Duel',
                        icon = 'street-view',
                        type = 'client',
                        event = 'fx-radialmenu:client:createDuel',
                        shouldClose = true
                    },
                    {
                        id = 'removeduel',
                        title = 'Remove Duel',
                        icon = 'xmark',
                        type = 'client',
                        event = 'fx-radialmenu:client:removeDuel',
                        shouldClose = true
                    },
                    {
                        id = 'duelbet',
                        title = 'Duel Bet',
                        icon = 'money-bill-transfer',
                        type = 'client',
                        event = 'fx-radialmenu:client:DuelBet',
                        shouldClose = true
                    },
                }
            },
        },
    },
    [2] = {
        id = 'character',
        title = 'Character',
        icon = 'fxcharacter',
        items = {
            {
                id = 'reloadskin',
                title = 'Reload Skin',
                icon = 'person-rays',
                type = 'command',
                event = 'rc',
                shouldClose = true
            },
            {
                id = 'dress',
                title = 'Dress',
                icon = 'person-circle-plus',
                type = 'command',
                event = 'dress',
                shouldClose = true
            },
            {
                id = 'undress',
                title = 'Undress',
                icon = 'person-circle-minus',
                type = 'command',
                event = 'undress',
                shouldClose = true
            },
            {
                id = 'fixped',
                title = 'Fix Ped',
                icon = 'user-slash',
                type = 'client',
                event = 'fx-radialmenu:fixped',
                shouldClose = true
            },
            {
                id = 'openmap',
                title = 'Map',
                icon = 'signs-post',
                items = {
                    {
                        id = 'clotheshop',
                        title = 'Clothes Shop',
                        icon = 'shirt',
                        type = 'client',
                        blipType = 'Clothes',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                    {
                        id = 'stables',
                        title = 'Stables',
                        icon = 'horse',
                        type = 'client',
                        blipType = 'Stables',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                    {
                        id = 'doctors',
                        title = 'Doctors',
                        icon = 'user-doctor',
                        type = 'client',
                        blipType = 'Doctors',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                    {
                        id = 'sheriffs',
                        title = 'Sheriffs',
                        icon = 'star',
                        type = 'client',
                        blipType = 'Sheriffs',
                        event = 'fx-radialmenu:blips:show',
                        shouldClose = true
                    },
                    {
                        id = 'stores',
                        title = 'Stores',
                        icon = 'store',
                        type = 'client',
                        blipType = 'Stores',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                    {
                        id = 'barbers',
                        title = 'Barbers',
                        icon = 'scissors',
                        type = 'client',
                        blipType = 'Barbers',
                        event = 'fx-radialmenu:blips:show',
                        shouldClose = true
                    },
                    {
                        id = 'banks',
                        title = 'Banks',
                        icon = 'building-columns',
                        type = 'client',
                        blipType = 'Banks',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                    {
                        id = 'stashs',
                        title = 'Stashs',
                        icon = 'box-open',
                        type = 'client',
                        blipType = 'Stashs',
                        event = 'fx-radialmenu:blips:show', 
                        shouldClose = true
                    },
                },
            },
            {
                id = 'walkspeed',
                title = 'Walk Speed',
                icon = 'person-running',
                items = {
                    {
                        id = 'speed1',
                        title = 'Speed 1',
                        icon = '1',
                        type = 'client',
                        value = 0.3,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed2',
                        title = 'Speed 2',
                        icon = '2',
                        type = 'client',
                        value = 0.4,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed3',
                        title = 'Speed 3',
                        icon = '3',
                        type = 'client',
                        value = 0.5,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed4',
                        title = 'Speed 4',
                        icon = '4',
                        type = 'client',
                        value = 0.6,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed5',
                        title = 'Speed 5',
                        icon = '5',
                        type = 'client',
                        value = 0.7,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed6',
                        title = 'Speed 6',
                        icon = '6',
                        type = 'client',
                        value = 0.7,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed7',
                        title = 'Speed 7',
                        icon = '7',
                        type = 'client',
                        value = 0.8,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'speed8',
                        title = 'Speed 8',
                        icon = '8',
                        type = 'client',
                        value = 0.9,
                        event = 'walkspeed:client:setspeed',
                        shouldClose = true
                    },
                    {
                        id = 'normalspeed',
                        title = 'Reset Speed',
                        icon = 'circle-check',
                        type = 'client',
                        event = 'walkspeed:client:resetspeed',
                        shouldClose = true
                    },   
                }
            },
            {
                id = 'walkstyle',
                title = 'Walk Style',
                icon = 'shoe-prints',
                items = {
                    {
                        id = 'casual',
                        title = 'Casual',
                        icon = '1',
                        type = 'client',
                        event = 'walkstyles:client:casual',
                        shouldClose = true
                    },
                    {
                        id = 'crazy',
                        title = 'Crazy',
                        icon = '2',
                        type = 'client',
                        event = 'walkstyles:client:crazy',
                        shouldClose = true
                    },
                    {
                        id = 'drunk',
                        title = 'Drunk',
                        icon = 'wine-bottle',
                        type = 'client',
                        event = 'walkstyles:client:drunk',
                        shouldClose = true
                    },
                    {
                        id = 'easyrider',
                        title = 'Easy Rider',
                        icon = '3',
                        type = 'client',
                        event = 'walkstyles:client:easyrider',
                        shouldClose = true
                    },
                    {
                        id = 'flamboyant',
                        title = 'Flamboyant',
                        icon = '4',
                        type = 'client',
                        event = 'walkstyles:client:flamboyant',
                        shouldClose = true
                    },
                    {
                        id = 'greenhorn',
                        title = 'Greenhorn',
                        icon = '5',
                        type = 'client',
                        event = 'walkstyles:client:greenhorn',
                        shouldClose = true
                    },
                    {
                        id = 'gunslinger',
                        title = 'Gunslinger',
                        icon = '6',
                        type = 'client',
                        event = 'walkstyles:client:gunslinger',
                        shouldClose = true
                    },
                    {
                        id = 'inquisitive',
                        title = 'Inquisitive',
                        icon = '7',
                        type = 'client',
                        event = 'walkstyles:client:inquisitive',
                        shouldClose = true
                    },
                    {
                        id = 'refined',
                        title = 'Refined',
                        icon = '8',
                        type = 'client',
                        event = 'walkstyles:client:refined',
                        shouldClose = true
                    },
                    {
                        id = 'silenttype',
                        title = 'Silenttype',
                        icon = '9',
                        type = 'client',
                        event = 'walkstyles:client:silenttype',
                        shouldClose = true
                    },
                    {
                        id = 'veteran',
                        title = 'Veteran',
                        icon = 'person-cane',
                        type = 'client',
                        event = 'walkstyles:client:veteran',
                        shouldClose = true
                    },
                    {
                        id = 'noanim',
                        title = 'No anim',
                        icon = 'person-circle-minus',
                        type = 'client',
                        event = 'walkstyles:client:noanim',
                        shouldClose = true
                    },
                },
            },
        }
    },
    [3] = {
        id = 'emotes',
        title = 'Emotes',
        icon = 'face-grin-stars',
        items = {
            {
                id = 'musicemote',
                title = 'Music',
                icon = 'fxmusic',
                items = {
                    {
                        id = 'trumpet',
                        title = 'Trumpet',
                        icon = 'fxtrumpet',
                        type = 'client',
                        event = 'fx-radialmenu:trumpet',
                        shouldClose = true
                    },
                    {
                        id = 'guitar',
                        title = 'Guitar',
                        icon = 'guitar',
                        type = 'client',
                        event = 'fx-radialmenu:guitar',
                        shouldClose = true
                    },
                    {
                        id = 'cancelmusic',
                        title = 'Stop Music',
                        icon = 'user-slash',
                        type = 'client',
                        event = 'fx-radialmenu:fixped',
                        shouldClose = true
                    },
                    
                },
            },
            {
                id = 'howdy',
                title = 'Howdy',
                icon = 'fxhowdy',
                type = 'client',
                event = 'fx-radialmenu:howdy',
                shouldClose = true
            },
            {
                id = 'bye',
                title = 'Bye',
                icon = 'handshake',
                type = 'client',
                event = 'fx-radialmenu:bye',
                shouldClose = true
            },
        },
    },
    [4] = {
        id = 'clothes',
        title = 'Clothes',
        icon = 'fxcoat',
        items = {
            {
                id = 'bandana',
                title = 'Bandana',
                icon = 'fxbandana',
                type = 'command',
                event = 'fxbandana',
                shouldClose = true
            },
            {
                id = 'sleeves',
                title = 'Rolled Arm',
                icon = 'hand-back-fist',
                type = 'command',
                event = 'fxsleeves',
                shouldClose = true
            },
            {
                id = 'mask',
                title = 'Mask',
                icon = 'fxmask2',
                type = 'command',
                event = 'mask',
                shouldClose = true
            },
            {
                id = 'eyewear',
                title = 'Glasses',
                icon = 'fxglass',
                type = 'command',
                event = 'eyewear',
                shouldClose = true
            },
            {
                id = 'bodycloth',
                title = '...',
                icon = 'fxnext',
                items = {
                    {
                        id = 'gunbelt',
                        title = 'Gunbelt',
                        icon = 'fxtwirl',
                        type = 'command',
                        event = 'belt',
                        shouldClose = true
                    },
                    {
                        id = 'coat',
                        title = 'Coat',
                        icon = 'fxcoat',
                        type = 'command',
                        event = 'coat',
                        shouldClose = true
                    },
                    {
                        id = 'ccoat',
                        title = 'C. Coat',
                        icon = 'fxclosecoat',
                        type = 'command',
                        event = 'ccoat',
                        shouldClose = true
                    },
                    {
                        id = 'shirt',
                        title = 'Shirt',
                        icon = 'fxshirt',
                        type = 'command',
                        event = 'shirt',
                        shouldClose = true
                    },
                    {
                        id = 'vest',
                        title = 'vest',
                        icon = 'vest',
                        type = 'command',
                        event = 'vest',
                        shouldClose = true
                    },
                    {
                        id = 'glove',
                        title = 'Glove',
                        icon = 'fxglove',
                        type = 'command',
                        event = 'glove',
                        shouldClose = true
                    },
                    {
                        id = 'pant',
                        title = 'Pant',
                        icon = 'fxpants',
                        type = 'client',
                        event = 'fx-radialmenu:pant',
                        shouldClose = true
                    },
                },
            },
            {
                id = 'hat',
                title = 'Hat',
                icon = 'fxhat',
                type = 'command',
                event = 'hat',
                shouldClose = true
            },
        }
    },
    [5] = {
        id = 'game',
        title = 'Dice',
        icon = 'dice',
        items = {
            {
                id = 'diceone',
                title = 'Dice One',
                icon = 'dice-one',
                type = 'client',
                event = 'dice:one',
                shouldClose = true
            },
            {
                id = 'dicetwo',
                title = 'Dice Two',
                icon = 'dice-two',
                type = 'client',
                event = 'dice:two',
                shouldClose = true
            },
            {
                id = 'rock',
                title = 'Rock',
                icon = 'hand-back-fist',
                type = 'client',
                event = 'rps:one',
                shouldClose = true
            },
            {
                id = 'paper',
                title = 'Paper',
                icon = 'hand',
                type = 'client',
                event = 'rps:two',
                shouldClose = true
            },
            {
                id = 'scissors',
                title = 'Scissors',
                icon = 'hand-scissors',
                type = 'client',
                event = 'rps:three',
                shouldClose = true
            },
            {
                id = 'tossup',
                title = 'Toss Up',
                icon = 'thumbs-up',
                type = 'client',
                event = 'tossup:tossup',
                shouldClose = true
            },
        }
    },
    [6] = {
        id = 'othermenus',
        title = 'Use Interacts',
        icon = 'dice',
        items = {
            {
                id = 'usetrade',
                title = 'Trade',
                icon = 'handshake-simple',
                type = 'command',
                event = 'opentrade',
                shouldClose = true
            },
            {
                id = 'usenotebook',
                title = 'Notebook',
                icon = 'handshake-simple',
                type = 'client',
                event = 'yourevent', --- create an event here depending on whether you want to open a personal or a shared book and open that book
                shouldClose = true
            },
            {
                id = 'usecraftbook',
                title = 'Craftbook',
                icon = 'handshake-simple',
                type = 'client',
                event = 'yourevent', --- create an event here depending on whether you want to open a personal or a shared book and open that book
                shouldClose = true
            },
        }
    },
}

Config.AlertBlips = {
    blipname = "Request for Help: ",
    blipsprite = 1001245999,
    blipscale = 0.5,
    blipmodifier = "BLIP_MODIFIER_MP_ENEMY_HOLDING",
    blipradius = 5.0,
    alerttime = 120 -- after how many seconds the blip will be deleted ? 120 = 120000
}

Config.DeadMenuItems = {
    [1] = {
        id = 'alerts',
        title = 'Alerts',
        icon = 'bell',
        items = {
            {
                ---- data ---
                id = 'doctoralert',
                title = 'Alert Doctor',
                icon = 'user-nurse',
                type = 'client',
                job = 'doctor',
                event = 'fx-radialmenu:client:alert', 
                shouldClose = true
            },
            {
                -- data ---
                id = 'policealert',
                title = 'Alert Police',
                icon = 'fxsheriff',
                type = 'client',
                job = 'sheriff',
                event = 'fx-radialmenu:client:alert', 
                shouldClose = true
            },
        }
    },
}

Config.JobInteractions = {
    ["doctor"] = {
        id = "doctoraction",
        title = "Doctor",
        icon = 'fxdoctor',
        items = {
            {
                id = 'revive',
                title = 'Revive',
                icon = 'fxrevive',
                type = 'client',
                progressTime = 5000, --- 5 second
                event = 'fx-radialmenu:doctor:revive',
                shouldClose = true
            },
            {
                id = 'heal',
                title = 'Heal',
                icon = 'fxheal',
                type = 'client',
                progressTime = 5000, --- 5 second
                event = 'fx-radialmenu:doctor:heal',
                shouldClose = true
            },
            {
                id = 'megaphone',
                title = 'Megaphone',
                icon = 'fxmegaphone',
                type = 'client',
                event = 'fx-radialmenu:megaphone',
                shouldClose = true
            },
            {
                id = 'carry',
                title = 'Carry',
                icon = 'fxcarry',
                type = 'client',
                event = 'fx-radialmenu:client:carry',
                shouldClose = true
            },
        }
    },
    ["sheriff"] = {
        id = "sheriffaction",
        title = "Sheriff",
        icon = 'fxsheriff',
        items = {
            {
                id = 'handcuff',
                title = 'Handcuff',
                icon = 'fxhandcuff',
                type = 'client',
                item = 'water', -- replace this item with the item you have
                event = 'fx-radialmenu:cuffs',
                shouldClose = true
            },
            {
                id = 'uncuff',
                title = 'Uncuff',
                icon = 'fxuncuff',
                type = 'client', -- 
                item = 'bread', -- replace this item with the item you have
                event = 'fx-radialmenu:lockpick',
                shouldClose = true
            },
            {
                id = 'carry',
                title = 'Carry',
                icon = 'fxcarry',
                type = 'client',
                event = 'fx-radialmenu:client:carry', 
                shouldClose = true
            },
            {
                id = 'escort',
                title = 'Escort',
                icon = 'fxescort',
                type = 'client',
                event = 'fx-radialmenu:client:drag', 
                shouldClose = true
            },
            {
                id = 'megaphone',
                title = 'Megaphone',
                icon = 'fxmegaphone',
                type = 'client',
                event = 'fx-radialmenu:megaphone',
                shouldClose = true
            },
            {
                id = 'sheriffsearchinv',
                title = 'Search Inv',
                icon = 'fxinventory',
                type = 'client',
                force = true,
                event = 'fx-radialmenu:client:sheriffsearch',
                shouldClose = true
            },
            {
                id = 'sheriffsearchmoney',
                title = 'Search Money',
                icon = 'magnifying-glass-dollar',
                type = 'client',
                event = 'fx-radialmenu:cl:searchsheriffmoney',
                shouldClose = true
            },
        }
    },
    -- ["fixitfy"] = { --- perm Example job create menu
    --     id = "fixitfy",
    --     title = "Fixitfy",
    --     icon = 'check',
    --     items = {
    --         {
    --             id = 'test',
    --             title = 'Test',
    --             icon = 'check',
    --             type = 'client',
    --             event = 'you-event',
    --             shouldClose = true
    --         },
    --     }
    -- },
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