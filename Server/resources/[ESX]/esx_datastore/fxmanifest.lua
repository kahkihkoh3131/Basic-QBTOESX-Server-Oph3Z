fx_version 'adamant'

game 'gta5'

description 'ESX Data Store'

version 'legacy'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/datastore.lua',
	'server/main.lua'
}
