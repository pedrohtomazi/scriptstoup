fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'Fixitfy Store System'
author "Fixitfy Development"
version '2.8' 

shared_script {
    'config.lua',
    'framework/frameworks.lua',
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

escrow_ignore {
    'config.lua',
    'c/opensource.lua',
    's/opensource.lua',
    'versionchecker.lua',
    'framework/*.lua'
}

lua54 'yes'
ui_page 'ui/index.html'

files {
    'ui/**/*',
}

dependency '/assetpacks'