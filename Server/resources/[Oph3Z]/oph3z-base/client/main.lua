ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)


------------------ Dipçik engelleme ------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed( -1 )
        local weapon = GetSelectedPedWeapon(ped)
    
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    
    
        if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then   
            if IsPedShooting(ped) then
                SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
            end
        end
    end
end)
------------------ Dipçik engelleme ------------------




------------------ Normal Hud Kapatma ------------------

--[[Citizen.CreateThread(function() -- Kendin hud eklediğinde bu kodu aktif et
    while true do
      Citizen.Wait(1)
      HideHudComponentThisFrame(3) -- Cash
      HideHudComponentThisFrame(4) -- MP Cash
      HideHudComponentThisFrame(6) -- Vehicle Name
      HideHudComponentThisFrame(7) -- Area Name
      HideHudComponentThisFrame(8) -- Vehicle Class
      HideHudComponentThisFrame(9) -- Street Name
      HideHudComponentThisFrame(13) -- Cash Change
      HideHudComponentThisFrame(17) -- Save Game
    end
end)--]]

------------------ Normal Hud Kapatma ------------------




------------------ NPC Kontrol Etme ------------------

-- NPC Kapatma
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Prevent crashing.

        -- Stop Spawn
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
        SetGarbageTrucks(false)
        SetRandomBoats(false)
               SetVehicleDensityMultiplierThisFrame(0.0)
               SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)

        -- Clear NPC
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
        ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
    end
end)
--]]

--Kontrol etmek için bu kod satırını kullanın! Ama kapatmak istiyorsanız üstteki kod satırını kullanın ve bu satırı silin
Citizen.CreateThread(function()
	while true do
		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.75) -- set traffic density to 0
		SetPedDensityMultiplierThisFrame(0.75) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.75) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.75) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(0.75, 0.75) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.

		Citizen.Wait(10) -- prevent crashing
	end
end)

------------------ NPC Kontrol Etme ------------------




------------------ NPC ambulans gibi şeyleri kapatıyor  ------------------

Citizen.CreateThread(function()
	while true do
		for i = 1, 18 do
			EnableDispatchService(i, false)
		end

		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)

		Citizen.Wait(10)
	end
end)

------------------ NPC ambulans gibi şeyleri kapatıyor ------------------




------------------ NPC'lerden silah düşürmesini engelliyor ------------------
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
        RemoveAllPickupsOfType(0x6E4E65C2)
        RemoveAllPickupsOfType(0x741C684A)
        RemoveAllPickupsOfType(0x68605A36)
        RemoveAllPickupsOfType(0x6C5B941A)
        RemoveAllPickupsOfType(0xD3A39366)
        RemoveAllPickupsOfType(0x550447A9)
        RemoveAllPickupsOfType(0xF99E15D0)
        RemoveAllPickupsOfType(0xA421A532)
        RemoveAllPickupsOfType(0xF33C83B0)
        RemoveAllPickupsOfType(0xDF711959)
        RemoveAllPickupsOfType(0xB2B5325E)
        RemoveAllPickupsOfType(0x85CAA9B1)
        RemoveAllPickupsOfType(0xB2930A14)
        RemoveAllPickupsOfType(0xFE2A352C)
        RemoveAllPickupsOfType(0x693583AD)
        RemoveAllPickupsOfType(0x1D9588D3)
        RemoveAllPickupsOfType(0x3A4C2AD2)
        RemoveAllPickupsOfType(0x4BFB42D1)
        RemoveAllPickupsOfType(0x4D36C349)
        RemoveAllPickupsOfType(0x2F36B434)
        RemoveAllPickupsOfType(0x8F707C18)
        RemoveAllPickupsOfType(0xA9355DCD)
        RemoveAllPickupsOfType(0x96B412A3)
        RemoveAllPickupsOfType(0x9299C95B)
        RemoveAllPickupsOfType(0x5E0683A1)
        RemoveAllPickupsOfType(0x2DD30479)
        RemoveAllPickupsOfType(0x1CD604C7)
        RemoveAllPickupsOfType(0x7C119D58)
        RemoveAllPickupsOfType(0xF9AFB48F)
        RemoveAllPickupsOfType(0x8967B4F3)
        RemoveAllPickupsOfType(0x3B662889)
        RemoveAllPickupsOfType(0x2E764125)
        RemoveAllPickupsOfType(0xFE18F3AF)
        RemoveAllPickupsOfType(0xFD16169E)
        RemoveAllPickupsOfType(0xCB13D282)
        RemoveAllPickupsOfType(0xC69DE3FF)
        RemoveAllPickupsOfType(0x278D8734)
        RemoveAllPickupsOfType(0x5EA16D74)
        RemoveAllPickupsOfType(0x295691A9)
        RemoveAllPickupsOfType(0x81EE601E)
        RemoveAllPickupsOfType(0x88EAACA7)
        RemoveAllPickupsOfType(0x872DC888)
        RemoveAllPickupsOfType(0x094AA1CF)
        RemoveAllPickupsOfType(0x2C014CA6)
        RemoveAllPickupsOfType(0xE33D8630)
        RemoveAllPickupsOfType(0x80AB931C)
        RemoveAllPickupsOfType(0x6E717A95)
        RemoveAllPickupsOfType(0x4B5259BE)
        RemoveAllPickupsOfType(0xCE6FDD6B)
        RemoveAllPickupsOfType(0x5DE0AD3E)
        RemoveAllPickupsOfType(0x1E9A99F8)
        RemoveAllPickupsOfType(0x20893292)
        RemoveAllPickupsOfType(0x14568F28)
        RemoveAllPickupsOfType(0x711D02A4)
        RemoveAllPickupsOfType(0xDE78F17E)
        RemoveAllPickupsOfType(0xD0AACEF7)
        RemoveAllPickupsOfType(0xCC8B3905)
        RemoveAllPickupsOfType(0xA54AE7B7)
        RemoveAllPickupsOfType(0xA717F898)
        RemoveAllPickupsOfType(0x84D676D4)
        RemoveAllPickupsOfType(0x65A7D8E9)
        RemoveAllPickupsOfType(0x2C804FE3)
        RemoveAllPickupsOfType(0x098D79EF)
        RemoveAllPickupsOfType(0x4316CC09)
        RemoveAllPickupsOfType(0xB86AEE5B)
        RemoveAllPickupsOfType(0xCC7CCD1B)
        RemoveAllPickupsOfType(0x2E071B5A)
        RemoveAllPickupsOfType(0xA5B8CAA9)
        RemoveAllPickupsOfType(0x65948212)
        RemoveAllPickupsOfType(0xE7CF07CC)
        RemoveAllPickupsOfType(0x1CD2CF66)
        RemoveAllPickupsOfType(0x6773257D)
        RemoveAllPickupsOfType(0x20796A82)
        RemoveAllPickupsOfType(0x116FC4E6)
        RemoveAllPickupsOfType(0xE4BD2FC6)
        RemoveAllPickupsOfType(0xDE58E0B3)
        RemoveAllPickupsOfType(0x77F3F2DD)
        RemoveAllPickupsOfType(0xC02CF125)
        RemoveAllPickupsOfType(0x881AB0A8)
        RemoveAllPickupsOfType(0x84837FD7)
        RemoveAllPickupsOfType(0xF25A01B9)
        RemoveAllPickupsOfType(0x815D66E8)
        RemoveAllPickupsOfType(0xFA51ABF5)
        RemoveAllPickupsOfType(0xC5B72713)
        RemoveAllPickupsOfType(0x5307A4EC)
        RemoveAllPickupsOfType(0x9CF13918)
        RemoveAllPickupsOfType(0x0968339D)
        RemoveAllPickupsOfType(0xBFEE6C3B)
        RemoveAllPickupsOfType(0xEBF89D5F)
        RemoveAllPickupsOfType(0x22B15640)
        RemoveAllPickupsOfType(0x763F7121)
        RemoveAllPickupsOfType(0xF92F486C)
        RemoveAllPickupsOfType(0x602941D0)
        RemoveAllPickupsOfType(0x31EA45C9)
        RemoveAllPickupsOfType(0xBED46EC5)
        RemoveAllPickupsOfType(0x079284A9)
        RemoveAllPickupsOfType(0xE175C698)
        RemoveAllPickupsOfType(0x624F7213)
        RemoveAllPickupsOfType(0xC01EB678)
        RemoveAllPickupsOfType(0x5C517D97)
        RemoveAllPickupsOfType(0xBD4DE242)
        RemoveAllPickupsOfType(0xE013E01C)
        RemoveAllPickupsOfType(0x789576E2)
        RemoveAllPickupsOfType(0xFD9CAEDE)
        RemoveAllPickupsOfType(0x8ADDEC75)
    end
end)
------------------ NPC'lerden silah düşürmesini engelliyor ------------------




------------------ Kadın pedlerinin canını fulleme ------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
            SetEntityMaxHealth(GetPlayerPed(-1), 200)
            SetEntityHealth(GetPlayerPed(-1), 200)
        end
    end
end)

------------------ Kadın pedlerinin canını fulleme ------------------




------------------ Eyilme ------------------

local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = PlayerPedId()

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )

------------------ Eyilme ------------------




------------------ B Tuşu ------------------

local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(100)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(10)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = PlayerPedId()
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)

------------------ B Tuşu ------------------




------------------ El kaldırma ------------------

local canHandsUp = true

Citizen.CreateThread(function()
	local handsup = false

	while true do
		Citizen.Wait(0)

		if canHandsUp then
			if IsControlJustReleased(0,73) then
				local playerPed = PlayerPedId()

				RequestAnimDict('random@mugging3')
				while not HasAnimDictLoaded('random@mugging3') do
					Citizen.Wait(100)
				end

				if handsup then
					handsup = false
					ClearPedSecondaryTask(playerPed)
				else
					handsup = true
					TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
				end
			end
		end
	end
end)

------------------ El kaldırma ------------------




------------------ Aracın içinde koltuk değiştirme ------------------

local koltukengel = true

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        local PlayerPed = PlayerPedId()
        local Arac = GetVehiclePedIsIn(PlayerPed, false)
		if IsPedInAnyVehicle(PlayerPed, false) and koltukengel then
    		if GetPedInVehicleSeat(Arac, 0) == PlayerPed then
				if GetIsTaskActive(PlayerPed, 165) then
					SetPedIntoVehicle(PlayerPed, Arac, 0)
				end
			end
		end
	end
end)



function round(value, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end



RegisterCommand("koltuk", function(source, args)
    local PlayerPed = PlayerPedId()
    local Arac = GetVehiclePedIsIn(PlayerPed, false)
    
    if args[1] == nil then
        Koltuk = -1
    else
        Koltuk = round(tonumber(args[1]-2))
    end
    if IsPedInAnyVehicle(PlayerPed, false) then
        if IsVehicleSeatFree(Arac, Koltuk) then 
            SetPedIntoVehicle(PlayerPed, Arac, Koltuk)
        else
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'error', text = 'Koltuk Dolu.'})
        end
    end
end)

------------------ Aracın içinde koltuk değiştirme ------------------
