local blips = {

	{title="İş Kur", colour=1, id=408, x = -260.95858764648, y = -972.18524169922, z = 31.219997406006},
	--{title="Silahçı", colour=49, id=567, x = 21.962865829468, y = -1107.0645751953, z = 29.797027587891},
	--{title="Silahçı", colour=49, id=567, x = 842.07501220703, y = -1033.8859863281, z = 28.194862365723},
	--{title="Silahçı", colour=49, id=567, x = 251.9900970459, y = -49.819858551025, z = 69.940399169922},
	--{title="Silahçı", colour=49, id=567, x = -662.32000732422, y = -935.22973632813, z = 21.82975769043},
	--{title="Silahçı", colour=49, id=567, x = 810.12762451172, y = -2156.9521484375, z = 29.618995666504},
	--{title="Silahçı", colour=49, id=567, x = 2567.7600097656, y = 294.62979125977, z = 108.73798370361},
	--{title="Silahçı", colour=49, id=567, x = 1693.8299560547, y = 3759.7666015625, z = 34.709999084473},
	--{title="Silahçı", colour=49, id=567, x = -1117.4499511719, z = 2698.580078125, z = 18.551662445068},
	--{title="Silahçı", colour=49, id=567, x = -330.24087524414, y = 6083.8798828125, z = 31.45930480957},
	--{title="Pavyon", colour=7, id=121, x = 126.82886505127, y = -1286.6845703125, z = 29.284364700317},
	--{title="Hapishane", colour=49, id=188, x = 1701.35, y = 2605.03, z = 45.56},
	--{title="Gym", colour=7, id=311, x = -1202.34, y = -1567.78, z = 4.6095},
	{title="Araç Galerisi", colour=0, id=227, x = -44.324, y = -1099.6, z =26.4223},
	--{title="Satılık Mekanik 1", colour=3, id=446, x = 928.721, y = -971.83, z = 39.4998}, -- Karakolun arkasındaki mekanik
	--{title="Satılık Mekanik 2", colour=5, id=446, x = -337.48, y = -137.06, z = 39.0096}, -- Şu normal mekanik (lscustom)
	--{title="Satılık Mekanik 3", colour=49, id=446, x = -210.94, y = -1323.5, z = 30.8904}, -- Bennys
	--{title="Toptancı", colour=4, id=133, x = 412.3108, y = 314.3209, z = 102.02},
	--{title="Elektronik Mağzası", colour=5, id=521, x = -657.39, y = -857.45, z = 24.49},

}
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4) 
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)