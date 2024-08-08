-- ↓ Garage Véhicules ↓

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local ped = PlayerPedId()
        local posPlayer = GetEntityCoords(ped)
        local point = WVigne.Pos.posGarageMenu
        local dist = #(posPlayer-point)
        
        if dist <= 1.5 then
            Visual.Subtitle('Appuyer sur [~r~E~s~] pour prendre un ~g~véhicule~s~ !')
            if IsControlJustPressed(1, 51) then
                GarageVigne()
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local pedPos = GetEntityCoords(ped)
        local point = WVigne.Pos.posDeleteVeh
        local dist = #(pedPos-point)
        local inVeh = GetVehiclePedIsIn(ped, false)

        if dist <= 3.0 then
            if ESX.PlayerData.job.name == 'vigne' then
                DrawMarker(21, point, 0, 0, 0, 0.0, nil, nil, 0.5, 0.5, 0.5, 0, 0, 0, 170, 0, 1, 0, 0, nil, nil, 0)

                if dist <= 1.5 then
                    Visual.Subtitle('Appuyer sur [~r~E~s~] pour ranger votre ~g~véhicule~s~ !')
                    if IsControlJustPressed(1, 51) then
                        ESX.Game.DeleteVehicle(inVeh)    
                        ESX.ShowNotification('Vous venez de ranger votre ~g~véhicule !')
                    end
                end
            end
        end
    end
end)

function SpawnVeh(name)
    local ped = PlayerPedId()
    local hash = name
    local SpawnPos = WVigne.Pos.posSortieVeh
    local SpawnPosH = WVigne.Pos.posHeadingSortieVeh

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(10)
    end

    local Veh = CreateVehicle(hash, SpawnPos, SpawnPosH, true, false)
    TaskWarpPedIntoVehicle(ped, Veh, -1)
    SetVehicleNumberPlateText(Veh, 'Vigne')
end

Citizen.CreateThread(function()
    local Point = WVigne.PosPed.posGarageVeh.posMenu
    local Heading = WVigne.PosPed.posGarageVeh.Heading
    local hash = GetHashKey(WVigne.PosPed.posGarageVeh.Hash)
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    Ped = CreatePed("PED_TYPE_CIVMALE", hash, Point, Heading, false, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end