
fx_version 'adamant'
game 'gta5'

author "Dojwun"
version '1.0.0'
description 'Basic Shop System'
repository 'https://github.com/dojwun/Schedule-Wun'

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts{
    'client/*.lua',
}

server_scripts{
    'server/*.lua',
}


