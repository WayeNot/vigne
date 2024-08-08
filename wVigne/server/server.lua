ESX = exports['es_extended']:getSharedObject()
TriggerEvent('esx_society:registerSociety', 'vigne', 'vigne', 'society_vigne', 'society_vigne', 'society_vigne', {type = 'private'})

RegisterServerEvent('wVigne:notifInfos')
AddEventHandler('wVigne:notifInfos', function(title, subject, msg, icon, iconType)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers	= ESX.GetPlayers()
    local jobPlayer = xPlayer.getJob().name

    for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], title, subject, msg, icon, iconType)
    end
end)

RegisterServerEvent('wVigne:checkInventory')
AddEventHandler('wVigne:checkInventory', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local invItem = xPlayer.getInventoryItem(WVigne.Farm[1].addItemName).count
    local limitItem = 50

    if invItem >= limitItem then
        TriggerClientEvent('esx:showNotification', _source, "T'as pas assez de place dans ton inventaire !")
        TriggerClientEvent('wVigne:stopHarvesting', _source)  -- Arrêter la récolte
    else
        TriggerClientEvent('wVigne:startHarvesting', _source)  -- Démarrer la récolte
    end
end)

RegisterServerEvent('wVigne:recolte')
AddEventHandler('wVigne:recolte', function(count, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local invItem = xPlayer.getInventoryItem(item).count
    local limitItem = 50

    if invItem >= limitItem then
        TriggerClientEvent('esx:showNotification', _source, "T'as pas assez de place dans ton inventaire !")
        TriggerClientEvent('wVigne:stopHarvesting', _source)  -- Arrêter la récolte
    else
        xPlayer.addInventoryItem(item, count)
        TriggerClientEvent('esx:showNotification', _source, "Récolte en cours...")
    end
end)