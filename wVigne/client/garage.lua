ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

OpenMenu = false

local mainMenuVeh = RageUI.CreateMenu("Vigneron", "Choisissez votre vehicule !")

mainMenuVeh.Closed = function()
    OpenMenu = false
end

function GarageVigne()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(mainMenuVeh, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(mainMenuVeh, true)


        CreateThread(function()
            while OpenMenu do
                Wait(0)
                RageUI.IsVisible(mainMenuVeh, function()
                    for k,v in pairs(WVigne.GarageVeh) do
                        RageUI.Button(v.label, nil, {RightLabel = "→→"}, true, {
                            onSelected = function ()
                                SpawnVeh(v.name)
                                RageUI.CloseAll()
                            end
                        })
                    end
                end)
            end
        end)
    end
end