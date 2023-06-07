ESX = exports["es_extended"]:getSharedObject()

RegisterCommand(Config.ReportCommand, function(source, args, rawCommand)
    local nam = GetPlayerName(source)
    local input = lib.inputDialog('Reportar una situacion', {'Motivo'})

    if input then 
        local motivo = input[1]

        if motivo == nil or motivo == "" then 
            TriggerEvent('pk:notif', 'Tu reporte no es válido!', 'error')
        else 
            TriggerEvent('pk:notif', 'Has enviado un reporte: '..motivo, 'success')
            TriggerServerEvent('pk:reportlog', motivo)
        end 
    end 
end, false)

RegisterNetEvent('pk:notif')
AddEventHandler('pk:notif', function(msg, tipo)
    lib.notify({
        title = 'PK Report System',
        description = msg,
        position = 'center-right',
        type = tipo
    })
end)
