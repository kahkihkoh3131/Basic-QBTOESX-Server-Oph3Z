Config = {}

Config.Shops = { 

    
  ['LSPD Silah Marketi'] = {
    label = "LSPD Silah Marketi",
    coords = {
        vector3(451.877, -980.48, 30.6893)
    },
    Shop = {
    items = {
        [1] = { name = "weapon_pistol", price = 1, count = 100,  info = {},  type = "weapon", slot = 1, },
        [2] = { name = "weapon_appistol", price = 1, count = 100,  info = {},  type = "weapon", slot = 2, },
        [3] = { name = "weapon_minismg", price = 1, count = 100,  info = {},  type = "weapon", slot = 3, },
        [4] = { name = "pistol_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 4, },
        [5] = { name = "smg_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 5, },
        [6] = { name = "rifle_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 6, },
        [7] = { name = "weapon_nightstick", price = 1, count = 100,  info = {},  type = "weapon", slot = 7, },
        [8] = { name = "weapon_stungun", price = 1, count = 100,  info = {},  type = "weapon", slot = 8, },
        [9] = { name = "weapon_carbinerifle", price = 1, count = 100,  info = {},  type = "weapon", slot = 9, },



    },
    markerType = 2,
    markerSize = vector3(0.2, 0.2, 0.2),
    markerColour = { r = 255, g = 255, b = 255 },
    use3dtext = true,
    msg =  '[E] - Silah Marketi',
    blip = false, --{id = 521, scale = 0.5, color = 3, title = 'Teknoloji Market'},
    job = {'police'}
 }

},

  ['Silahçı'] = {
    label = "Silahçı",
    coords = {
        vector3(21.96286, -1107.06, 29.797),
        vector3(842.0750, -1033.88, 28.194),
        vector3(251.99, -49.82, 68.94),
        vector3(-662.32, -935.23, 20.83),
        vector3(810.05, -2156.93, 28.62),
        vector3(2567.76,294.63,107.74),
        vector3(1693.83,3759.77,33.81),
        vector3(-1117.45,2698.58,17.55),
        vector3(-330.24,6083.88,30.55),
    },
    Shop = {
    items = {
        [1] = { name = "weapon_pistol", price = 1, count = 100,  info = {},  type = "weapon", slot = 1, },
        [2] = { name = "weapon_appistol", price = 1, count = 100,  info = {},  type = "weapon", slot = 2, },
        [3] = { name = "weapon_minismg", price = 1, count = 100,  info = {},  type = "weapon", slot = 3, },
        [4] = { name = "weapon_carbinerifle", price = 1, count = 100,  info = {},  type = "weapon", slot = 4, },
        [5] = { name = "weapon_stungun", price = 1, count = 100,  info = {},  type = "weapon", slot = 5, },
        [6] = { name = "pistol_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 6, },
        [7] = { name = "smg_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 7, },
        [8] = { name = "rifle_ammo", price = 1, count = 100,  info = {},  type = "weapon", slot = 8, },
        [9] = { name = "weapon_nightstick", price = 1, count = 100,  info = {},  type = "weapon", slot = 9, },

    },
    markerType = 2,
    markerSize = vector3(0.2, 0.2, 0.2),
    markerColour = { r = 255, g = 255, b = 255 },
    use3dtext = true,
    msg =  '[E] - Silahçı',
    blip = true,
    id = 470,
    scale = 0.5,
    color = 1,
    title = 'Silahçı',
    job = {'all'}
 }
},

  ['EMS Market'] = {
    label = "EMS Market",
    coords = {
        vector3(310.992, -565.89, 43.2840)
    },
    Shop = {
    items = {
        [1] = { name = "medikit", price = 100, count = 1,  info = {},  type = "item", slot = 1, },
        [2] = { name = "bandage", price = 100, count = 1,  info = {},  type = "item", slot = 2, },
    },
    markerType = 2,
    markerSize = vector3(0.2, 0.2, 0.2),
    markerColour = { r = 255, g = 255, b = 255 },
    use3dtext = true,
    msg =  '[E] - EMS Marketi',
    blip = false, --{id = 59, scale = 0.5, color = 2, title = 'Market'},
    job = {'ambulance'}
 }
},

  

    ['Market'] = {
        label = "Market",
        coords = {
            vector3(25.95, -1347.27, 29.5),
            vector3(373.875, 325.896, 103.566),
            vector3(2557.458, 382.282, 106.622),
            vector3(-3038.939, 585.954, 7.908),
            vector3(-3241.927, 1001.462, 12.830),
            vector3(547.431, 2671.710, 42.156),
            vector3(1961.464, 3740.672, 32.343),
            vector3(2678.916, 3280.671, 55.241),
            vector3(1729.563, 6414.126, 36.037),
            vector3(-48.519, -1757.514, 29.421),
            vector3(1163.373, -323.801, 68.205),
            vector3(-707.501, -914.260, 19.215),
            vector3(-1820.523, 792.518, 138.118),
            vector3(1698.388, 4924.404, 42.063),
            vector3(1135.808, -982.281, 46.415),
            vector3(-1487.553, -379.107, 40.163),
            vector3(-2968.243, 390.910, 15.043),
            vector3(1166.024, 2708.930, 38.157),
            vector3(1392.562, 3604.684, 34.980),
        },
        Shop = {
        items = {
            [1] = { name = "phone", price = 100, count = 100,  info = {},  type = "item", slot = 1, },
            [2] = { name = "water", price = 100, count = 100,  info = {},  type = "item", slot = 2, },
        },
        markerType = 2,
        markerSize = vector3(0.2, 0.2, 0.2),
        markerColour = { r = 255, g = 255, b = 255 },
        use3dtext = true,
        msg =  '[E] - Market',
        blip = true,
        id = 59,
        scale = 0.5,
        color = 2,
        title = 'Market',
        job = {'all'}
     }
  }

}

Config.Stashs = {

    ['LSPD Deposu'] = {   
        label = "LSPD Deposu",                                         
        coords = {vector3(481.209, -995.30, 30.6898)},   
        Stash = {    
        useMarker = true, 
        markerType = 2,  
        markerSize = vector3(0.2, 0.2, 0.2),
        markerColour = { r = 255, g = 255, b = 255 },
        use3dtext = true,
        msg = '[E] - LSPD Deposu',
        job = 'police',
        maxweight = 1000 -- if u use weight, uncomment this line
    },
},

-- ['Sheriff Deposu'] = {   
--     label = "Sheriff Deposu",                                         
--     coords = {vector3(-449.84, 6010.36, 31.7163)},   
--     Stash = {    
--     useMarker = true, 
--     markerType = 2,  
--     markerSize = vector3(0.2, 0.2, 0.2),
--     markerColour = { r = 255, g = 255, b = 255 },
--     use3dtext = true,
--     msg = '[E] - Sheriff Deposu',
--     job = 'sheriff',
--     maxweight = 1000 -- if u use weight, uncomment this line
-- },
-- },

--     ['Ballas Deposu'] = {   
--         label = "Ballas Deposu",                                         
--         coords = {vector3(116.928, -1962.9, 21.3223)},   
--         Stash = {    
--         useMarker = true, 
--         markerType = 2,  
--         markerSize = vector3(0.2, 0.2, 0.2),
--         markerColour = { r = 255, g = 255, b = 255 },
--         use3dtext = true,
--         msg = '[E] - Ballas',
--         job = 'ballas',
--         maxweight = 1000 -- if u use weight, uncomment this line
--     },
-- },

--     ['Vagos Deposu'] = {   
--         label = "Vagos Deposu",                                         
--         coords = {vector3(345.003, -2021.9, 22.3949)},   
--         Stash = {    
--         useMarker = true, 
--         markerType = 2,  
--         markerSize = vector3(0.2, 0.2, 0.2),
--         markerColour = { r = 255, g = 255, b = 255 },
--         use3dtext = true,
--         msg = '[E] - Vagos',
--         job = 'vagos',
--         maxweight = 1000 -- if u use weight, uncomment this line
--     },
-- },

--     ['Grove Deposu'] = {   
--         label = "Grove Deposu",                                         
--         coords = {vector3(-143.56, -1596.8, 34.8314)},   
--         Stash = {    
--         useMarker = true, 
--         markerType = 2,  
--         markerSize = vector3(0.2, 0.2, 0.2),
--         markerColour = { r = 255, g = 255, b = 255 },
--         use3dtext = true,
--         msg = '[E] - Grove',
--         job = 'grove',
--         maxweight = 1000 -- if u use weight, uncomment this line
--     },
-- },

    ['EMS Depo'] = {   
        label = "EMS Depo",                                         
        coords = {vector3(312.184, -562.03, 43.2839)},   
        Stash = {    
        useMarker = true, 
        markerType = 2,  
        markerSize = vector3(0.2, 0.2, 0.2),
        markerColour = { r = 255, g = 255, b = 255 },
        use3dtext = true,
        msg = '[E] - EMS Depo',
        job = 'ambulance',
        maxweight = 1000 -- if u use weight, uncomment this line
    },
}
   
}