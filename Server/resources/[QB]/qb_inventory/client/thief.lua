ESX          = nil

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end

function OpenTargetInventory(target, distance)
    local searchPlayerPed = GetPlayerPed(target)
    if target ~= -1 and distance ~= -1 and distance <= 3.0 and not IsEntityPlayingAnim(searchPlayerPed, 'dead', 'dead_d', 3) and IsEntityPlayingAnim(searchPlayerPed, "missminuteman_1ig_2", "handsup_base", 3) then
		local playerP=PlayerPedId()
		
		TriggerEvent("mythic_progbar:client:progress", {
            name = "unique_action_name",
            duration = 6000,
            label = "Üzerini Arıyorsun",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "combat@aim_variations@arrest",
                anim = "cop_med_arrest_01",
            }
        }, function(status)
            if not status then
                --TriggerEvent('m3:inventoryhud:client:openPlayerInventory', GetPlayerServerId(target), 'player')
                TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(target))
                ClearPedTasksImmediately(playerP)
                Citizen.CreateThread(function()
                    local closed = false
                    while true do
                        Citizen.Wait(3)
                        if not closed then
                            if not IsEntityPlayingAnim(searchPlayerPed, "missminuteman_1ig_2", "handsup_base", 3) then
                                TriggerEvent("inventory:client:forceClose")
                                closed = true
                                break
                            end

                            local target, distance = ESX.Game.GetClosestPlayer()
                            if distance > 3.0 then
                                TriggerEvent("inventory:client:forceClose")
                                closed = true
                                break
                            end
                        end
                        if closed then
                            closed = false
                            break
                        end
                    end
                end)
            else
                exports["mythic_notify"]:SendAlert("inform", "İşlem iptal edildi.")
                ClearPedTasks(ped)
            end
		end)
    else
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında kelepçeli veya ellerini kaldıran kimse yok!'})
    end
end

function OpenDeadTargetInventory(target, distance)
    local searchPlayerPed = GetPlayerPed(target)
    if target ~= -1 and distance ~= -1 and distance <= 3.0 and IsEntityPlayingAnim(searchPlayerPed, 'dead', 'dead_d', 3) then
       
		local playerP=GetPlayerPed()
		local playerP1=PlayerPedId()
		local animDict = "amb@medic@standing@tendtodead@enter"
		local animLib = "enter"
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(50)
		end
        TriggerEvent("mythic_progbar:client:progress", {
            name = "unique_action_name",
            duration = 17000,
            label = "Uzerini Arıyorsun",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@medic@standing@tendtodead@idle_a",
                anim = "idle_b",
            }
        }, function(status)
            if not status then
                --TriggerEvent('m3:inventoryhud:client:openPlayerInventory', GetPlayerServerId(target), 'dead')
                TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", GetPlayerServerId(target))
                Citizen.CreateThread(function()
                    local closed = false
                    while true do
                        Citizen.Wait(3)
                        if not closed then
                            if not IsEntityPlayingAnim(searchPlayerPed, 'dead', 'dead_d', 3) then
                                TriggerEvent("inventory:client:forceClose")
                                ClearPedTasksImmediately(PlayerPedId())
                                closed = true
                                break
                            end
                            
                            local target, distance = ESX.Game.GetClosestPlayer()
                            if distance > 3.0 then
                                TriggerEvent("inventory:client:forceClose")
                                closed = true
                                ClearPedTasksImmediately(PlayerPedId())
                                break
                            end
                        end
                        if closed then
                            ClearPedTasksImmediately(PlayerPedId())
                            closed = false
                            break
                        end
                    end
                end)
            else
                exports["mythic_notify"]:SendAlert("inform", "İşlem iptal edildi.")
				ClearPedTasks(ped)
            end
        end)
    else
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında ölü olan kimse yok!'})
    end
end

RegisterCommand('ara', function()
local target, distance = ESX.Game.GetClosestPlayer()
if not IsEntityPlayingAnim(PlayerPedId(), 'dead', 'dead_a', 3) then
    if target ~= -1 and distance ~= -1 and distance <= 3.0 then
        if not IsEntityPlayingAnim(GetPlayerPed(target), 'dead', 'dead_d', 3) and IsEntityPlayingAnim(GetPlayerPed(target), "missminuteman_1ig_2", "handsup_base", 3) then
            if IsPedArmed(PlayerPedId(), 7) then
                OpenTargetInventory(target, distance)
            else
                TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Silahını çekmen gerekiyor!'})
            end
        else
            if IsEntityPlayingAnim(GetPlayerPed(target), 'dead', 'dead_d', 3) then
                OpenDeadTargetInventory(target, distance)
            end
        end
    else
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında kimse yok!'})
    end
else
    TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'İnşallah yaparsın kankii!'})
    end
end)

RegisterNetEvent('qb-inv:soy')
AddEventHandler('qb-inv:soy', function()
    local target, distance = ESX.Game.GetClosestPlayer()
    if not IsEntityPlayingAnim(PlayerPedId(), 'dead', 'dead_a', 3) then
        if target ~= -1 and distance ~= -1 and distance <= 3.0 then
            if not IsEntityPlayingAnim(GetPlayerPed(target), 'dead', 'dead_d', 3) and IsEntityPlayingAnim(GetPlayerPed(target), "missminuteman_1ig_2", "handsup_base", 3) then
                if IsPedArmed(PlayerPedId(), 7) then
                    OpenTargetInventory(target, distance)
                else
                    TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Silahını çekmen gerekiyor!'})
                end
            else
                if IsEntityPlayingAnim(GetPlayerPed(target), 'dead', 'dead_d', 3) then
                    OpenDeadTargetInventory(target, distance)
                end
            end
        else
            TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında kimse yok!'})
        end
    else
        TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'İnşallah yaparsın kankii!'})
    end
end)