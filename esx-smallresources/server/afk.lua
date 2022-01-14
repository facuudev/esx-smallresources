ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('KickForAFK', function()
    local src = source
	DropPlayer(src, 'You Have Been Kicked For Being AFK')
end)

ESX.RegisterServerCallback("Detectargrupo:usuario", function(source, cb)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerGroup = nil

    if player ~= nil then
        local playerGroup = player.getGroup()
        print(playerGroup," DETECTANDO SI ES GRUPO SERVER-SIDE")

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)