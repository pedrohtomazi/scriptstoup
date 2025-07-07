function randomEffects()
    local effects = {
        "playerdrugshalluc01",
        "PlayerDrugsPoisonWell",
        "PlayerDrunk01",
        "PlayerDrunk01_PassOut",
        "PlayerDrunkAberdeen",
        "PlayerDrunkSaloon1",
    }

    local randomIndex = math.random(1, #effects)

    local ScreenEffect = {
        effect = effects[randomIndex],
        duration = 30 
    }

    return ScreenEffect
end

Config.Consumables = {
    ["bread"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = false, -- or false
        returnedItem = {name = "beer", count = 1},
        usageLimit = 1, -- how many times it can be used
        progressBarDuration = 2500,
    },
    ["fullcanteen"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        usageLimit = 5, -- how many times it can be used
    },
    ["consumable_chocolate"] = {
        prop = "s_chocolatebar01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["consumable_medicine"] = {
        prop = "s_inv_medicine01x",
        hunger = 0, 
        thirst = 15, 
        health = 60,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "medic",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["snackplate"] = {
        prop = "s_cankidney01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cheese"] = {
        prop = "p_pickup_cheese01x",
        hunger = 35, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fruitcake"] = {
        prop = "s_bit_bread06",
        hunger = 35, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["chocolatecake"] = {
        prop = "s_chocolatebar01x",
        hunger = 35, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cookie"] = {
        prop = "s_chocolatebar02x",
        hunger = 35, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["consumable_kidneybeans_can"] = {
        prop = "s_cankidney01x",
        hunger = 50, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "kidney", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fruitplate"] = {
        prop = "s_bit_bread06",
        hunger = 50, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["lobster"] = {
        prop = "s_cankidney01x",
        hunger = 50, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["oyster"] = {
        prop = "s_cankidney01x",
        hunger = 50, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- kidney - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["water"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["coffe"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 30.0, 
        stress = 0, 
        Alcohol = -50,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["chamomiletea"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 30, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["beer"] = {
        prop = "p_bottlebeer01a",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 50,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, 
        SetPedDrunkness = false,
        -- SetPedDrunkness = { --- or false or nil
        --     drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
        --     duration = 30 --- Second
        -- },
        -- ScreenEffect = randomEffects()
    },
    ["liquor"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 20,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 30 --- Second
        },
        ScreenEffect = {  --- or false or nil
            effect = "PlayerDrunk01",
            duration = 30 --- Second 
        }
    },
    ["gin"] = {
        prop = "s_inv_gin01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 20,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "gin",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 30 --- Second
        },
        ScreenEffect = {  --- or false or nil
            effect = "PlayerDrunk01",
            duration = 30 --- Second 
        }
    },
    ["wine"] = {
        prop = "p_bottlewine01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 20,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "wine",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 30 --- Second
        },
        ScreenEffect = {  --- or false or nil
            effect = "PlayerDrunk01",
            duration = 30 --- Second 
        }
    },
    ["whisky"] = {
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "whisky",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 30 --- Second
        },
        ScreenEffect = {  --- or false or nil
            effect = "PlayerDrunkAberdeen",
            duration = 30 --- Second 
        }
    },
    ["honeywhisky"] = {
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "whisky",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 30 --- Second
        },
        ScreenEffect = {  --- or false or nil
            effect = "PlayerDrunkAberdeen",
            duration = 30 --- Second 
        }
    },
    ["cigarette"] = {
        prop = "P_CIGARETTE01X",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 20.0, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "cigaratte",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        neededItems = {
            {name = "lighter", count = 1, usageLimit = 3}
        }
    },
    ["cigar"] = {
        prop = "p_cigar01x",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 20.0, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "cigar",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["pipe"] = {
        prop = "P_PIPE01X",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 20.0, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- at sağlığı
        horseStamina = 0, -- at staminası
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "pipe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["bandage"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 100, --- max ped health 600
        stamina = 20.0, 
        stress = -50, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        progressBarDuration = 5000,
    },
    ["apple"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 25, -- Horse Health
        horseStamina = 25, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["consumable_haycube"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 25, -- Horse Health
        horseStamina = 25, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["adrenaline"] = {
        prop = "mp007_p_mp_syringe01x_1",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 100.0, 
        stress = -20, 
        Alcohol = 0,
        horseHealth = 0, -- at sağlığı
        horseStamina = 0, -- at staminası
        goldCore = { "health","stamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 50.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 50.0,
        animation = "inject",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["horseadrenaline"] = {
        prop = "p_cs_syringe01x",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- at sağlığı
        horseStamina = 100, -- at staminası
        goldCore = {"horsestamina", "horsehealth"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 50.0,
        healthOuterCoreGold = 50.0,
        staminaInnerCoreGold = 50.0,
        staminaOuterCoreGold = 50.0,
        animation = "horseinject",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["horsebrush"] = {
        prop = "",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, 
        horseStamina = 20, 
        goldCore = {"horsestamina", "horsehealth"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horsebrush",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 5, -- 
    },
}


Config.Animations = {
    ["none"] = function(_, cb)
        cb(true) 
    end,
    ["bandage"] = function(propname, cb)
        FXLockInventory()
        local dict = "script_re@bear_trap"
        local anim = "bandage_loop_victim"
        local animtime = 5000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        
        local prop = CreateObject(GetHashKey(propname), coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, "skel_l_hand")
        AttachEntityToEntity(prop, ped, boneIndex, 0.11, 0.06, 0.05, 89.0, 0.0, 0.0, true, true, false, true, 1, true)
        
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, animtime, 1, 0, true, 0, false, 0, false)
        Wait(animtime)
        Citizen.InvokeNative(0x4102732DF6B4005F, "RespawnPulseMP01", 0, true)
        soundEffect("Core_Fill_Up", "Consumption_Sounds")
        DeleteEntity(prop)
        ClearPedSecondaryTask(ped)
        SetTimeout(2000, function()
            AnimpostfxStopAll()
        end)
        FXUnlockInventory()
        cb(true)
    end,
    ["kidney"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "s_cankidney01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("PrimaryItem"),
            item_interaction_state_name_hash = GetHashKey("EAT_CANNED_FOOD_CYLINDER@D8-2_H10-5_QUICK_LEFT"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,    
    ["stew"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
    
        Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
        local bowl = CreateObject("P_BOWL04X_STEW", coords.x, coords.y, coords.z, true, false, false, false)
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        local spoon = CreateObject("P_SPOON01X", coords.x, coords.y, coords.z, true, false, false, false)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
        TaskItemInteraction_2(ped, 599184882, bowl, `P_BOWL04X_STEW_PH_L_HAND`, `EAT_STEW_BOWL_BASE`, 3, 0, -1.0)
        TaskItemInteraction_2(ped, 599184882, spoon, `P_SPOON01X_PH_R_HAND`, `EAT_STEW_BOWL_BASE`, 3, 0, -1.0)
        Citizen.InvokeNative(0xB35370D5353995CB, ped, `EAT_STEW_BOWL_BASE`, 1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            local eatPressCount = 0    
            while true do
                Wait(1)
                local interact = IsPedRunningTaskItemInteraction(ped)
                if IsDisabledControlJustPressed(0, GetHashKey("INPUT_CONTEXT_RT")) then eatPressCount += 1 end
                if interact == 0 then break end
                if eatPressCount >= 6 then Wait(2000) break end
            end
            DeleteEntity(bowl)
            DeleteEntity(spoon)
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
            FXUnlockInventory()
            cb(true)
        end)
    end,
    ["sandwich"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "p_biscuitsandwich01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("PrimaryItem"),
            item_interaction_state_name_hash = GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,
    ["drink"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local prop = propname or "p_water01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then
            DeleteEntity(obj)
            FXUnlockInventory()
            cb(false)
            return
        end
    
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {netId = netId,prop = prop,inventory_item_hash = -1199896558,item_interaction_propId_hash = GetHashKey("PrimaryItem"),item_interaction_state_name_hash = GetHashKey("DRINK_Bottle_Oval_L5-5W9-5H10_Neck_A6_B2-5_QUICK_RIGHT_HAND"),item_interaction_flags = 0}
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped,animData.inventory_item_hash,obj,animData.item_interaction_propId_hash,animData.item_interaction_state_name_hash,1,animData.item_interaction_flags,-1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,    
        
    ["medic"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "s_inv_medicine01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
        
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {netId = netId,prop = prop,inventory_item_hash = -1199896558,item_interaction_propId_hash = GetHashKey("PrimaryItem"),item_interaction_state_name_hash = GetHashKey("USE_TONIC_SATCHEL_LEFT_HAND_QUICK"),item_interaction_flags = 0}
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
        Citizen.InvokeNative(0x669655FFB29EF1A9, obj, 2, "corkonoff", 1.0)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,    
    ["coffe"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "p_mugCoffee01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then
            DeleteEntity(obj)
            FXUnlockInventory()
            cb(false)
            return
        end
    
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {netId = netId,prop = prop,inventory_item_hash = -1199896558,item_interaction_propId_hash = GetHashKey("p_mugCoffee01x_ph_r_hand"),item_interaction_state_name_hash = GetHashKey("DRINK_COFFEE_HOLD"),item_interaction_flags = 0}
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        cb(true)
        FXUnlockInventory()
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    return
                end
            end
        end)
    end,    
    ["beer"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "p_bottleBeer01a"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("p_bottleBeer01x_PH_R_HAND"),
            item_interaction_state_name_hash = GetHashKey("DRINK_BOTTLE@Bottle_Cylinder_D1-55_H18_Neck_A8_B1-8_UNCORK"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,    
    ["whisky"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "p_bottleJD01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("p_bottleJD01x_ph_r_hand"),
            item_interaction_state_name_hash = GetHashKey("DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
        Citizen.InvokeNative(0x669655FFB29EF1A9, obj, 2, "corkonoff", 1.0)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,    
    ["gin"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "s_inv_gin01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("PrimaryItem"),
            item_interaction_state_name_hash = GetHashKey("DRINK_Bottle_Oval_L5-5W9-5H10_Neck_A6_B2-5_QUICK_LEFT_HAND"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
        Citizen.InvokeNative(0x669655FFB29EF1A9, obj, 2, "corkonoff", 1.0)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,
    ["wine"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "p_bottlewine01x"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("PrimaryItem"),
            item_interaction_state_name_hash = GetHashKey("USE_LARGE_BOTTLE_QUICK_RIGHT_HAND"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,
    
    ["cigaratte"] = function(propname, cb)
        FXLockInventory()
        CigaretteEvent(propname)
        FXUnlockInventory()    
        cb(true)
    end,
    ["cigar"] = function(propname, cb)
        FXLockInventory()
        CigarEvent()
        FXUnlockInventory()   
        cb(true)
    end,
    ["pipe"] = function(propname, cb)
        FXLockInventory()
        PipeEvent()
        FXUnlockInventory()   
        cb(true)
    end,
    ["horse"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0xCD181A959CFDD7F4, ped, GetMount(ped), GetHashKey("Interaction_Food"), propname, 1)
        SetTimeout(3000, function()
            FXUnlockInventory()   
            cb(true)
        end)
    end,
    ["inject"] = function(propname, cb)
        FXLockInventory()
        local ped, prop = PlayerPedId(), propname or "mp007_p_mp_syringe01x_1"
        local obj = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, false)
        local netId = ObjToNet(obj)
    
        for i = 1, 50 do
            if NetworkDoesNetworkIdExist(netId) and NetworkGetEntityIsNetworked(obj) then break end
            NetworkRegisterEntityAsNetworked(obj)
            Wait(10)
        end
    
        if not NetworkDoesNetworkIdExist(netId) then DeleteEntity(obj) FXUnlockInventory() cb(false) return end
        SetNetworkIdExistsOnAllMachines(netId, true)
    
        local animData = {
            netId = netId,
            prop = prop,
            inventory_item_hash = -1199896558,
            item_interaction_propId_hash = GetHashKey("PrimaryItem"),
            item_interaction_state_name_hash = GetHashKey("USE_STIMULANT_INJECTION_QUICK_LEFT_HAND"),
            item_interaction_flags = 0
        }
    
        TriggerServerEvent("fx-items:server:syncTaskItemInteract", animData)
        TaskItemInteraction_2(ped, animData.inventory_item_hash, obj, animData.item_interaction_propId_hash, animData.item_interaction_state_name_hash, 1, animData.item_interaction_flags, -1.0)
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    
        CreateThread(function()
            while true do
                Wait(500)
                if IsPedRunningTaskItemInteraction(ped) == 0 then
                    if DoesEntityExist(obj) then DeleteEntity(obj) end
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({ text = Locale("usableitem"), type = "success", time = 4000 })
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end)
    end,
    
    ["horseinject"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0xCD181A959CFDD7F4, ped, GetMount(ped), GetHashKey("Interaction_Injection_Quick"), GetHashKey(propname), 1)
        SetTimeout(3000, function()
            FXUnlockInventory()   
            cb(true)
        end)
    end,
    ["horsebrush"] = function(propname, cb)
        FXLockInventory()
        local player = PlayerPedId()
        local coords = GetEntityCoords(player) 
        local targetHorse = nil
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, coords, 2.0, itemSet, 1, Citizen.ResultAsInteger())

        local function Brush(player, horse)
            Citizen.InvokeNative(0xCD181A959CFDD7F4, player, horse, GetHashKey("INTERACTION_BRUSH"), 0, 0)
            Wait(6000)
            ClearPedEnvDirt(horse)
            ClearPedBloodDamage(horse)
            ClearPedDamageDecalByZone(horse, 10, "ALL")
            Citizen.InvokeNative(0xD8544F6260F5F01E, horse, 10)
        end
    
        if IsPedOnMount(player) then
            local horse = GetMount(player)
            Brush(player, horse) 
            FXUnlockInventory()   
            cb(true)
            return
        end

        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet)
                if DoesEntityExist(entity) and not IsPedAPlayer(entity) then
                    if GetPedType(entity) == 28 then
                        local model = GetEntityModel(entity)
                        if Citizen.InvokeNative(0x772A1969F649E902, model) == 1 then 
                            targetHorse = entity
                            break
                        end
                    end
                end
            end
        end
    
        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    
        if targetHorse then
            Brush(player, targetHorse)
            FXUnlockInventory()  
            cb(true)
        else
            Notify({text="There's no horse to interact with!", type="error", time=4000})
            FXUnlockInventory()  
            cb(false)
        end
    end,
}

Config.DoAnim = function(itemName, animName, cb)
    if not Config.Animations[animName] then
        print("Animation not found:", animName)
        return
    end
    
    Config.Animations[animName](Config.Consumables[itemName].prop, function(animState)
        if animState then
            cb(true) 
        else
            cb(false)
        end
    end)
end
