fx_version 'adamant' -- fx versiyonunu cekiyor, burasi degismiyor simdilik. (zorunlu)

game 'gta5' -- oyunu cekiyor. zorunlu rdr de yazılabilir ancak o zaman gta 5'te kullanamazsınız scripti.

description 'ESX Menu Default'

version '1.0.4'

client_scripts {
	'@es_extended/client/wrapper.lua',
	'client/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/app.css',
	'html/js/mustache.min.js',
	'html/js/app.js',
	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf'
}

dependencies {
	'es_extended'
}
