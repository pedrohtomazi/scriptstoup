fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'Fixitfy Craft System'
author "Fixitfy Development"
version "3.5"

shared_script {
    'framework/frameworks.lua',
    'craftData.lua',
    'config.lua',
}

client_scripts {
    "c/c.lua",
    "c/opensource.lua",
}
server_scripts {
    "s/s.lua",
    "s/opensource.lua",
    "versionchecker.lua"
}

ui_page 'ui/index.html'

files {
    'ui/**/*',
}

dependencies {
    'oxmysql'
}

escrow_ignore {
    'config.lua',
    'craftData.lua',
    'versionchecker.lua',
    "c/opensource.lua",
    "s/opensource.lua",
    'framework/*.lua'
}

lua54 'yes'
dependency '/assetpacks'