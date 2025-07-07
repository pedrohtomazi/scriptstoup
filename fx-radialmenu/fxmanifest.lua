fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'Fixitfy Advanced Radialmenu'
author 'Fixitfy'
version '1.3'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    'blipsconfig.lua',
    'locales/en.lua',
    "framework/*.lua", 
    --'@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
    "versionchecker.lua"
}

files {
    'html/index.html',
    'html/css/main.css',
    'html/css/duel.css',
    'html/js/main.js',
    'html/js/duel.js',
    'html/js/RadialMenu.js',
    'html/img/*.png',
    'html/sound/*'
}

escrow_ignore {
    'config.lua',
    'blipsconfig.lua',
    'stream/*',
    'framework/*.lua',
    'locales/*.lua',
    'client/opensource.lua',
    'server/commands.lua',
    "versionchecker.lua"
}

dependencies {
    'fx-input'
}

lua54 'yes'

dependency '/assetpacks'
dependency '/assetpacks-redm'