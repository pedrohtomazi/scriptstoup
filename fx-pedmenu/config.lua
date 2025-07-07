Config = {}
Config.Language = "en"
Config.OpenMenu = "pedmenu"   -- /pedmenu (command)
Config.Webhook = {
    WebhookChannel = "https://discord.com/api/webhooks/1234588872894316646/4f4fx0n5r8saWPxZayHA5esYT6dUqn42TXie2TQvZiqiLGdV65cSEG6vlUL-b7dpTzBU",
    logo = "https://upload.fixitfy.com.tr/images/FIXITFY-rXjTlukjzN.png",
    banner = "https://upload.fixitfy.com.tr/images/FIXITFY-EHVJlHZaMJ.png",
}
Config.Locale = {
    ["en"] = {           
        ["successrequest"] = "Your ped request has been received. It needs to be approved by admin.",           
        ["alreadyrequest"] = "You already have a request for this ped!",           
        ["confirmrequest"] = "Ped request approved. Ped sent to the player's notebook",           
        ["cancelrequest"] = "Ped request denied. Request deleted from data!",           
        ["cooldownrequest"] = "You have recently submitted a request for this ped. Please wait a few seconds before trying again.",
        ["setdefaultped"] = "Default ped set: ${ped}",
        ["pednotfound"] = "No ped found or not yours!",
        ["removedefaultped"] = "You have successfully removed the default status from ped: ${ped}.",
        ["confirmRequestLog"] = "Charid: ${charid}'s ${day} day request for ped ${ped} has been approved",    
    }
}

-- Do not enter more than 5 values here because the book design is adjusted accordingly. You can modify these values. 
-- They should be sorted from lower value to higher value. 
-- Don't touch if you don't know what you are dealing with
-- Minimum 1 maximum 5 values. For example, you can leave only 3 day options
Config.PedTimeSettings = {
    [1] = 1, -- Day
    [2] = 7, -- Day
    [3] = 30, -- Day
    [4] = 60, -- Day
    [5] = 90, -- Day
}

Config.UseWeaponKidPeds = true -- If true, child peds can use weapons
Config.whitelistKidWeapons = {
    [GetHashKey("WEAPON_MELEE_KNIFE")] = true,
    [GetHashKey("WEAPON_FISHINGROD")] = true,
    [GetHashKey("WEAPON_THROWN_TOMAHAWK")] = true,
    [GetHashKey("WEAPON_MELEE_LANTERN")] = true
}


Config.KidPedModels = {
    ["a_m_y_nbxstreetkids_01"] = true,
    ["a_m_y_nbxstreetkids_slums_01"] = true,
    ["a_m_y_sdstreetkids_slums_02"] = true,
    ["cs_mixedracekid"] = true,
    ["cs_rhodeskidnapvictim"] = true,
    ["cs_sd_streetkid_01"] = true,
    ["cs_sd_streetkid_01a"] = true,
    ["cs_sd_streetkid_01b"] = true,
    ["cs_sd_streetkid_02"] = true,
    ["cs_sdstreetkidthief"] = true,
    ["u_m_y_shackstarvingkid_01"] = true
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

Config.RefreshCharacter = function(data)
    -- Inside the data table is the data from the callback in s/opensource.lua. You can edit it if you want to do something special
    if Framework == "RSG" then
        ExecuteCommand("loadskin")
    elseif Framework == "VORP" then
        ExecuteCommand("rc")
    end
end

Config.AfterSetPlayerModel = function()
	--- Here you can add your own codes after the model of the ped has changed
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