ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local isHarvesting = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k,v in pairs(WVigne.Farm) do

            local player = PlayerPedId()
            local coordsPlayer = GetEntityCoords(player)
            local coords = v.pos
            local dist = #(coordsPlayer-coords)

            if dist <= 3.0 then
                if ESX.PlayerData.job.name == 'vigne' then
                    DrawMarker(21, coords, 0, 0, 0, 0.0, nil, nil, 0.5, 0.5, 0.5, 0, 0, 0, 170, 0, 1, 0, 0, nil, nil, 0)
                    if dist <= 1.5 and IsPedOnFoot(player) then
                        Visual.Subtitle('Appuyez sur [~p~E~s~] pour commencer à récolter du raisin')
                        if IsControlJustPressed(1, 51) and not isHarvesting then
                            isHarvesting = true
                            Citizen.CreateThread(function()
                                while isHarvesting do
                                    TriggerServerEvent('wVigne:recolte', WVigne.Farm[1].addItemCount, WVigne.Farm[1].addItemName)
                                    Citizen.Wait(v.time*1000) -- Attente de 4 secondes entre chaque récolte
                                end
                            end)
                        elseif IsControlJustPressed(1, 51) and isHarvesting then
                            isHarvesting = false -- Arrêter la récolte
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('wVigne:startHarvesting')
AddEventHandler('wVigne:startHarvesting', function()
    Citizen.CreateThread(function()
        while isHarvesting do
            TriggerServerEvent('wVigne:recolte', WVigne.Farm[1].addItemCount, WVigne.Farm[1].addItemName)
            Citizen.Wait(4000) -- Attente de 4 secondes entre chaque récolte
        end
    end)
end)

RegisterNetEvent('wVigne:stopHarvesting')
AddEventHandler('wVigne:stopHarvesting', function()
    isHarvesting = false
end)