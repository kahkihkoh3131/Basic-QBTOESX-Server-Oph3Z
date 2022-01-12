fx_version 'adamant' -- fx versiyonunu cekiyor, burasi degismiyor simdilik. (zorunlu)

game 'gta5' -- oyunu cekiyor. zorunlu rdr de yazılabilir ancak o zaman gta 5'te kullanamazsınız scripti.

description 'ESX Menu Dialog'

version '1.1.0'

client_script 'client/main.lua'

ui_page 'html/ui.html'

files {
	'html/ui.html',

	'html/css/app.css',

	'html/js/mustache.min.js',
	'html/js/app.js',

	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf'
}

dependency 'es_extended'