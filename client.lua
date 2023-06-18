-- I think we need ESX :)
ESX = exports["es_extended"]:getSharedObject()

-- Command for report (view the /command in config.lua)
RegisterCommand(Config.ReportCommand, function(source, args, rawCommand)
    local name = GetPlayerName(source)
    local input = lib.inputDialog('Reportar una situacion', {'Motivo'})

    if input then 
        local reason = input[1]

        if reason == nil or reason == "" then 
            notify('Tu reporte no es válido!', 'error')
        else 
            notify('Has enviado un reporte: '..reason, 'success')
            TriggerServerEvent('pk:reportlog', reason)
        end 
    end 
end, false)


-- Notify function, this maybe be used for notify something
function notify(msg, ntype)
    lib.notify({
        title = 'PK Report System',
        description = msg,
        position = 'center-right',
        type = ntype
    })
end
