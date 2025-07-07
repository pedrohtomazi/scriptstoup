function sendWebhook(src, title, color)
    local ids = {
         steam = "",
         ip = "",
         discord = "",
         license = "",
         xbl = "",
         live = ""
     }
 
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
     local avatar = "https://upload.fixitfy.com.tr/images/FIXITFY-rXjTlukjzN.png"
     local desc = ("\n**__User Information__**\n\n**Player Name:** [%d] %s\n**Discord:** <@%s>\n**Steam Hex:** %s\n**Steam Profile:** https://steamcommunity.com/profiles/%d\n**Rockstar ID:** %s"):format(tonumber(src), GetPlayerName(src), ids.discord:gsub("discord:", ""), ids.steam, tonumber(ids.steam:gsub("steam:", ""), 16), ids.license)
     local embedData = {
         {
             ['title'] = title,
             ['color'] = color,
             ['footer'] = {
                 ['text'] = 'Fixitfy Development Team',
             },
             ['timestamp'] = os.date('!%Y-%m-%dT%H:%M:%SZ'),
             ['description'] = desc,
             ['image'] = {
                 ['url'] = 'https://media.discordapp.net/attachments/1108845226233184377/1162869813253767198/Background.png?ex=65f613e8&is=65e39ee8&hm=ac3424d7959a03ffa38aa8d67938fa9e2106ed810b5d87812eb47681e6a6ed08&',
             },
             ['author'] = {
                 ['name'] = 'FX-Storerobbery',
                 ['icon_url'] = 'https://cdn.discordapp.com/attachments/1108845226233184377/1202550140703875102/FX-LOGO1024X1024.png?ex=65f2c717&is=65e05217&hm=3752b604da9a5f2e1cffa3caf44b85ce5f6dcd7c73b8bf0cbeffdce39fe5868a&',
             },
         }
     }
 
     PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({ username = 'FX-Storerobbery Logger', embeds = embedData, avatar_url = avatar }), { ['Content-Type'] = 'application/json' })
end
