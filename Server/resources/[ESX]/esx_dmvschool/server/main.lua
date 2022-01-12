ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_dmvschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('esx_dmvschool:addLicense')
AddEventHandler('esx_dmvschool:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('esx_dmvschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('esx_dmvschool:pay')
AddEventHandler('esx_dmvschool:pay', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('bank', Config.Miktar) --xPlayer.removeMoney(price) --xPlayer.removeMoney(price)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Banka hesabınızdan 1000$ kesildi!'}, 4000) --TriggerClientEvent('esx:showNotification', _source, _U('you_paid', ESX.Math.GroupDigits(price)))
end)

--[[RegisterServerEvent('esx-dmvschool:givepermit')
AddEventHandler('esx-dmvschool:givepermit', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('permit', 1)
end)--]]
