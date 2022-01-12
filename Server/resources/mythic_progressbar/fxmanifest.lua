fx_version 'adamant' -- fx versiyonunu cekiyor, burasi degismiyor simdilik. (zorunlu)

game 'gta5' -- oyunu cekiyor. zorunlu rdr de yazılabilir ancak o zaman gta 5'te kullanamazsınız scripti.

ui_page('html/index.html') 

client_scripts {
    'client/main.lua'
}

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js'
}