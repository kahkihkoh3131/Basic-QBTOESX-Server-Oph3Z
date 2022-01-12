Config                            = {}
Config.DrawDistance               = 100.0

Config.Marker                     = {type = 2, x = 0.5, y = 0.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = true}

Config.ReviveReward               = 400  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 10000 * 5  -- time til respawn is available
Config.BleedoutTimer              = 10000 * 30 -- time til the player bleeds out

Config.EnablePlayerManagement     = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 80

Config.RespawnPoint = {coords = vector3(298.234, -584.27, 43.2608), heading = 70.67}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(298.234, -584.27, 43.2608),   
			sprite = 61,
			scale  = 0.7,
			color  = 1
		},

		AmbulanceActions = {
			vector3(999, -598.33, 43.28)
		},

		-- Pharmacies = {
		-- 	vector3(230.1, -1366.1, 38.5)
		-- },

		Vehicles = {
			{
				Spawner = vector3(295.599, -600.34, 43.3034),   
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 36, x = 0.6, y = 0.6, z = 0.6, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(293.499, -609.63, 42.7494), heading = 95.26, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-851.01, -1228.85, 6.82),   
				InsideShop = vector3(-856.67, -1216.37, 6.14),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-856.67, -1216.37, 6.14), heading = 327.57, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(346.225, -582.50, 28.7968),
				To = {coords = vector3(327.209, -603.18, 43.2841), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},
			
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{ model = 'ambulance', label = 'Ambulance', price = 100},
		},
	
		doctor = {
			{ model = 'ambulance', label = 'Ambulance', price = 100},
		},
	
		chief_doctor = {
			{ model = 'ambulance', label = 'Ambulance', price = 100},
		},
	
		boss = {
			{ model = 'ambulance', label = 'Ambulance', price = 100},
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{ model = 'emsair', label = 'Ambulans Helikopteri', price = 100 }
		},

		chief_doctor = {
			{ model = 'polmav', label = 'Ambulans Helikopteri', price = 100 }
		},

		boss = {
			{ model = 'polmav', label = 'Ambulans Helikopteri', price = 100 }
		}
	}
}
