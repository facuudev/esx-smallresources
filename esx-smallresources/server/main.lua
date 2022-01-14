ESX = exports.es_extended:getSharedObject()

local VehicleNitrous = {}

RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

ESX.RegisterServerCallback('nos:GetNosLoadedVehs', function(source, cb)
    cb(VehicleNitrous)
end)

RegisterCommand('id', function(source, args, rawCommand)
    local playerId = source
    
    
    TriggerClientEvent('ms-notify:SendAlert', source, "ID : "..source)
end, true)

ESX.RegisterUsableItem("harness", function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    TriggerClientEvent('seatbelt:client:UseHarness', src, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    if Player.PlayerData.items[item.slot].info.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['harness'], "remove")
        xPlayer.removeInventoryItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if hp == 0 then
        xPlayer.removeInventoryItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('qb-carwash:server:washCar', function()
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if xPlayer.removeMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif xPlayer.removeMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        xPlayer.showNotification( src, 'You dont have enough money..', 'error')
    end
end)

ESX.RegisterServerCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(ESX.GetExtendedPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)
