ESX = nil



local isLoggedIn = true

local CurrentWeaponData = {}

local PlayerData = {}

local CanShoot = true



Citizen.CreateThread(function()

    while ESX == nil do

        ESX = exports['es_extended']:getSharedObject()

        Citizen.Wait(3)

    end

    while ESX.GetPlayerData().job == nil do

        Citizen.Wait(10)

    end

    PlayerData = ESX.GetPlayerData()

end)



Citizen.CreateThread(function() 

    while true do

        if isLoggedIn then

            TriggerServerEvent("weapons:server:SaveWeaponAmmo")

        end

        Citizen.Wait(60000)

    end

end)



local MultiplierAmount = 0



Citizen.CreateThread(function()

    while true do

        if isLoggedIn then

            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then

                if CurrentWeaponData == GetHashKey("weapon_flashlight") then

                    return

                end



                if IsPedShooting(GetPlayerPed(-1)) or IsControlJustPressed(0, 24) then

                    if CanShoot then

                        local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))

                        local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)

                       -- if ESX.GetWeaponList[weapon]["name"] == "weapon_snowball" then

                        --    TriggerServerEvent('QBCore:Server:RemoveItem', "snowball", 1)

                        --else

                            if ammo >= 0 then

                                MultiplierAmount = MultiplierAmount + 1

                            end

                        --end

                    else

                        TriggerEvent('inventory:client:CheckWeapon')

                        TriggerEvent("notification","Bu silah kullanılamaz.",2)

                        MultiplierAmount = 0

                    end

                end

            end

        end

        Citizen.Wait(0)

    end

end)



-- RegisterCommand("mçıkar", function(source, args)

--     local type

--     if args[1] ~= nil then

--         type = args[1]

--     end

--     TriggerEvent("weapon:client:removeAmmo", type)

-- end)



-- RegisterNetEvent('weapon:client:removeAmmo')

-- AddEventHandler('weapon:client:removeAmmo', function(type)

--     local ped = PlayerPedId()

--     local weapon = GetSelectedPedWeapon(ped)

--     if CurrentWeaponData ~= nil then

--         if using then 

--             return

--         end

            

--         if Config.Weapons[weapon]["name"] ~= "weapon_unarmed" and Config.Weapons[weapon]["ammotype"] ~= nil then

--             local total = (GetAmmoInPedWeapon(ped, weapon))

--             local total_item_count = 1

--             if total >= 30 then

--                     if type == "all" then

--                         total_item_count = math.floor(total / 30)

--                         total = 0

--                     end

--                     if total > 30 then

--                         total = total - 30

--                     end

--                     pressed = true

--                     if Config.Weapons[weapon] ~= nil then

--                         using = true

--                         TriggerEvent("mythic_progbar:client:progress", {

--                             name = "mermicikar",

--                             duration = 2000,

--                             label = "Mermi çıkartıyorsun..",

--                             useWhileDead = false,

--                             canCancel = true,

--                             controlDisables = {

--                                 disableMovement = false,

--                                 disableCarMovement = false,

--                                 disableMouse = false,

--                                 disableCombat = false,

--                             },

--                         }, function(status)

--                             if not status then

--                             using = false

--                             SetAmmoInClip(ped, weapon, 0)

--                             SetPedAmmo(ped, weapon, total)

--                             TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, total)

--                             TriggerServerEvent('addfalanfilan', Config.Weapons[weapon]["ammo_item"], total_item_count)

--                             --TriggerEvent('inventory:client:ItemBox', itemData.name, "remove")

--                             -- TriggerEvent("notification","Mermi boşaltıldı")

--                             exports.mythic_notify:SendAlert('inform', 'Şarjör boşaltıldı.')

--                         end

--                     end)

--                     end

--                     pressed = false





--                -- end, function()

--                --     QBCore.Functions.Notify("Iptal edildi..", "error")

--                -- end)

--             else

--                 pressed = false

--                 -- TriggerEvent("notification","Mermin 30'dan azken bunu kullanamazsın!",2)

--                 exports.mythic_notify:SendAlert('inform', 'Mermin 30\'dan azken bunu kullanamazsın.')

--             end

--         else

--             pressed = false

--             -- TriggerEvent("notification","Silahın yok veya bu silah mermi ile kullanılmıyor!",2)

--             exports.mythic_notify:SendAlert('inform', 'Silahın yok veya bu silah mermi ile kullanılmıyor.')

--         end

--     else

--         pressed = false

--         -- TriggerEvent("notification","Silahın yok",2)

--         exports.mythic_notify:SendAlert('inform', 'Silahın yok.')

--     end

-- end)





Citizen.CreateThread(function()

    while true do

        local ped = GetPlayerPed(-1)

        local player = PlayerId()

        local weapon = GetSelectedPedWeapon(ped)

        local ammo = GetAmmoInPedWeapon(ped, weapon)



        if ammo == 1 then

            DisableControlAction(0, 24, true) -- Attack

            DisableControlAction(0, 257, true) -- Attack 2

            if IsPedInAnyVehicle(ped, true) then

                SetPlayerCanDoDriveBy(player, false)

            end

        else

            EnableControlAction(0, 24, true) -- Attack

			EnableControlAction(0, 257, true) -- Attack 2

            if IsPedInAnyVehicle(ped, true) then

                SetPlayerCanDoDriveBy(player, true)

            end

        end



        if IsPedShooting(ped) then

            if ammo - 1 < 1 then

                SetAmmoInClip(GetPlayerPed(-1), GetHashKey(Config.Weapons[weapon]["name"]), 1)

            end

        end

        

        Citizen.Wait(0)

    end

end)



Citizen.CreateThread(function()

    while true do

        local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))

        local wait = 500

        if weapon ~= -1569615261 then

            wait = 250

            local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)

            if ammo > 0 then

                --print(ammo)

                TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, tonumber(ammo))

            else

                TriggerEvent('inventory:client:CheckWeapon')

                TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, 0)

            end



            if MultiplierAmount > 0 then

                TriggerServerEvent("weapons:server:UpdateWeaponQuality", CurrentWeaponData, MultiplierAmount)

                MultiplierAmount = 0

            end

        end

        Citizen.Wait(wait)

    end

end)



local using = false

RegisterNetEvent('weapon:client:AddAmmo')

AddEventHandler('weapon:client:AddAmmo', function(type, amount, itemData)

    local ped = GetPlayerPed(-1)

    local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))

    if CurrentWeaponData ~= nil then

        if using then 

            return

        end

            

        if Config.Weapons[weapon]["name"] ~= "weapon_unarmed" and Config.Weapons[weapon]["ammotype"] == type:upper() then

            local total = (GetAmmoInPedWeapon(GetPlayerPed(-1), weapon))



            if total <= 200 then

                

                    pressed = true

                    if Config.Weapons[weapon] ~= nil then

                        TriggerEvent("mythic_progbar:client:progress", {

                            name = "mermie",

                            duration = 2000,

                            label = "Mermi Dolduruyorsun..",

                            useWhileDead = false,

                            canCancel = true,

                            controlDisables = {

                                disableMovement = false,

                                disableCarMovement = false,

                                disableMouse = false,

                                disableCombat = false,

                            },

                        }, function(status)

                            if not status then

                                using = true

                                SetAmmoInClip(ped, weapon, 0)

                                SetPedAmmo(ped, weapon, total + 30)

                                TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, total + 30)

                                TriggerServerEvent('removefalanfilan', itemData.name, 1, itemData.slot)

                                -- TriggerEvent("notification","Mermi dolduruldu.")

                                exports.mythic_notify:SendAlert('inform', 'Mermi dolduruldu.')

                                using = false

                        end

                    end)

                    end

                    pressed = false

            else

                pressed = false

                -- TriggerEvent("notification","Yeterince mermin var!",2)

                exports.mythic_notify:SendAlert('inform', 'Yeterince mermin var.')

            end

        else

            pressed = false

            -- TriggerEvent("notification","Silahın yok veya bu mermi bu silaha uygun değil!",2)

            exports.mythic_notify:SendAlert('error', 'Silahın yok veya bu mermi silahına uygun değil.')

        end

    else

        pressed = false

        exports.mythic_notify:SendAlert('error', 'Elinde silahın yok.')

        -- TriggerEvent("notification","Silahın yok!",2)

    end

end)



RegisterNetEvent('esx:playerLoaded')

AddEventHandler('esx:playerLoaded', function()

    TriggerServerEvent("weapons:server:LoadWeaponAmmo")

    isLoggedIn = true

    PlayerData = ESX.GetPlayerData()



    ESX.TriggerServerCallback("weapons:server:GetConfig", function(RepairPoints)

        for k, data in pairs(RepairPoints) do

            Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing

            Config.WeaponRepairPoints[k].RepairingData = data.RepairingData

        end

    end)

end)



RegisterNetEvent('weapons:client:SetCurrentWeapon')

AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)

    if data then

        CurrentWeaponData = data

        -- TriggerEvent("notification","Silahı Eline Aldın; ".. CurrentWeaponData.label)

    else

        -- TriggerEvent("notification","Silahı Elinden Bıraktın; ".. CurrentWeaponData.label,2)

        CurrentWeaponData = nil

    end

    CanShoot = bool

end)



RegisterNetEvent('QBCore:Client:OnPlayerUnload')

AddEventHandler('QBCore:Client:OnPlayerUnload', function()

    isLoggedIn = false



    for k, v in pairs(Config.WeaponRepairPoints) do

        Config.WeaponRepairPoints[k].IsRepairing = false

        Config.WeaponRepairPoints[k].RepairingData = {}

    end

end)



RegisterNetEvent('weapons:client:SetWeaponQuality')

AddEventHandler('weapons:client:SetWeaponQuality', function(amount)

    if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then

        TriggerServerEvent("weapons:server:SetWeaponQuality", CurrentWeaponData, amount + 0.0)

    end

end)



Citizen.CreateThread(function()

    while true do

            local wait = 2250

            local ped = GetPlayerPed(-1)

            local pos = GetEntityCoords(ped)



            for k, data in pairs(Config.WeaponRepairPoints) do

                local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z, true)



                if distance < 10 then

                    wait = 3



                    if distance < 1 then

                        wait = 3

                        if data.IsRepairing then

                            if data.RepairingData.identifier ~= PlayerData.identifier then

                                exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, 'Tamirhane ~r~Mesgul~w~')

                            else

                                if not data.RepairingData.Ready then

                                    exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, 'Silahın Tamir Ediliyor')

                                else

                                    exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, '[E] Geri al')

                                end

                            end

                        else

                            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then

                                if not data.RepairingData.Ready then

                                    local WeaponData = Config.Weapons[GetHashKey(CurrentWeaponData.name)]

                                    local WeaponClass = (SplitStr(WeaponData.ammotype, "_")[2]):lower()

                                    exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, '[E] Silah onar, (~g~'..Config.WeaponRepairCotsts[WeaponClass]..'.0$~w~)')

                                    if IsControlJustPressed(1, 38) then

                                        ESX.TriggerServerCallback('haze-prestige:server:getXp', function(xp)

                                            local level, xpp = exports['haze-prestige']:getLevelAndXp(xp)

                                            if level >= 50 then

                                                ESX.TriggerServerCallback('weapons:server:RepairWeapon', function(HasMoney)

                                                    if HasMoney then

                                                        CurrentWeaponData = {}

                                                    end

                                                end, k, CurrentWeaponData)

                                            else

                                                exports['mythic_notify']:SendAlert('error', 'Bu özelliği kullanabilmek için 50 seviye prestij gerekmektedir. (Prestij kontrol için /prestij)')

                                            end

                                        end)

                                       

                                    end

                                else

                                    if data.RepairingData.identifier ~= PlayerData.identifier then

                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'Tamirhane Aktif Degil')

                                    else

                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Geri al')

                                        if IsControlJustPressed(1,38) then

                                            TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)

                                        end

                                    end

                                end

                            else

                                if data.RepairingData.identifier == nil then

                                    exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, 'Elinde Silah Yok')

                                elseif data.RepairingData.identifier == PlayerData.identifier then

                                    exports.m3_core:DrawText3D(data.coords.x, data.coords.y, data.coords.z, '[E] Geri al')

                                    if IsControlJustPressed(0, Keys["E"]) then

                                        TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)

                                    end

                                end

                            end

                        end

                    end

                end

            end

            Citizen.Wait(wait)

    end

end)



RegisterNetEvent("weapons:client:SyncRepairShops")

AddEventHandler("weapons:client:SyncRepairShops", function(NewData, key)

    Config.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing

    Config.WeaponRepairPoints[key].RepairingData = NewData.RepairingData

end)



RegisterNetEvent("weapons:client:EquipAttachment")

AddEventHandler("weapons:client:EquipAttachment", function(ItemData, attachment)

    local ped = GetPlayerPed(-1)

    local weapon = GetSelectedPedWeapon(ped)

    local WeaponData = Config.Weapons[weapon]

    

    if weapon ~= GetHashKey("WEAPON_UNARMED") then

        WeaponData.name = WeaponData.name:upper()

        if Config.WeaponAttachments[WeaponData.name] ~= nil then

            if Config.WeaponAttachments[WeaponData.name][attachment] ~= nil then

                TriggerServerEvent("weapons:server:EquipAttachment", ItemData, CurrentWeaponData, Config.WeaponAttachments[WeaponData.name][attachment])

            else

                -- TriggerEvent('notification','Bu silah bu parçayı desteklemiyor',2)

                exports.mythic_notify:SendAlert('error', 'Bu silah bu parçayı desteklemiyor.')

            end

        end

    else

        -- TriggerEvent('notification','Elinde silah yok',2)

        exports.mythic_notify:SendAlert('error', 'Elinde silahın yok.')

    end

end)



RegisterNetEvent("addAttachment")

AddEventHandler("addAttachment", function(component)

    local ped = GetPlayerPed(-1)

    local weapon = GetSelectedPedWeapon(ped)

    local WeaponData = Config.Weapons[weapon]

    GiveWeaponComponentToPed(ped, GetHashKey(WeaponData.name), GetHashKey(component))

end)





local StringCharset = {}

local NumberCharset = {}



for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(StringCharset, string.char(i)) end

for i = 97, 122 do table.insert(StringCharset, string.char(i)) end



RandomStr = function(length)

	if length > 0 then

		return RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]

	else

		return ''

	end

end



RandomInt = function(length)

	if length > 0 then

		return RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]

	else

		return ''

	end

end



SplitStr = function(str, delimiter)

	local result = { }

	local from  = 1

	local delim_from, delim_to = string.find( str, delimiter, from  )

	while delim_from do

		table.insert( result, string.sub( str, from , delim_from-1 ) )

		from  = delim_to + 1

		delim_from, delim_to = string.find( str, delimiter, from  )

	end

	table.insert( result, string.sub( str, from  ) )

	return result

end