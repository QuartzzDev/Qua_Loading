local isLoading = false

RegisterNetEvent("QuaLoading:StartLoading")
AddEventHandler("QuaLoading:StartLoading", function(time, text)
    if not isLoading then
        isLoading = true
        SendNUIMessage({
            type = "show_loading_bar",
            time = time,
            animation = "spin " .. time .. "ms linear infinite",
            text = text
        })
        Citizen.Wait(time)
        isLoading = false
        ExecuteCommand("e c")
    end
end)

RegisterCommand("loading", function(source, args, rawCommand)
    local loadingTime = tonumber(args[1]) or 3
    local loadingText = args[2] or "Loading..." or args[2] + args[3] or args[2] + args[3] + args[4]

    TriggerEvent("QuaLoading:StartLoading", loadingTime, loadingText)
end, false)

