AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('Gracias por utilizar mi script, te invito a mi discord para conocer sobre otros scripts.')
    print('discord.gg/difamadosrp')
  end)

RegisterServerEvent('pk:reportlog')
AddEventHandler('pk:reportlog', function(motiv)
    local src = source
    local playerId = source
    local nomb = GetPlayerName(src)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if motiv == nil then

    else
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers do
            local player = xPlayers[i]
            local playerName = GetPlayerName(player)
            TriggerClientEvent('chatMessage', player, '^1El jugador ^3' .. nomb .. ' [' .. src .. '] ^1ha reportado: ^3' .. motiv)
            DiscordLog("PK Scripts", "El jugador **"..nomb.."** ".."**["..src.."]**".." realizó un nuevo reporte", "**motiv:** \n".."> **"..motiv.."**", "Report System by PK_SCRIPTS")
        end
    end

end)

function DiscordLog(autor, title, message, futer)
    local webHook = ''
    local embedData = {{
        ['title'] = title,
        ['color'] = 16711680,
        ['footer'] = {
            ['text'] = futer .. ' | ' .. os.date("%d/%m/%Y %X %p")
        },
        ['description'] = message,
        ['author'] = {
            ['name'] = autor
        }
    }}
    PerformHttpRequest(webHook, nil, 'POST', json.encode({
        username = 'pelaoloko',
        embeds = embedData
    }), {
        ['Content-Type'] = 'application/json'
    })
end
