-- Resource Metadata
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lunar Scripts'
description 'Job centre'
version '1.0.0'

files {
    'locales/*.json'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config/config.lua',
}
client_scripts {
    'config/cl_edit.lua',
    'client/*.lua',
} 
server_scripts {
    'server/*.lua',
} 
