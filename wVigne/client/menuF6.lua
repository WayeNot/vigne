ESX = exports['es_extended']:getSharedObject()

local mainMenuF6 = RageUI.CreateMenu("Vigneron", "Menu Intéraction !")
local annonceVigne = RageUI.CreateSubMenu(mainMenuF6, "Vigneron", "Faire une annonce")
local pointsFarm = RageUI.CreateSubMenu(mainMenuF6, "Vigneron", "Points de farms")

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

OpenMenu = false

mainMenuF6.Closed = function()
    OpenMenu = false
end

Keys.Register('F6', 'F6', 'Vigneron', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
        MenuF6gssd()
    end
end)

function MenuF6gssd()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(mainMenuF6, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(mainMenuF6, true)


        CreateThread(function()
            while OpenMenu do
                Wait(0)

                RageUI.IsVisible(mainMenuF6, function()

                    RageUI.Button('Faire une annonce', nil, {RightLabel = "→"}, true, {
                    }, annonceVigne)
                    RageUI.Button('Points GPS', nil, {RightLabel = "→"}, true, {
                    }, pointsFarm)

                end)

                RageUI.IsVisible(annonceVigne, function()
                    for k,v in pairs(WVigne.InfosNotifs) do
                        RageUI.Button(v.label, nil, {RightLabel = '→'}, true, {
                            onSelected = function()
                                TriggerServerEvent('wVigne:notifInfos', WVigne.NotifOptions.title, v.subject, v.msg, WVigne.NotifOptions.icon, WVigne.NotifOptions.iconType)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(pointsFarm, function()
                    for k,v in pairs(WVigne.Farm) do
                        RageUI.Button(v.label, nil, {RightLabel = '→'}, true, {
                            onSelected = function()
                                SetNewWaypoint(v.posGPS)
                            end
                        })
                    end
                end)
            end
        end)
    end
end