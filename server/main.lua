lib.locale()

local jobs = {}

local function GetTableSize(t)
    local count = 0
    for _,_ in pairs(t) do
        count = count + 1
    end
    return count
end

CreateThread(function()
    local data
    repeat
        data = ESX.GetJobs()
        Wait(500)
    until GetTableSize(data) > 0
    --Copy the useful stuff from the jobs, otherwise the table is huge
    for k,v in pairs(data) do
        jobs[k] = { label = v.label, whitelisted = v.whitelisted }
    end
end)

lib.callback.register('lunar_jobcentre:getJobs', function(source)
    return jobs
end)

RegisterNetEvent('lunar_jobcentre:hired', function(index, job)
    local source = source
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.Locations[index].Coords)) < 5.0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if jobs[job].whitelisted then
            print('Player ' .. GetPlayerName(source) .. '(' .. xPlayer.identifier .. ') tried to set a whitelisted job. (Cheater)')
            return
        end
        xPlayer.setJob(job, 0)
    end
end)

lib.callback.register('lunar_jobcentre:buy', function(source, index, licenseIndex)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.Locations[index].Coords)) < 5.0 then
        local license = Config.Licenses[licenseIndex]
        if license.LicenseNeeded ~= false then
            local success, promise = nil, promise.new()
            TriggerEvent('esx_license:checkLicense', source, license.LicenseNeeded, function(result)
                success = result
                promise:resolve(true)
            end)
            Citizen.Await(promise)
            if success then
                local xPlayer = ESX.GetPlayerFromId(source)
                if xPlayer.getAccount('money').money >= license.Price then
                    Citizen.SetTimeout(7000, function()
                        --Check once again incase the money was removed
                        if xPlayer.getAccount('money').money >= license.Price then
                            xPlayer.removeAccountMoney('money', license.Price)
                            Wait(2000)
                            exports['ox_inventory']:AddItem(source, license.Item, 1, {
                                ['name'] = xPlayer.getName(),
                                ['dateofbirth'] = xPlayer.get('dateofbirth')
                            })
                        end
                    end)
                    return true
                else
                    return false, locale('not_enough_money')
                end
            else
                return false, locale('permission_denied')
            end
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.getAccount('money').money >= license.Price then
                Citizen.SetTimeout(7000, function()
                    --Check once again incase the money was removed
                    if xPlayer.getAccount('money').money >= license.Price then
                        xPlayer.removeAccountMoney('money', license.Price)
                        Wait(2000)
                        exports['ox_inventory']:AddItem(source, license.Item, 1, {
                            ['name'] = xPlayer.getName(),
                            ['dateofbirth'] = xPlayer.get('dateofbirth')
                        })
                    end
                end)
                return true
            else
                return false, locale('not_enough_money')
            end
        end
    end
end)