WVigne = {
    Pos = {
        posBoss = vector3(-1875.963, 2060.863, 145.5737),
        posCoffre = vector3(-1876.392, 2063.388, 135.915),
        posVestiaire = vector3(-1887.31, 2070.228, 145.5739),
        posMenuRdv = vector3(1650.575, 4884.487, 42.15595),
        posGarageMenu = vector3(-1924.782, 2058.768, 140.8334),
        posSortieVeh = vector3(-1923.321, 2067.915, 140.5146),
        posHeadingSortieVeh = 1.561652,
        posDeleteVeh = vector3(-1923.257, 2067.52, 140.5302),
    },
    MarkerOptions = {
        Marker = true, -- false si vous ne voulez pas voir le marker sur la map !
        posMarker = vector3(-1887.61, 2067.821, 140.9839),
        Sprite = 871,
        Display = 6,
        Scale = 1,
        Color = 83,
        Texte = 'Vigneron',
    },
    PosPed = {
        posGarageVeh = {
            posMenu = vector3(-1924.782, 2058.768, 140.8334-1),
            Heading = 343.4253,
            Hash = 'a_m_y_vinewood_03',
        },
        posTraitement = {
            posMenu = vector3(-50.22668, 1911.053, 195.7054-1),
            Heading = 93.9074,
            Hash = 'a_m_y_vinewood_03'
        },
        posVente = {
            posMenu = vector3(-55.03809, 1907.536, 195.3613-1),
            Heading = 48.61751,
            Hash = 'ig_zimbor'
        },
    },
    GarageVeh = {
        {label = 'Véhicule de vente', name = 'sadler'},
        {label = 'Véhicule de farm', name = 'youga2'},
        {label = 'Véhicule patron', name = 'revolter'},
    },
    Farm = {
        {
            label = 'Récolte',
            pos = vector3(-1844.233, 2094.667, 139.151),
            posGPS = vector2(-1844.233, 2094.667),
            addItemCount = 1,
            addItemName = 'bread',
            time = 4,
            load = 0.0,
            attenteR = 0.0035,
        },
        {
            label = 'Traitement',
            pos = vector3(-50.22668, 1911.053, 195.7054),
            posGPS = vector2(-50.22668, 1911.053),
            removeItemCount = 2,
            removeItemName = 'raisin',
            addItemCount = 1,
            addItemName = 'vin',
            time = 5,
            load = 0.0,
            attenteT = 0.0030,
        },
        {
            label = 'Vente',
            pos = vector3(-55.03809, 1907.536, 195.3613),
            posGPS = vector2(-55.03809, 1907.536),
            removeItemCount = 1,
            removeItemName = 'vin',
            addMoneyCountMin = 15,
            addMoneyCountMax = 20,
            time = 4,
            load = 0.0,
            attenteV = 0.0032,
        },
    },
    NotifOptions = {
        title = 'INFORMATIONS',
        icon = 'CHAR_JOE',
        iconType = 8,
    },
    InfosNotifs = {
        {label = 'Ouverture du vignoble', subject = '~p~🍇 - Vignoble', msg = 'Le ~p~vignoble~s~ ouvre actuellement ses portes !'},
        {label = 'Fermeture du vignoble', subject = '~p~🍇 - Vignoble', msg = 'Le ~p~vignoble~s~ vient de fermer ses portes !'},
    },
}