ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TestMod = true
-- Code

RegisterCommand("karaktersil", function(source, args)
    local player = ESX.GetPlayerFromId(source)
    if player.getGroup() == 'user' or 'admin' then
        TriggerClientEvent("qb-clothing:client:openMenu", source)
    end
end, false)

--ayakkabi

ESX.RegisterUsableItem('sapka', function() end)
ESX.RegisterUsableItem('maske', function() end)
ESX.RegisterUsableItem('tisort', function() end)
ESX.RegisterUsableItem('pantolon', function() end)
ESX.RegisterUsableItem('ayakkabi', function() end)
ESX.RegisterUsableItem('gozluk', function() end)

RegisterServerEvent("qb-clothing:saveSkin")
AddEventHandler('qb-clothing:saveSkin', function(model, skin)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if model ~= nil and skin ~= nil then 
        exports.ghmattimysql:execute('DELETE FROM playerskins WHERE citizenid = @identifier',
        {
            ['@identifier'] = Player.identifier
        })
        exports.ghmattimysql:execute("INSERT INTO playerskins (citizenid, model, skin, active) VALUES ('"..Player.getIdentifier().."', '"..model.."', '"..skin.."', 1)")
    end
end) 

RegisterServerEvent("qb-clothing:saveSkin_item")
AddEventHandler('qb-clothing:saveSkin_item', function(model, skin, previousSkinData)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local data = {identifier = Player.identifier, license = GetPlayerIdentifiers(src)[1]}

    local ccskin = json.decode(skin)
 

    local sapka = ESX.GetSlotsByItem(Player.inventory, "sapka")
    local maske = ESX.GetSlotsByItem(Player.inventory, "maske")
    local tisort = ESX.GetSlotsByItem(Player.inventory, "tisort")
    local pantolon = ESX.GetSlotsByItem(Player.inventory, "pantolon")
    local ayakkabi = ESX.GetSlotsByItem(Player.inventory, "ayakkabi")
    local gozluk = ESX.GetSlotsByItem(Player.inventory, "gozluk")
 
 
    if sapka and sapka[1]  then
        if sapka[1].info.item ~= ccskin["hat"].item and tonumber(ccskin["hat"].item) > -1 then
          Player.addInventoryItem("sapka", 1, false, { item = ccskin["hat"].item, texture = ccskin["hat"].texture })  
        end
    elseif tonumber(ccskin["hat"].item) ~= -1 then
        Player.addInventoryItem("sapka", 1, false, { item = ccskin["hat"].item, texture = ccskin["hat"].texture })  
    end

    if maske and maske[1]  then
        if maske[1].info.item ~= ccskin["mask"].item and ccskin["mask"].item ~= -1   then
          Player.addInventoryItem("maske", 1, false, { item = ccskin["mask"].item, texture = ccskin["mask"].texture })  
        end
    elseif tonumber(ccskin["mask"].item) ~= 0 then
        Player.addInventoryItem("maske", 1, false, { item = ccskin["mask"].item, texture = ccskin["mask"].texture })  
    end

    if tisort and tisort[1]  then
        if tisort[1].info.item ~= ccskin["t-shirt"].item and ccskin["t-shirt"].item ~= -1   then
          Player.addInventoryItem("tisort", 1, false, { item = ccskin["t-shirt"].item, texture = ccskin["t-shirt"].texture, kol_item = ccskin["arms"].item,  kol_texture = ccskin["arms"].texture, ceket_item = ccskin["torso2"].item, ceket_texture = ccskin["torso2"].texture  })  
        end
    elseif tonumber(ccskin["t-shirt"].item) ~= 1 then
        Player.addInventoryItem("tisort", 1, false, { item = ccskin["t-shirt"].item, texture = ccskin["t-shirt"].texture, kol_item = ccskin["arms"].item,  kol_texture = ccskin["arms"].texture, ceket_item = ccskin["torso2"].item, ceket_texture = ccskin["torso2"].texture  })  
    end

        --pantolon

    if pantolon and pantolon[1]  then
        if pantolon[1].info.item ~= ccskin["pants"].item and ccskin["pants"].item ~= -1   then
          Player.addInventoryItem("pantolon", 1, false, { item = ccskin["pants"].item, texture = ccskin["pants"].texture })  
        end
    elseif tonumber(ccskin["pants"].item) ~= 0 then
        Player.addInventoryItem("pantolon", 1, false, { item = ccskin["pants"].item, texture = ccskin["pants"].texture })  
    end

    if ayakkabi and ayakkabi[1]  then
        if ayakkabi[1].info.item ~= ccskin["shoes"].item and ccskin["shoes"].item ~= -1   then
          Player.addInventoryItem("ayakkabi", 1, false, { item = ccskin["shoes"].item, texture = ccskin["shoes"].texture })  
        end
    elseif tonumber(ccskin["shoes"].item) ~= 1 then
        Player.addInventoryItem("ayakkabi", 1, false, { item = ccskin["shoes"].item, texture = ccskin["shoes"].texture })  
    end

    if gozluk and gozluk[1]  then
        if gozluk[1].info.item ~= ccskin["glass"].item and ccskin["glass"].item ~= -1   then
          Player.addInventoryItem("gozluk", 1, false, { item = ccskin["glass"].item, texture = ccskin["glass"].texture })  
        end
    elseif tonumber(ccskin["glass"].item) ~= 0 then
        Player.addInventoryItem("gozluk", 1, false, { item = ccskin["glass"].item, texture = ccskin["glass"].texture })  
    end


 
     
    if model ~= nil and skin ~= nil then 
        exports['ghmattimysql']:execute("DELETE FROM `playerskins` WHERE `citizenid` = '"..data.identifier.."'", function()
            exports['ghmattimysql']:execute("INSERT INTO `playerskins` (`citizenid`, `model`, `skin`, `active`) VALUES ('"..data.identifier.."', '"..model.."', '"..skin.."', 1)")
        end)
    end

    TriggerClientEvent("qb-clothes:client:refreshPrevSkin", src, skin)
    exports['ghmattimysql']:executeSync("UPDATE users SET ilk_giris = @ilk_giris WHERE identifier = @identifier", { ['@identifier'] = data.identifier, ['@ilk_giris'] = 1 })
end)

RegisterServerEvent("qb-clothes:loadPlayerSkin")
AddEventHandler('qb-clothes:loadPlayerSkin', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local data = {identifier = Player.identifier, license = GetPlayerIdentifiers(src)[1]}
    exports['ghmattimysql']:execute("SELECT * FROM `playerskins` WHERE `citizenid` = '"..data.identifier.."' AND `active` = 1", function(result)
        if result[1] ~= nil then
            TriggerClientEvent("qb-clothes:loadSkin", src, false, result[1].model, result[1].skin)
        else
            TriggerClientEvent("qb-clothes:loadSkin", src, true)
        end
    end)
end)

RegisterServerEvent("qb-clothes:saveOutfit")
AddEventHandler("qb-clothes:saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local data = {identifier = Player.identifier, license = GetPlayerIdentifiers(src)[1]}
    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        

        
        exports['ghmattimysql']:execute("INSERT INTO `player_outfits` (`citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES ('"..data.identifier.."', '"..outfitName.."', '"..model.."', '"..json.encode(skinData).."', '"..outfitId.."')", function()
            exports['ghmattimysql']:execute("SELECT * FROM `player_outfits` WHERE `citizenid` = '"..data.identifier.."'", function(result)
                if result[1] ~= nil then
                    TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
                else
                    TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
                end
            end)
        end)
    end
end)

RegisterServerEvent("qb-clothing:server:removeOutfit")
AddEventHandler("qb-clothing:server:removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
	local data = {identifier = Player.identifier, license = GetPlayerIdentifiers(src)[1]}

    exports['ghmattimysql']:execute("DELETE FROM `player_outfits` WHERE `citizenid` = '"..data.identifier.."' AND `outfitname` = '"..outfitName.."' AND `outfitId` = '"..outfitId.."'", function()
        exports['ghmattimysql']:execute("SELECT * FROM `player_outfits` WHERE `citizenid` = '"..data.identifier.."'", function(result)
            if result[1] ~= nil then
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, result)
            else
                TriggerClientEvent('qb-clothing:client:reloadOutfits', src, nil)
            end
        end)
    end)
end)

ESX.RegisterServerCallback('qb-clothing:server:getOutfits', function(source, cb)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local anusVal = {}
    local data = {identifier = Player.identifier, license = GetPlayerIdentifiers(src)[1]}
    
    local maven_datastore = exports['ghmattimysql']:executeSync("SELECT ilk_giris FROM users WHERE identifier = @identifier", { ['@identifier'] = data.identifier })
    TriggerClientEvent('qb-clothing:client:Adez', src, { ilk_giris = maven_datastore[1].ilk_giris })
    
    exports['ghmattimysql']:execute("SELECT * FROM `player_outfits` WHERE `citizenid` = '"..data.identifier.."'", function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                result[k].skin = json.decode(result[k].skin)
                anusVal[k] = v
            end
            cb(anusVal)
        end
        cb(anusVal)
    end)
end)

RegisterServerEvent('qb-clothing:print')
AddEventHandler('qb-clothing:print', function(data)
    print(data)
end)

ESX.RegisterServerCallback('oph3z:MoneyCheck', function(source, cb, item)
    local x = ESX.GetPlayerFromId(source)
    item = x.getQuantity('cash', Config.StorePrice)
    if Config.StorePrice <= item then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('oph3z:RemoveStoreMoney')
AddEventHandler('oph3z:RemoveStoreMoney', function()
    local x = ESX.GetPlayerFromId(source)
    x.removeInventoryItem('cash', Config.StorePrice)
end)

ESX.RegisterServerCallback('oph3z:MoneyCheck:Barber', function(source, cb, item)
    local x = ESX.GetPlayerFromId(source)
    item = x.getQuantity('cash', Config.BarberPrice)
    if Config.BarberPrice <= item then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('oph3z:RemoveBarberMoney')
AddEventHandler('oph3z:RemoveBarberMoney', function()
    local x = ESX.GetPlayerFromId(source)
    x.removeInventoryItem('cash', Config.BarberPrice)
end)

-- RegisterCommand("helm", function(source, args)
--     TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 1) -- Hat
-- end)

-- RegisterCommand("glasses", function(source, args)
-- 	TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 2)
-- end)

-- RegisterCommand("mask", function(source, args)
-- 	TriggerClientEvent("qb-clothing:client:adjustfacewear", source, 4)
-- end)