Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you"re using esx_identity
Config.EnableEUPMenu      		  = true -- turn this on if you want EUP Menu
Config.SavedClothes				  = true -- lsrp saved clothes
Config.EnableLicenses             = true -- enable if you"re using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = "en"

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(999, -998.98, 30.6894) 
		},

		Armories = {
			vector3(999, -998.98, 30.6894)    
		},

		Vehicles = {
			{
				Spawner = vector3(-9999.9999, -9999.9999, -9999.9999),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-9999.9999, -9999.9999, -9999.9999),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		JailActions = {
			vector3(999, -998.98, 30.6894)
		},

		BossActions = {
			vector3(999, -998.98, 30.6894)
		},

		PrivInv = {
			vector3(999, -998.98, 30.6894)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_NIGHTSTICK", price = 0 },
		-- { weapon = "WEAPON_STUNGUN", price = 1500 },
		-- { weapon = "WEAPON_FLASHLIGHT", price = 80 }
	},

	officer = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ADVANCEDRIFLE", components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		-- { weapon = "WEAPON_NIGHTSTICK", price = 0 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	},

	sergeant = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	},

	intendent = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ADVANCEDRIFLE", components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	},

	lieutenant = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ADVANCEDRIFLE", components = { 0, 0, 0, 0, 0, nil }, price = 0 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	},

	chef = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ADVANCEDRIFLE", components = { 0, 0, 0, 0, 0, nil }, price = 1100 },
		-- { weapon = "WEAPON_PUMPSHOTGUN", components = { 0, 0, nil }, price = 640 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	},

	boss = {
		-- { weapon = "WEAPON_APPISTOL", components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		-- { weapon = "WEAPON_ADVANCEDRIFLE", components = { 0, 0, 0, 0, 0, nil }, price = 1100 },
		-- { weapon = "WEAPON_PUMPSHOTGUN", components = { 0, 0, nil }, price = 640 },
		-- { weapon = "WEAPON_ASSAULTSMG", price = 780 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = "police2", label = "Polis Devriye", price = 1 },
		-- { model = "2015polstang", label = "Polis Mustang", price = 1 },
		-- { model = "riot", label = "Polis Riot", price = 1 },
		-- { model = "polraptor", label = "Polise Ford", price = 1 },
		-- { model = "challenger18", label = "Charger", price = 1 },
	},
	recruit = {},

	sergeant = {	
	--	{ model = "16taurus", label = "Lspd Taurus", price = 500 },	
	--	{ model = "11caprice", label = "Lssd İmpala", price = 500 },
	--	{ model = "18tahoe", label = "Lssd Offroad", price = 500 },
	----	{ model = "19durango", label = "Ortak Offroad", price = 500 },
	--	{ model = "sheriff2", label = "Lssd Offroad2", price = 500 },
	--	{ model = "police3", label = "Lssd Suv", price = 500 },
	},

	officer = {
	--	{ model = "16taurus", label = "Lspd Taurus", price = 500 },	
	--	{ model = "11caprice", label = "Lssd İmpala", price = 500 },
		-- { model = "18tahoe", label = "Lssd Offroad", price = 500 },
		-- { model = "19durango", label = "Ortak Offroad", price = 500 },
		-- { model = "sheriff2", label = "Lssd Offroad2", price = 500 },
		-- { model = "police3", label = "Lssd Suv", price = 500 },
	},

	lieutenant = {
	--	{ model = "sheriff2", label = "Lssd Offroad2", price = 500 },
	--	{ model = "18charger", label = "Lspd Charger", price = 100 },
	--	{ model = "18tahoe", label = "Lssd Offroad", price = 500 },
	--	{ model = "19durango", label = "Ortak Offroad", price = 500 },
	--	{ model = "police3", label = "Lssd Suv", price = 500 },
	--	{ model = "16taurus", label = "Lspd Taurus", price = 500 },
	--	{ model = "03expeditionr", label = "Lssd Offroad", price = 1 },
	--	{ model = "pbus", label = "Tutuklu ve Hükümlü Taşımaya Mahsus Cezaevi Aracı",  price = 1000 },
	--	{ model = "riot", label = "SWAT", price = 1},
	},

	chef = {
	--	{ model = "police3", label = "Lssd Suv", price = 500 },
	--	{ model = "sheriff2", label = "Lssd Offroad", price = 500 },
	--	{ model = "sheriff", label = "Lssd Devriye", price = 500 },
	--	{ model = "11caprice", label = "Lssd İmpala", price = 500 },
	--	{ model = "16explorer", label = "Lssd Suv", price = 500 },
	--	{ model = "14charger", label = "Lssd Charger", price = 500 },
	--	{ model = "16taurus", label = "Lspd Taurus", price = 500 },	
	--	{ model = "18charger", label = "Lspd Charger", price = 100 },
	--	{ model = "newvic", label = "Lspd Devriye", price = 500 },
	--	{ model = "19durango", label = "Ortak Offroad", price = 500 },
	},

	boss = {
	--	{ model = "2015polstang", label = "Şef Mustang", price = 1000},
	--	{ model = "14charger", label = "Lssd Charger", price = 500 },
	--	{ model = "18charger", label = "Lspd Charger", price = 100 },
	--	{ model = "16taurus", label = "Lspd Taurus", price = 500 },
	--	{ model = "19durango", label = "Ortak Offroad", price = 500 },
	--	{ model = "11caprice", label = "Lssd İmpala", price = 500 },
	--	{ model = "16explorer", label = "Lssd Suv", price = 500 },
	--	{ model = "18tahoe", label = "Lssd Offroad", price = 500 },
	--	{ model = "pbus", label = "Tutuklu ve Hükümlü Taşımaya Mahsus Cezaevi Aracı",  price = 1000 },
	--	{ model = "riot", label = "SWAT", price = 1},
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{ model = "maverick2", label = "Polis Helikopteri", livery = 0, price = 1 }
	},

	officer = {
		{ model = "maverick2", label = "Polis Helikopteri", livery = 0, price = 1 }
	},

	sergeant = {
		{ model = "maverick2", label = "Polis Helikopteri", livery = 0, price = 1 }
	},

	lieutenant = {
		{ model = "maverick2", label = "Polis Helikopteri", livery = 0, price = 1 }
	},

	boss = {
		{ model = "maverick2", label = "Polis Helikopteri", livery = 0, price = 1 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			["tshirt_1"] = 59,  ["tshirt_2"] = 1,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 0,   ["decals_2"] = 0,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = 46,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 36,  ["tshirt_2"] = 1,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 0,   ["decals_2"] = 0,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = 45,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	officer_wear = {
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 0,   ["decals_2"] = 0,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 0,   ["decals_2"] = 0,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	sergeant_wear = {
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 8,   ["decals_2"] = 1,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 7,   ["decals_2"] = 1,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	intendent_wear = {
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 8,   ["decals_2"] = 2,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 7,   ["decals_2"] = 2,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 8,   ["decals_2"] = 2,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 7,   ["decals_2"] = 2,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	chef_wear = {
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 8,   ["decals_2"] = 3,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 7,   ["decals_2"] = 3,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			["tshirt_1"] = 58,  ["tshirt_2"] = 0,
			["torso_1"] = 55,   ["torso_2"] = 0,
			["decals_1"] = 8,   ["decals_2"] = 3,
			["arms"] = 41,
			["pants_1"] = 25,   ["pants_2"] = 0,
			["shoes_1"] = 25,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		},
		female = {
			["tshirt_1"] = 35,  ["tshirt_2"] = 0,
			["torso_1"] = 48,   ["torso_2"] = 0,
			["decals_1"] = 7,   ["decals_2"] = 3,
			["arms"] = 44,
			["pants_1"] = 34,   ["pants_2"] = 0,
			["shoes_1"] = 27,   ["shoes_2"] = 0,
			["helmet_1"] = -1,  ["helmet_2"] = 0,
			["chain_1"] = 0,    ["chain_2"] = 0,
			["ears_1"] = 2,     ["ears_2"] = 0
		}
	},
	bullet_wear = {
		male = {
			["bproof_1"] = 11,  ["bproof_2"] = 1
		},
		female = {
			["bproof_1"] = 13,  ["bproof_2"] = 1
		}
	},
	gilet_wear = {
		male = {
			["tshirt_1"] = 59,  ["tshirt_2"] = 1
		},
		female = {
			["tshirt_1"] = 36,  ["tshirt_2"] = 1
		}
	}

}