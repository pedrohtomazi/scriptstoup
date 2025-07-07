Config = {}
Config.Webhook = {
  url = "", -- Discord webhook channel
  logo = "https://upload.fixitfy.com.tr/images/FIXITFY-rXjTlukjzN.png",
  banner = "https://upload.fixitfy.com.tr/images/FIXITFY-EHVJlHZaMJ.png",
  color = 16775871
}
Config.Language = "en"
Config.Locale = {
  ["en"] = {
    ["requireditems"] = "you need ${count}x ${label} to generate the item",
    ["startcraft"] = "Craft Started ! Check Craft Order",
    ["error"] = "An error occurred!",
    ["takeitem"] = "${count}x ${item} added to your inventory!",
    ["carry"] = "You can't carry it any longer!",
    ["nojob"] = "You don't have the necessary job to do this!",
    ["nolucky"] = "You failed the item craft!",
    ["promptlabel"] = "Craft Book",
    ["bookisclose"] = "You can't open the book now! You have to wait..",
    ["dont_have_perm"] = "You don't have permission to read this book!",
    ["orderfull"] = "You can't produce more! Wait for your other orders to finish!",
    ["nostockforthisitem"] = "No more of this item can be crafted!",
    ["badluck"] = "Craft failed due to bad luck. The item has been lost!",
    ["errorreqitems"] = "ID:${id} does not meet the required items but is attempting to produce. Check the player !",
  },
}

Config.Levels = {
  [1] = 1000,[2] = 2000,[3] = 3000,[4] = 4000,[5] = 5000,[6] = 6000,[7] = 7000,[8] = 8000,[9] = 9000,
}
Config.DefaultImage = "/ui/assets/img/craftman.png"

Config.OrderListLimit = 10 -- Set a limit on the players' order list
Config.pedSpawnDistance = 30 -- Adjust the spawn distance if you use peds
Config.ItemLimit = { -- Limit the maximum number of times an item can be crafted on the entire server in a restart. For example, players will only be able to produce 10 bandages in total. The stock will be replenished after the restart.
  ["bandage"] = 10,
}

--- NEW ---
Config.CraftSecurity = false --- If true, prevents data modified via nuidevtools from being modified.
Config.DropPlayerNuiCheater = false -- ## Cheaters who try to modify recipes and data through NuiDevtools. Set this to true if you want them to be kicked out of the game.

Config.HandCraftSettings = {
  handCraft = true, --If true, production enters animation and instantly crafts the item if the minimumCraftTime value is less than the specified seconds.
  minimumCraftTime = 5, -- Maximum production time required for manual production (If a product's production time is 61, it goes to the order list.)
}

Config.HideHud = function()
  if GetResourceState("fx-hud") == "started" then
      exports["fx-hud"]:hideHud()
  end
end

Config.ShowHud = function()
  if GetResourceState("fx-hud") == "started" then
      exports["fx-hud"]:showHud()
  end
end

Config.ItemCraftBooks = {
  ["craftbook"] = {
    bookImage = "/ui/assets/img/craftman.png",
    Jobs = false, -- or | Jobs = {["sheriff"]=0, ["sheriff2"] = 0},
    craftData = Craft.CraftItems
  },
  ["sheriffbook"] = {
    bookImage = "/ui/assets/img/craftman.png",
    Jobs = {["sheriff"]=0, ["sheriff2"] = 0}, -- or | Jobs = false,
    craftData = Craft.CraftItems
  },
}

Config.PropCraftBook = {
  ["p_campfire01x"] = {
    bookImage = "/ui/assets/img/craftman.png",
    Jobs = false, -- or | Jobs = {["sheriff"]=0, ["sheriff2"] = 0},
    craftData = Craft.CraftItems
  },
  ["p_campfire03x"] = {
    bookImage = "/ui/assets/img/craftman.png",
    Jobs = false, -- or | Jobs = {["sheriff"]=0, ["sheriff2"] = 0},
    craftData = Craft.CraftItems
  },
  ["p_tablecul01x"] = {
    bookImage = "/ui/assets/img/craftman.png",
    Jobs = false, -- or | Jobs = {["sheriff"]=0, ["sheriff2"] = 0},
    craftData = Craft.CraftItems
  },
}


-- This is the feature that allows you to access the craft book with these fixed coordinates.
Config.CraftBooks = {
  ["doctorbook"] = {
    bookID = "FX-1000",
    Settings = {
      image = "/ui/assets/img/craftman.png",
      joblocked = {["doctor"]=0}, -- Required Job or joblocked = false
      -- joblocked = false, -- Required Job or joblocked = false
      ped = true,
      model = "u_m_m_rhddoctor_01",
      coords = {
        vector4(-819.6582, -1328.5813, 43.7179, 184.6558),
      },
      promptitle = "Doctor Craft Book",
      distance = 2, -- Prompt visibility distance
      ---- PED SCENARIO AND ANİM ----
      pedScenario = "WORLD_HUMAN_WRITE_NOTEBOOK",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
      anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
      }, 
      ---- BLIP ---
      showblip = true,
      blipname = "Doctor Craft Book",
      blipsprite = -1656531561,
      blipscale = 0.6,
      blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
      ----- Craft Book Interact -------
      bookTimeSettings = {                                          --## You can set when the book opens and closes.
        allowed = false,                                            --## If you do false, the book will always be open
        open = 8,
        close = 21,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the book is closed
      },
      NPC = {}, -- dont touch
    },
    Categories = Craft.DoctorBookItems,
  },
  ["sheriffbook"] = {
    bookID = "FX-1001",
    Settings = {
      image = "/ui/assets/img/craftman.png",
      joblocked = {["sheriff"]=0}, -- Required Job or joblocked = false
      -- joblocked = false, -- Required Job or joblocked = false
      ped = true,
      model = "u_m_m_rhddoctor_01",
      coords = {
        vector4(-758.3670, -1276.5972, 44.0777, 270.4206),
      },
      promptitle = "Sheriff Craft Book",
      distance = 2, -- Prompt visibility distance
      ---- PED SCENARIO AND ANİM ----
      pedScenario = "WORLD_HUMAN_WRITE_NOTEBOOK",            --## Ped scenario /You can add optionally. You can delete the code or turn it false
      anim = {                                                       --## Choose between scenarios or animation. Someone has to be false / You can add optionally. You can delete the code or turn it false
        animDict = '',                                                 --## Gives priority to scenario, if you set the scenarios to false, the anim will work. (pedScenario = false pedScenarioNight = false)
        animName = ''                                                  --## Choose animation or disable animation by putting false in animDict or animName https://rdr2.mooshe.tv/animations/
      }, 
      ---- BLIP ---
      showblip = true,
      blipname = "Sheriff Craft Book",
      blipsprite = -1656531561,
      blipscale = 0.6,
      blipmodifier = "BLIP_MODIFIER_MP_COLOR_32",
      ----- Craft Book Interact -------
      bookTimeSettings = {                                          --## You can set when the book opens and closes.
        allowed = false,                                            --## If you do false, the book will always be open
        open = 8,
        close = 21,
        blipmodifier = "BLIP_MODIFIER_MP_COLOR_2"                  --## blip colour when the book is closed
      },
      NPC = {}, -- dont touch
    },
    Categories = Craft.SheriffBook
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