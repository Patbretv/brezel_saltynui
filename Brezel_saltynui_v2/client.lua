local display = false

function SetDisplay(bool)
    display = bool
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) 
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)

AddEventHandler('SaltyChat_SoundStateChanged', function(isSoundMuted)
    if isSoundMuted then 
        SetDisplay(not display)
    else
        SetDisplay(false)
    end
end)

AddEventHandler('SaltyChat_PluginStateChanged', function(PluginState) 
    if PluginState == 2 or PluginState == 3 or PluginState == 0 then 
        SetDisplay(not display)
    else
        SetDisplay(false)
    end
end)
