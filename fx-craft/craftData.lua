-- If you want to bind to an item, create a table like the one below.
Craft = {}

CraftAnims = {
  ["standart"] = {
    { dict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@kneelfirecraftcup@male_a", anim = "kneelfirecraftcup_trans_kneel1", dur = 5000 },
    { dict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@kneelpostfirecraft@male_a", anim = "kneelpostfirecraft_trans_stow", dur = 5000 },
    { dict = "mech_inventory@crafting@fallbacks@in_hand@male_a", anim = "craft_trans_stow", dur = 5000 },
    { dict = "mech_inventory@crafting@fallbacks@in_hand@male_a", anim = "hold_trans_inspect", dur = 5000 },
    { dict = "mech_inventory@crafting@fallbacks@modify_arrows", anim = "loop", dur = 5000 },
  },
}

RequiredItems = {
  ["consumable"] = {
    {itemName = "water", itemLabel = "Water", itemCount = 1},
    {itemName = "bread", itemLabel = "Bread", itemCount = 1},
  },
  ["material"] = {
    {itemName = "goldnugget", itemLabel = "Gold Nugget", itemCount = 1},
  },
}

Recipes = {
  ["water"] = {itemName="water",itemLabel="Water",requiredJobs=false,rewardXP=10,duration=10,lucky=100,requiredLevel=1,itemAmount=1,handCraft= true,handCraftAnims=CraftAnims["standart"],spawnProp="p_bag01x",timeStack=false,xpStack=false,requiredItems=RequiredItems["consumable"]},
  ["bread"] = {itemName="bread",itemLabel="Bread",requiredJobs=false,rewardXP=10,duration=10,lucky=100,requiredLevel=1,itemAmount=1,handCraft= true,handCraftAnims=CraftAnims["standart"],spawnProp="p_bag01x",timeStack=false,xpStack=false,requiredItems=RequiredItems["consumable"]},
}

Craft.SheriffBook = {
  ["tools"] = {
    label = "Tools",
    image = "/ui/assets/img/schofieldblueprint.png",
    items = {
      {
        itemName = "water",
        itemLabel = "Water",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        handCraft = true, --if true, this item will not go to the order list but will be produced directly in the ped's hand instantly
        spawnProp = "p_bag01x", -- or spawnProp = false, (if the handCraft setting is true, edit this setting)
        timeStack = false, --If true, production enters animation and instantly crafts the item if the minimumCraftTime value is less than the specified seconds.
        requiredItems = {
          {itemName = "water", itemLabel = "Water", itemCount = 1},
        }
      },
    }
  },
  ["materials"] = {
    label = "Materials",
    image = "/ui/assets/img/goldbar.png",
    items = {
      {
        itemName = "goldbar",
        itemLabel = "Gold Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "goldnugget", itemLabel = "Gold Nugget", itemCount = 2},
        }
      },
      {
        itemName = "silverbar",
        itemLabel = "Silver Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "silverore", itemLabel = "Silver Ore", itemCount = 2},
        }
      },
      {
        itemName = "ironbar",
        itemLabel = "Iron Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "ironore", itemLabel = "Iron Ore", itemCount = 2},
        }
      },
    }
  },
  ["consumables"] = {
    label = "Consumables",
    image = "/ui/assets/img/alcool.png",
    items = {
      {
        itemName = "alcoholbottle",
        itemLabel = "Alchol Bottle",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
        }
      },
    }
  },
}

Craft.CraftItems = {
  ["tools"] = {
    label = "Tools",
    image = "/ui/assets/img/schofieldblueprint.png",
    items = {Recipes["water"], Recipes["bread"]}
  },
  ["materials"] = {
    label = "Materials",
    image = "/ui/assets/img/goldbar.png",
    items = {
      {
        itemName = "goldbar",
        itemLabel = "Gold Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "goldnugget", itemLabel = "Gold Nugget", itemCount = 2},
        }
      },
      {
        itemName = "silverbar",
        itemLabel = "Silver Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "silverore", itemLabel = "Silver Ore", itemCount = 2},
        }
      },
      {
        itemName = "ironbar",
        itemLabel = "Iron Bar",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "ironore", itemLabel = "Iron Ore", itemCount = 2},
        }
      },
    }
  },
  ["consumables"] = {
    label = "Consumables",
    image = "/ui/assets/img/alcool.png",
    items = {
      {
        itemName = "alcoholbottle",
        itemLabel = "Alchol Bottle",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
        }
      },
    }
  },
  ["weapons"] = {
    label = "Weapons",
    image = "/ui/assets/img/weapon_sniperrifle_carcano.png",
    items = {
      ["melee"] = {
        {
          itemName = "WEAPON_MELEE_KNIFE",
          itemLabel = "KNIFE",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["bow"] = {
        {
          itemName = "WEAPON_BOW",
          itemLabel = "BOW",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["misc"] = {
        {
          itemName = "WEAPON_LASSO",
          itemLabel = "Lasso",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_MELEE_LANTERN",
          itemLabel = "Lantern",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["throwable"] = {
        {
          itemName = "WEAPON_THROWN_THROWING_KNIVES",
          itemLabel = "THROWING KNIVES",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["shotgun"] = {
        {
          itemName = "WEAPON_SHOTGUN_SAWEDOFF",
          itemLabel = "SAWEDOFF SHOTGUN",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_SHOTGUN_REPEATING",
          itemLabel = "REPEATING SHOTGUN",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["revolver"] = {
        {
          itemName = "WEAPON_REVOLVER_NAVY",
          itemLabel = "NAVY REVOLVER",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_REVOLVER_SCHOFIELD",
          itemLabel = "SCHOFIELD REVOLVER",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["pistol"] = {
        {
          itemName = "WEAPON_PISTOL_VOLCANIC",
          itemLabel = "Volvanic Pistol",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_PISTOL_SEMIAUTO",
          itemLabel = "SEMIAUTO Pistol",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["repeaters"] = {
        {
          itemName = "WEAPON_REPEATER_WINCHESTER",
          itemLabel = "WINCHESTER REPEATER",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_REPEATER_HENRY",
          itemLabel = "HENRY REPEATER",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
      ["rifle"] = {
        {
          itemName = "WEAPON_SNIPERRIFLE_CARCANO",
          itemLabel = "SNIPERRIFLE CARCANO",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
        {
          itemName = "WEAPON_RIFLE_ELEPHANT",
          itemLabel = "ELEPHANT RIFLE",
          rewardXP = 10,
          duration = 10,
          lucky = 100,
          requiredLevel = 1,
          itemAmount = 1,
          requiredItems = {
            {itemName = "wood", itemLabel = "Wood", itemCount = 2},
            {itemName = "ironbar",itemLabel = "Iron Bar",itemCount = 1},
          }
        },
      },
    }
  },
}

Craft.DoctorBookItems = {
    ["Potion"] = { --- CATEGORIES
    label = "Heal",
    image = "/ui/assets/img/bandage.png",
    items = {
      {
        itemName = "bandage",
        itemLabel = "Bandage",
        requiredJobs = {["doctor"]=0}, --- or false
        rewardXP = 100,
        requiredLevel = 1,
        itemAmount = 1, -- NEW
        duration = 40, -- Second
        lucky = 100, -- Holds numbers between 1 and 100. If the number is higher than the specified number, the item crafting will fail!
        requiredItems = {
          {itemName = "wood",itemLabel = "Wood",itemCount = 1,dontremove = false},
        }
      },
      {
        itemName = "WEAPON_KIT_BINOCULARS_IMPROVED",
        itemLabel = "Improved Binoculars",
        rewardXP = 250,
        duration = 15,
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        requiredItems = {
          {itemName = "WEAPON_KIT_BINOCULARS", itemLabel = "Binoculars", itemCount = 1},
          {itemName = "ironbar", itemLabel = "Iron Bar", itemCount = 2},
          {itemName = "wood",itemLabel = "Soft Wood",itemCount = 1}
        }
      }
    }
  },
  ["medic"] = { --- NEW CATEGORIES
    label = "Medic",
    image = "/ui/assets/img/consumable_meat_salt.png",
    items = {
      {
        itemName = "water",
        itemLabel = "Water",
        requiredJobs = false,
        rewardXP = 10,
        duration = 10, -- Second
        lucky = 100,
        requiredLevel = 1,
        itemAmount = 1,
        handCraft = true, --if true, this item will not go to the order list but will be produced directly in the ped's hand instantly
        handCraftAnims = {
          { dict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@kneelfirecraftcup@male_a", anim = "kneelfirecraftcup_trans_kneel1", dur = 5000 },
          { dict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@kneelpostfirecraft@male_a", anim = "kneelpostfirecraft_trans_stow", dur = 5000 },
          { dict = "mech_inventory@crafting@fallbacks@in_hand@male_a", anim = "craft_trans_stow", dur = 5000 },
          { dict = "mech_inventory@crafting@fallbacks@in_hand@male_a", anim = "hold_trans_inspect", dur = 5000 },
          { dict = "mech_inventory@crafting@fallbacks@modify_arrows", anim = "loop", dur = 5000 },
        },
        spawnProp = "p_bag01x", -- or spawnProp = false, (if the handCraft setting is true, edit this setting)
        timeStack = false, --If true, production enters animation and instantly crafts the item if the minimumCraftTime value is less than the specified seconds.
        xpStack = false, --If true, production enters animation and instantly crafts the item if the minimumCraftTime value is less than the specified seconds.
        requiredItems = {
          {itemName = "water", itemLabel = "Water", itemCount = 1},
        }
      },
    }
  },
}