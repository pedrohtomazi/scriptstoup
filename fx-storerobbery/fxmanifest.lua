fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author "Fixitfy"
description 'Fixitfy Store Robbery'
version "1.3"

shared_scripts {
    "config.lua",
    "framework/framework.lua"
}

client_scripts {
    "c/*.lua",
}
server_scripts {
    "s/*.lua",
    "versionchecker.lua"
}

lua54 'yes'

escrow_ignore {
    'config.lua',
    "c/opensource.lua",
    "s/opensource.lua",
    'framework/*.lua',
    "versionchecker.lua"
}
dependency '/assetpacks'