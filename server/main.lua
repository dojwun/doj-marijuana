
RegisterNetEvent("doj:server:addLowGradeMarijuana", function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
	if (10 >= math.random(1, 100)) then
        if Player.Functions.AddItem("marijuana_seeds", 1, slot, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_seeds"], "add", 1)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
	end
    if Player.Functions.AddItem('marijuana_crop_low', 1, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_crop_low"], "add", 1)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end
end)

RegisterServerEvent('doj:server:addMidGradeMarijuana', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 3)
	if (25 >= math.random(1, 100)) then
        if Player.Functions.AddItem("marijuana_seeds", 1, slot, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_seeds"], "add", 1)
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
        end
	end
    if Player.Functions.AddItem('marijuana_crop_mid', quantity, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_crop_mid"], "add", quantity)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end
end)

RegisterNetEvent("doj:server:addHighGradeMarijuana",function(seed, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    local amount = 3 * tonumber(info.stage) / 100
    amount = math.floor(amount + 0.5)
    if info.stage < 20 then
        amount = 0
    end
    if (50 >= math.random(1, 100)) then
        Player.Functions.AddItem('marijuana_seeds', 1, nil, {["quality"] = 100}) 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_seeds'], "add", 1) 
    end
    if Player.Functions.AddItem('marijuana_crop_high', amount, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_crop_high"], "add", amount)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pocket', 'error')
    end 
end)
