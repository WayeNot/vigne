ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

local PlayerData = {}
OpenMenu = false

local wBoss = RageUI.CreateMenu('Boss', "Intéraction..")

wBoss.Closed = function()
    OpenMenu = false
end

function VigneBoss()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(wBoss, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(wBoss, true)
        CreateThread(function()
            while OpenMenu do
                Wait(0)
                RageUI.IsVisible(wBoss, function()
                    RageUI.Separator("↓     ~y~Gestion de l'entreprise     ~s~↓")
                    RageUI.Button("Retirer argent de société", nil, {RightLabel = "~y~→→"}, true , {
                        onSelected = function()
                            local amount = KeyboardInput("Montant", "", 10)
                                amount = tonumber(amount)
                                if amount == nil then
                                    RageUI.Popup({message = "Montant invalide"})
                                else
                                    TriggerServerEvent('esx_society:withdrawMoney', 'vigne', amount)
                                end
                        end
                    })
                    RageUI.Button("Déposer argent de société", nil, {RightLabel = "~y~→→"}, true , {
                        onSelected = function()
                            local amount = KeyboardInput("Montant", "", 10)
                                amount = tonumber(amount)
                                if amount == nil then
                                    RageUI.Popup({message = "Montant invalide"})
                                else
                                    TriggerServerEvent('esx_society:depositMoney', 'vigne', amount)
                                end
                        end
                    })
                    RageUI.Button("Gestion Entreprise", nil, {RightLabel = "~y~→→→"}, true , {
                        onSelected = function()
                            WBoss()
                            RageUI.CloseAll()
                        end
                    })
                end)
            end
        end)
    end
end

function WBoss()
    TriggerEvent('esx_society:openBossMenu', 'vigne', function(data, menu)
        menu.close()
    end, {wash = false})
end


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local pedPos = GetEntityCoords(ped)
        local point = WVigne.Pos.posBoss
        local dist = #(pedPos-point)

        if dist <= 3.0 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
                DrawMarker(21, point, 0, 0, 0, 0.0, nil, nil, 0.5, 0.5, 0.5, 0, 0, 0, 170, 0, 1, 0, 0, nil, nil, 0)

                if dist <= 1.5 then
                    Visual.Subtitle('Appuyer sur [~r~E~s~] pour ranger votre ~g~véhicule~s~ !')
                    if IsControlJustPressed(1, 51) then
                        VigneBoss()
                    end
                end
            end
        end
    end
end)