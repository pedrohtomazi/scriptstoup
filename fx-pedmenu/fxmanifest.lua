fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'Fixitfy Advanced Ped Menu'
author "Fixitfy Development"
version "1.2"
lua54 'yes'

shared_scripts {
	"framework/*.lua",
    'config.lua',
    'peds.lua'
}
client_script {
	'c/*.lua',
}

server_script {
	's/*.lua',
	"versionchecker.lua"
}
ui_page 'ui/index.html'

files {
    'ui/**/*',
    'ui/assets/img/*',
}

escrow_ignore {
    'config.lua',
    'peds.lua',
    'versionchecker.lua',
    'framework/*.lua',
    'c/opensource.lua',
    's/opensource.lua'
}
dependency '/assetpacks'