ESX = nil

inInventory = false
hotbarOpen = false
inhotbar = false
local inventoryTest = {}
local currentWeapon = nil
local CurrentWeaponData = {}
local currentOtherInventory = nil
inventorylocked = false
local Drops = {}
local CurrentDrop = 0
local DropsNear = {}

local CurrentVehicle = nil
local CurrentGlovebox = nil
local CurrentStash = nil
local isCrafting = false 
local currentGarbage = nil
local showTrunkPos = false
PlayerData = {}
ItemInfos = nil


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

RegisterNetEvent('inventory:loadItemInfos')
AddEventHandler('inventory:loadItemInfos', function(x)
    ItemInfos = x
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent('qb_inventory:server:freezeGarbages')
end)

RegisterNetEvent('qb_inventory:client:freezeGarbage')
AddEventHandler('qb_inventory:client:freezeGarbage', function(entity)
    FreezeEntityPosition(entity, true)
end)

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

RegisterNetEvent('inventory:client:CheckOpenState')
AddEventHandler('inventory:client:CheckOpenState', function(type, id, label)
    local name = SplitStr(label, "-")[2]
    if type == "stash" then
        if name ~= CurrentStash or CurrentStash == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "trunk" then
        if name ~= CurrentVehicle or CurrentVehicle == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    elseif type == "glovebox" then
        if name ~= CurrentGlovebox or CurrentGlovebox == nil then
            TriggerServerEvent('inventory:server:SetIsOpenState', false, type, id)
        end
    end
end)

RegisterNetEvent("inventory:setbool")
AddEventHandler("inventory:setbool",function(bool)
    inventorylocked = bool
    -- print(inventorylocked)
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
end)


-- function DrawText3Ds(x, y, z, text)
-- 	SetTextScale(0.30, 0.30)
--     SetTextFont(0)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(true)
--     AddTextComponentString(text)
--     SetDrawOrigin(x,y,z, 0)
--     DrawText(0.0, 0.0)
--     local factor = (string.len(text)) / 250
--     DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
--     ClearDrawOrigin()
-- end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        DisableControlAction(0, 37, true)
        for i = 19, 20 do 
            HideHudComponentThisFrame(i)
        end
        DisableControlAction(0, Keys["1"], true)
        DisableControlAction(0, Keys["2"], true)
        DisableControlAction(0, Keys["3"], true)
        DisableControlAction(0, Keys["4"], true)
        DisableControlAction(0, Keys["5"], true)
        local pCoords = GetEntityCoords(PlayerPedId())
        if IsDisabledControlJustPressed(0, Keys["F2"]) then
                    TriggerEvent("randPickupAnim")
                    local pCoords = GetEntityCoords(PlayerPedId())
                    -- local entitys, entityDsts = ESX.Game.GetClosestObject(pCoords, Config.GarbageProps)
                    local x, y, z = table.unpack(GetEntityCoords(entitys))
                    local _, floorZ = GetGroundZFor_3dCoord(x, y, z)
                    local name = 'Çöp Konteyneri-'..getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
                    local name2 = getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
                    -- if DoesEntityExist(entitys) and entityDsts <= 2 then
                    --     currentGarbage = name2
                    -- else
                    --     currentGarbage = nil
                    -- end
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        CurrentGlovebox = GetVehicleNumberPlateText(vehicle)
                        curVeh = vehicle
                        CurrentVehicle = nil
                    else
                        local vehicle = ESX.Game.GetClosestVehicle()
                        if vehicle ~= 0 and vehicle ~= nil then
                            local pos = GetEntityCoords(PlayerPedId())
                            local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            end
                            if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, trunkpos) < 2.0) and not IsPedInAnyVehicle(PlayerPedId()) then
                                if GetVehicleDoorLockStatus(vehicle) < 2 then
                                    CurrentVehicle = GetVehicleNumberPlateText(vehicle)
                                    curVeh = vehicle
                                    CurrentGlovebox = nil
                                else
                                   exports["mythic_notify"]:SendAlert("error", "Aracın bagajı kilitli!")
                                    
                                end
                            else
                                CurrentVehicle = nil
                            end
                        else
                            CurrentVehicle = nil
                        end
                    end

                    if CurrentVehicle ~= nil then
                        local maxweight = 0
                        local slots = 0
                        if GetVehicleClass(curVeh) == 0 then
                            maxweight = 35
                            slots = 10
                        elseif GetVehicleClass(curVeh) == 1 then
                            maxweight = 45
                            slots = 20
                        elseif GetVehicleClass(curVeh) == 2 then
                            maxweight = 55
                            slots = 25
                        elseif GetVehicleClass(curVeh) == 3 then
                            maxweight = 15
                            slots = 10
                        elseif GetVehicleClass(curVeh) == 4 then
                            maxweight = 25
                            slots = 5
                        elseif GetVehicleClass(curVeh) == 5 then
                            maxweight = 15
                            slots = 5
                        elseif GetVehicleClass(curVeh) == 6 then
                            maxweight = 15
                            slots = 10
                        elseif GetVehicleClass(curVeh) == 7 then
                            maxweight = 20
                            slots = 15
                        elseif GetVehicleClass(curVeh) == 8 then
                            maxweight = 25
                            slots = 8
                        elseif GetVehicleClass(curVeh) == 9 then
                            maxweight = 60
                            slots = 30
                        elseif GetVehicleClass(curVeh) == 12 then
                            maxweight = 120
                            slots = 50
                        else
                            maxweight = 30
                            slots = 10
                        end

                        local other = {
                            maxweight = maxweight,
                            slots = slots,
                        }
                        TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                        OpenTrunk()
                    -- elseif currentGarbage ~= nil then
                    --     ESX.TriggerServerCallback('garbage:ac',function(items)
                    --         local ShopItems = {}
                    --         ShopItems.label = 'Çöp Konteyneri'..currentGarbage
                    --         ShopItems.items = items
                    --         ShopItems.slots = 15
                    --         TriggerServerEvent("inventory:server:OpenInventory", "garbage", currentGarbage, ShopItems)
                    --     end,currentGarbage)
                    elseif CurrentGlovebox ~= nil then
                        TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
                    elseif CurrentDrop ~= 0 then
                        TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
                    else
                        TriggerServerEvent("inventory:server:OpenInventory")
                    end


                -- local entitys31, entityDsts31 = ESX.Game.GetClosestObject(pCoords, Config.VendingObjects) --// aRıZaLı eLLeMe
                -- if DoesEntityExist(entitys31) and entityDsts31 <= 1.5 then
                --     for k, malarp in pairs(Config.VendingItem) do
                --         if PlayerData.job ~= nil then

                --             OpenMarket(malarp)
                            
                --         end
                    
                --         break
                --     end
                -- end
        end

        if IsDisabledControlJustPressed(0, Keys["TAB"]) then
            ToggleHotbar(true)
        end

        if IsDisabledControlJustReleased(0, Keys["TAB"]) then
            ToggleHotbar(false)
        end

        if IsDisabledControlJustReleased(0, Keys["1"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 1)
        end

        if IsDisabledControlJustReleased(0, Keys["2"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 2)
        end

        if IsDisabledControlJustReleased(0, Keys["3"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 3)
        end

        if IsDisabledControlJustReleased(0, Keys["4"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 4)
        end

        if IsDisabledControlJustReleased(0, Keys["5"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 5)
        end

        if IsDisabledControlJustReleased(0, Keys["6"]) and inventorylocked == false then
            TriggerServerEvent("inventory:server:UseItemSlot", 41)
        end
    end
end)


RegisterNetEvent('inventory:client:ItemBox')
AddEventHandler('inventory:client:ItemBox', function(itemData, type,count)
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type,
        count = count
    })
end)

RegisterNetEvent('inventory:client:WeaponHolster')
AddEventHandler('inventory:client:WeaponHolster', function(itemData, weapon)
    local type = "holster"
    if weapon == "weapon_unarmed" then
        type = "holster"
    else
        type = "unholster"
    end  
    SendNUIMessage({
        action = "itemBox",
        item = itemData,
        type = type,
        adet = 0
    })
end)

RegisterNetEvent('inventory:client:requiredItems')
AddEventHandler('inventory:client:requiredItems', function(items, bool)
    local itemTable = {}
    if bool then
        for k, v in pairs(items) do
            table.insert(itemTable, {
                item = items[k].name,
                label = items[k].label,
                image = items[k].image,
            })
        end
    end
    
    SendNUIMessage({
        action = "requiredItem",
        items = itemTable,
        toggle = bool
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Drops ~= nil and next(Drops) ~= nil then
            local pos = GetEntityCoords(PlayerPedId(), true)
            for k, v in pairs(Drops) do
                if Drops[k] ~= nil then 
                    distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y, v.coords.z))
                    if distance <= 7.5 then
                        CurrentDrop = 0
                        --DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)
                        DrawMarker(2, v.coords.x, v.coords.y, v.coords.z - 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, 0.15, 120, 10, 20, 155, false, true, false, 0, false, false, false)
                        if distance <= 1.0 then
                            CurrentDrop = k
                        end
                    end                  
                end
            end
        end
    end
end)

-- RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
-- AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
--     TriggerServerEvent("inventory:server:LoadDrops")
-- end)

RegisterNetEvent('inventory:server:RobPlayer')
AddEventHandler('inventory:server:RobPlayer', function(TargetId)
    SendNUIMessage({
        action = "RobMoney",
        TargetId = TargetId,
    })
end)

RegisterNUICallback('RobMoney', function(data, cb)
    TriggerServerEvent("police:server:RobPlayer", data.TargetId)
end)

RegisterNUICallback('Notify', function(data, cb)
    if data.type == 'error' then
        type = 2
    else
        type = 1
    end
    TriggerClientEvent('notification',data.message,type)
end)

RegisterNetEvent("inventory:client:OpenInventory")
AddEventHandler("inventory:client:OpenInventory", function(PlayerAmmo, inventory, other)
    if inventorylocked == false then
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other ~= nil then
            currentOtherInventory = other.name
        end
        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = MaxInventorySlots,
            other = other,
            maxweight = ESX.GetPlayerData().maxWeight,
            Ammo = PlayerAmmo,
            maxammo = Config.MaximumAmmoValues,
            id = GetPlayerServerId(PlayerId())
        })
        inInventory = true
    end
end)

RegisterNetEvent("inventory:client:ShowTrunkPos")
AddEventHandler("inventory:client:ShowTrunkPos", function()
    showTrunkPos = true
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory")
AddEventHandler("inventory:client:UpdatePlayerInventory", function(isError)
    SendNUIMessage({
        action = "update",
        inventory = ESX.GetPlayerData().inventory,
        maxweight = ESX.GetConfig().MaxWeight,
        slots = MaxInventorySlots,
        error = isError,
    })
end)

RegisterNetEvent("inventory:client:CraftItems")
AddEventHandler("inventory:client:CraftItems", function(itemName, itemCosts, amount, toSlot, points)
SendNUIMessage({
    action = "close",
    TriggerScreenblurFadeOut(0)
})
isCrafting = true
	StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
    TriggerServerEvent("inventory:server:CraftItems", itemName, itemCosts, amount, toSlot, points)
    isCrafting = false
end)

RegisterNetEvent('inventory:client:CraftAttachment')
AddEventHandler('inventory:client:CraftAttachment', function(itemName, itemCosts, amount, toSlot, points)
SendNUIMessage({
    action = "close",
    TriggerScreenblurFadeOut(0)
})
isCrafting = true
	StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
    TriggerServerEvent("inventory:server:CraftAttachment", itemName, itemCosts, amount, toSlot, points)
    isCrafting = false
end)

RegisterNetEvent('inventory:client:forceClose')
AddEventHandler('inventory:client:forceClose', function()
    SendNUIMessage({
        action = "close",
    })
end)

RegisterNetEvent("inventory:client:UseWeapon")
AddEventHandler("inventory:client:UseWeapon", function(weaponData, shootbool)
    local weaponName = tostring(weaponData.name)
    if currentWeapon == weaponName then
        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
        TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
        TriggerEvent('inventory:client:WeaponHolster', weaponData, "weapon_unarmed")
    else
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        ESX.TriggerServerCallback("weapon:server:GetWeaponAmmo", function(result)
            local ammo = tonumber(result)
            if weaponName == "WEAPON_PETROLCAN" or weaponName == "WEAPON_FIREEXTINGUISHER" then --fireextinguisher
                ammo = 4000 
            end
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponName), ammo, false, false)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey(weaponName), ammo)
            SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey(weaponName), true)
            if weaponData.info.attachments ~= nil then
                for _, attachment in pairs(weaponData.info.attachments) do
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponName), GetHashKey(attachment.component))
                end
            end
            currentWeapon = weaponName
            TriggerEvent('inventory:client:WeaponHolster', weaponData, currentWeapon)
        end, CurrentWeaponData)
    end
    if weaponName == "weapon_switchblade" then
        TriggerEvent('tq_hunting:client:hayvanikes') 
    end
end)

WeaponAttachments = {
    ["WEAPON_PISTOL"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_PISTOL_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
    },
    ["WEAPON_COMBATPISTOL"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_COMBATPISTOL_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
    },
    ["WEAPON_HEAVYPISTOL"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_HEAVYPISTOL_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
    },
    ["WEAPON_PISTOL_MK2"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH_02",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_PISTOL_MK2_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_PI_RAIL",
            label = "Dürbün",
            item = "scope",
        },
    },

    -- SMG
    ["WEAPON_SMG"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_SMG_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_02",
            label = "Dürbün",
            item = "scope",
        },
    },
    ["WEAPON_SMG_MK2"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["clip"] = {
            component = "COMPONENT_SMG_MK2_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2",
            label = "Dürbün",
            item = "scope",
        },
    },

    -- Rifle
    ["WEAPON_ASSAULTRIFLE_MK2"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Tutamaç",
            item = "grip",
        },
        ["clip"] = {
            component = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },

        ["scope"] = {
            component = "COMPONENT_AT_SIGHTS",
            label = "Dürbün",
            item = "scope",
        },
        ["scope2"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_MK2",
            label = "Dürbün",
            item = "scope2",
        },
        ["scope3"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Dürbün",
            item = "scope3",
        },
        ["muzzle"] = {
            component = "COMPONENT_AT_MUZZLE_01",
            label = "Muzzle",
            item = "muzzle",
        },
        ["muzzle2"] = {
            component = "COMPONENT_AT_MUZZLE_02",
            label = "Muzzle",
            item = "muzzle2",
        },
        ["muzzle3"] = {
            component = "COMPONENT_AT_MUZZLE_03",
            label = "Muzzle",
            item = "muzzle3",
        },
        ["muzzle4"] = {
            component = "COMPONENT_AT_MUZZLE_04",
            label = "Muzzle",
            item = "muzzle4",
        },
        ["muzzle5"] = {
            component = "COMPONENT_AT_MUZZLE_05",
            label = "Muzzle",
            item = "muzzle5",
        },
        ["muzzle6"] = {
            component = "COMPONENT_AT_MUZZLE_06",
            label = "Muzzle",
            item = "muzzle6",
        },
        ["muzzle7"] = {
            component = "COMPONENT_AT_MUZZLE_07",
            label = "Muzzle",
            item = "muzzle7",
        },
    },
    ["WEAPON_CARBINERIFLE_MK2"] = { 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Fener",
            item = "flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Tutamaç",
            item = "grip",
        },
        ["clip"] = {
            component = "COMPONENT_CARBINERIFLE_MK2_CLIP_02",
            label = "Sarjör",
            item = "clip",
        },

        ["scope"] = {
            component = "COMPONENT_AT_SIGHTS",
            label = "Dürbün",
            item = "scope",
        },
        ["scope2"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_MK2",
            label = "Dürbün",
            item = "scope2",
        },
        ["scope3"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Dürbün",
            item = "scope3",
        },

        ["muzzle"] = {
            component = "COMPONENT_AT_MUZZLE_01",
            label = "Muzzle",
            item = "muzzle",
        },
        ["muzzle2"] = {
            component = "COMPONENT_AT_MUZZLE_02",
            label = "Muzzle",
            item = "muzzle2",
        },
        ["muzzle3"] = {
            component = "COMPONENT_AT_MUZZLE_03",
            label = "Muzzle",
            item = "muzzle3",
        },
        ["muzzle4"] = {
            component = "COMPONENT_AT_MUZZLE_04",
            label = "Muzzle",
            item = "muzzle4",
        },
        ["muzzle5"] = {
            component = "COMPONENT_AT_MUZZLE_05",
            label = "Muzzle",
            item = "muzzle5",
        },
        ["muzzle6"] = {
            component = "COMPONENT_AT_MUZZLE_06",
            label = "Muzzle",
            item = "muzzle6",
        },
        ["muzzle7"] = {
            component = "COMPONENT_AT_MUZZLE_07",
            label = "Muzzle",
            item = "muzzle7",
        },
    },
}

function FormatWeaponAttachments(itemdata)
    local attachments = {}
    itemdata.name = itemdata.name:upper()
    if itemdata.info.attachments ~= nil and next(itemdata.info.attachments) ~= nil then
        for k, v in pairs(itemdata.info.attachments) do
            if WeaponAttachments[itemdata.name] ~= nil then
                for key, value in pairs(WeaponAttachments[itemdata.name]) do
                    if value.component == v.component then
                        table.insert(attachments, {
                            attachment = key,
                            label = value.label
                        })
                    end
                end
            end
        end
    end
    return attachments
end

RegisterNUICallback('GetWeaponData', function(data, cb)
    local data2 = {
        WeaponData = Config.Weapons[data.weapon],
        AttachmentData = FormatWeaponAttachments(data.ItemData)
    }
    cb(data2)
end)

RegisterNUICallback('RemoveAttachment', function(data, cb)
    local WeaponData = Config.Weapons[data.WeaponData.name]
    local Attachment = WeaponAttachments[WeaponData.name:upper()][data.AttachmentData.attachment]
    
    ESX.TriggerServerCallback('weapons:server:RemoveAttachment', function(NewAttachments)
        if NewAttachments ~= false then
            local Attachies = {}
            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            for k, v in pairs(NewAttachments) do
                for wep, pew in pairs(WeaponAttachments[WeaponData.name:upper()]) do
                    if v.component == pew.component then
                        table.insert(Attachies, {
                            attachment = pew.item,
                            label = pew.label,
                        })
                    end
                end
            end
            local DJATA = {
                Attachments = Attachies,
                WeaponData = WeaponData,
            }
            cb(DJATA)
        else
            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(data.WeaponData.name), GetHashKey(Attachment.component))
            cb({})
        end
    end, data.AttachmentData, data.WeaponData)
end)

RegisterNetEvent("inventory:client:CheckWeapon")
AddEventHandler("inventory:client:CheckWeapon", function(weaponName)
    if currentWeapon == weaponName then 
        TriggerEvent('weapons:ResetHolster')
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(PlayerPedId(), true)
        currentWeapon = nil
    end
end)

RegisterNetEvent("inventory:client:AddDropItem")
AddEventHandler("inventory:client:AddDropItem", function(dropId, coord, player)
    Drops[dropId] = {
        id = dropId,
        coords = coord
    }
end)


RegisterNetEvent("inventory:client:RemoveDropItem")
AddEventHandler("inventory:client:RemoveDropItem", function(dropId)
    Drops[dropId] = nil
end)

RegisterNetEvent("inventory:client:DropItemAnim")
AddEventHandler("inventory:client:DropItemAnim", function()
    SendNUIMessage({
        action = "close",
        TriggerScreenblurFadeOut(0)
    })
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Citizen.Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
    Citizen.Wait(2000)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent("inventory:client:SetCurrentStash")
AddEventHandler("inventory:client:SetCurrentStash", function(stash)
    CurrentStash = stash
end)

RegisterNUICallback('getCombineItem', function(data, cb)
    cb(ItemInfos[tostring(data.item)])
end)

RegisterCommand('f2fix',function()
    CurrentDrop = 0
    CurrentVehicle = nil
    CurrentGlovebox = nil
    CurrentStash = nil
    SetNuiFocus(false, false)
    inInventory = false
    inventorylocked = false
    ClearPedTasks(PlayerPedId())
end)

RegisterNUICallback("CloseInventory", function(data, cb)
    TriggerScreenblurFadeOut(0)
    if currentOtherInventory == "none-inv" then
        CurrentDrop = 0
        CurrentVehicle = nil
        CurrentGlovebox = nil
        CurrentStash = nil
        SetNuiFocus(false, false)
        inInventory = false
        ClearPedTasks(PlayerPedId())
        return
    end
    if CurrentVehicle ~= nil then
        CloseTrunk()
        TriggerScreenblurFadeOut(0)
        TriggerServerEvent("inventory:server:SaveInventory", "trunk", CurrentVehicle)
        CurrentVehicle = nil
    elseif CurrentGlovebox ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "glovebox", CurrentGlovebox)
        CurrentGlovebox = nil
    elseif CurrentStash ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "stash", CurrentStash)
        CurrentStash = nil
    else
        TriggerServerEvent("inventory:server:SaveInventory", "drop", CurrentDrop)
        CurrentDrop = 0
    end
    SetNuiFocus(false, false)
    inInventory = false
end)

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("inventory:server:UseItem", data.inventory, data.item)
end)

RegisterNUICallback("combineItem", function(data)
    Citizen.Wait(150)
    TriggerServerEvent('inventory:server:combineItem', data.reward, data.fromItem, data.toItem)
    TriggerEvent('inventory:client:ItemBox', ItemInfos[tostring(data.reward)], 'add')
end)

RegisterNUICallback('combineWithAnim', function(data)
    local combineData = data.combineData
    local aDict = combineData.anim.dict
    local aLib = combineData.anim.lib
    local animText = combineData.anim.text
    local animTimeout = combineData.anim.timeOut
    StopAnimTask(PlayerPedId(), aDict, aLib, 1.0)
    TriggerServerEvent('inventory:server:combineItem', combineData.reward, data.requiredItem, data.usedItem)
    TriggerEvent('inventory:client:ItemBox', ItemInfos[tostring(combineData.reward)], 'add')
end)

RegisterNUICallback("SetInventoryData", function(data, cb)
    TriggerServerEvent("inventory:server:SetInventoryData", data.fromInventory, data.toInventory, data.fromSlot, data.toSlot, data.fromAmount, data.toAmount)
end)

RegisterNUICallback("PlayDropSound", function(data, cb)
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback("PlayDropFail", function(data, cb)
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

function OpenTrunk()
    local vehicle = ESX.Game.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorOpen(vehicle, 4, false, false)
    else
        SetVehicleDoorOpen(vehicle, 5, false, false)
    end
end

function CloseTrunk()
    local vehicle = ESX.Game.GetClosestVehicle()
    while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do
        RequestAnimDict("amb@prop_human_bum_bin@idle_b")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        SetVehicleDoorShut(vehicle, 4, false)
    else
        SetVehicleDoorShut(vehicle, 5, false)
    end
end

function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

function ToggleHotbar(toggle)
    local HotbarItems = {
        [1] = ESX.GetPlayerData().inventory[1],
        [2] = ESX.GetPlayerData().inventory[2],
        [3] = ESX.GetPlayerData().inventory[3],
        [4] = ESX.GetPlayerData().inventory[4],
        [5] = ESX.GetPlayerData().inventory[5],
        [41] = ESX.GetPlayerData().inventory[41],
    } 
    if toggle then
        SendNUIMessage({
            action = "toggleHotbar",
            open = true,
            items = HotbarItems
        })
        TriggerServerEvent("bank:cashbal")
        TriggerServerEvent("bank:bankbal")
    else
        SendNUIMessage({
            action = "toggleHotbar",
            open = false,
        })
    end
end

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent("inventory:client:useitemkkkkk")
AddEventHandler("inventory:client:useitemkkkkk",function(item)
    TriggerServerEvent("esx:useItem", item)
end)

RegisterNetEvent('police:client:RobPlayer')
AddEventHandler('police:client:RobPlayer', function()
local player, distance = ESX.Game.GetClosestPlayer()
targetplayer = GetPlayerFromServerId(player)
local dead = exports["disc-ambulancejob"]:GetDeath()
if not dead then
    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
            if IsEntityPlayingAnim(GetPlayerPed(player), 'random@mugging3', 'handsup_standing_base', 3) or IsEntityPlayingAnim(GetPlayerPed(player), 'dead', 'dead_a', 3) then
                if IsPedArmed(PlayerPedId(), 4) then
                    local plyCoords = GetEntityCoords(playerPed)
                    local pos = GetEntityCoords(PlayerPedId())
                    local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
                    if dist < 2.5 then
                        loadAnimDict('random@shop_robbery')
                        TaskPlayAnim(PlayerPedId(),'random@shop_robbery', 'robbery_action_b',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
                        StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
                            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                            TriggerEvent("inventory:server:RobPlayer", playerId)
                            TriggerServerEvent("police:server:SearchPlayer", playerId)
                    else
                        TriggerEvent("notification","Yakında kimse yok")
                    end
                else
                    TriggerEvent('notification','Silahın yok',2)
                end
            else
                TriggerEvent('notification','Kişi ellerini kaldırmamış',2)
            end
        else
            TriggerEvent("notification","Yakında kimse yok")
        end
    end
end)

RegisterNetEvent('qb_inventory:policesearch')
AddEventHandler('qb_inventory:policesearch', function()
    local player, distance = ESX.Game.GetClosestPlayer()
    targetplayer = GetPlayerFromServerId(player)
    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        local plyCoords = GetEntityCoords(playerPed)
        local pos = GetEntityCoords(PlayerPedId())
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
        if dist < 2.5 then
            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
            TriggerEvent("inventory:server:RobPlayer", playerId)
            TriggerServerEvent("police:server:SearchPlayer", playerId)
        else
            exports["mythic_notify"]:SendAlert("error", "Yakında kimse yok.")
        end
    else
        exports["mythic_notify"]:SendAlert("error", "Yakında kimse yok.")
    end
end)

RegisterCommand('rapor',function(source, args, rawCommand)
	if ESX.GetPlayerData().job.name == 'police' then
        TriggerEvent("mythic_progbar:client:progress", {
            name = "nufus:kimlikver",
            duration = 5000,
            label = 'Rapor Açılıyor..',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "missheistdockssetup1clipboard@base",
                anim = "base",
                flags = 49,
            },
            prop = {
                model = "p_amb_clipboard_01",
                bone = 18905,
                coords = { x = 0.10, y = 0.02, z = 0.08 },
                rotation = { x = -80.0, y = 0.0, z = 0.0 },
            },
            propTwo = {
                model = "prop_pencil_01",
                bone = 58866,
                coords = { x = 0.12, y = 0.0, z = 0.001 },
                rotation = { x = -150.0, y = 0.0, z = 0.0 },
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "Rapor_"..args[1], { maxweight =100, slots = 10,  })
                TriggerEvent("inventory:client:SetCurrentStash","Rapor_"..args[1])
            end
        end)
	end
end)

RegisterCommand('kdepo',function(source)
    local PlayerData = ESX.GetPlayerData(source)
	local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    if DoesEntityExist(playerPed) then
        coords = GetEntityCoords(playerPed)

    if GetDistanceBetweenCoords(coords, -1073.9, -828.00, 14.8829, true) < 100.0 then
	if ESX.GetPlayerData().job.name == 'police' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Kdepo_"..ESX.GetPlayerData().identifier, { maxweight =100, slots = 20,  })
        TriggerEvent("inventory:client:SetCurrentStash","Kdepo_"..ESX.GetPlayerData().identifier)
	    end
    else
        exports['mythic_notify']:SendAlert('error', 'Bu bölgede kişisel depona ulaşamazsın')
    end
end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('randPickupAnim')
AddEventHandler('randPickupAnim', function()
    loadAnimDict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)

function getOwnerFromCoordsForGarbage(coords)
    local x, y, z = table.unpack(coords)
    x = math.floor(math.round(x, 0))
    y = math.floor(math.round(y, 0))
    return 'x' .. x .. 'y' .. y
end


function math.round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(data)
    PlayerData.job = data
end)

OpenMarket = function(v)
    local ShopItems = {}
    ShopItems.label = v.label.. " Market"
    ShopItems.items = v.Shop.Items
    ShopItems.slots = #v.Shop.Items
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..math.random(11111,99999), ShopItems)
    TriggerScreenblurFadeIn(0)
end

OpenStash = function(v)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'stashopen', 0.7)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", v.label.."Deposu")
    TriggerScreenblurFadeIn(0)
    TriggerEvent("inventory:client:SetCurrentStash", v.label.."Deposu")
end

RegisterNUICallback("GiveItem", function(data, cb)
    local player, distance = ESX.Game.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        local plyCoords = GetEntityCoords(playerPed)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
        if dist < 2.5 then
            SetCurrentPedWeapon(PlayerPedId(),'WEAPON_UNARMED',true)
            TriggerServerEvent("inventory:server:GiveItem", playerId, data.inventory, data.item, data.amount)
            print(data.amount)
        else
            exports['mythic_notify']:SendAlert('error', 'Yakın Değilsin!', 5500, { ['background-color'] = '#ff0000', ['color'] = '#000000' })
        end
    else
         exports['mythic_notify']:SendAlert('error', 'Yakında kiimse yok!', 5500, { ['background-color'] = '#ff0000', ['color'] = '#000000' })
    end
end)