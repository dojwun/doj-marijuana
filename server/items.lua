
QBCore.Functions.CreateUseableItem("marijuana_seeds", function(source, item)
    TriggerClientEvent("doj:client:startPlanting", source, 'marijuana_seeds') 
end)

QBCore.Functions.CreateUseableItem("marijuana_baggies", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('marijuana_scale')
    if scaleCheck ~= nil then
        TriggerClientEvent('doj:client:baggieMenu', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have a scale", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_3.5_low", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('marijuana_rollingpapers')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling Joints')
	    Citizen.Wait(3700)
	    alreadyrolling = false

        Player.Functions.RemoveItem('marijuana_3.5_low', 1)
        Player.Functions.RemoveItem('marijuana_rollingpapers', 1)
        Player.Functions.AddItem('marijuana_joint', 3, slot, {["quality"] = 100})

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_low'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_rollingpapers'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_3.5_mid", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('marijuana_rollingpapers')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling Joints')
	    Citizen.Wait(3700)
	    alreadyrolling = false

        Player.Functions.RemoveItem('marijuana_3.5_mid', 1)
        Player.Functions.RemoveItem('marijuana_rollingpapers', 1)
        Player.Functions.AddItem('marijuana_joint', 3, slot, {["quality"] = 100})
        
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_mid'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_rollingpapers'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_joint'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_3.5_high", function(source, item) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rollingpaper = Player.Functions.GetItemByName('marijuana_rollingpapers')
    if rollingpaper ~= nil and not alreadyrolling then
        alreadyrolling = true
	    TriggerClientEvent('pogressBar:drawBar', src, 3700, 'Rolling Joints')
	    Citizen.Wait(3700)
	    alreadyrolling = false

        Player.Functions.RemoveItem('marijuana_3.5_high', 1)
        Player.Functions.RemoveItem('marijuana_rollingpapers', 1)
        Player.Functions.AddItem('marijuana_joint3g', 3, slot, {["quality"] = 100})
        
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_high'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_rollingpapers'], "remove", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_joint3g'], "add", 3)
    elseif alreadyrolling then
        TriggerClientEvent('QBCore:Notify', src, "You are already rolling a Joint'", 'error')
    else    
        TriggerClientEvent('QBCore:Notify', src, "You dont have any rolling papers!", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_joint", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local LighterCheck = Player.Functions.GetItemByName('marijuana_lighter')
    if LighterCheck ~= nil then
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['marijuana_lighter'], "used")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['marijuana_joint'], "remove", 1)
            TriggerClientEvent('doj:client:smokeJoint', source)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("marijuana_joint3g", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local LighterCheck = Player.Functions.GetItemByName('marijuana_lighter')
    if LighterCheck ~= nil then
	    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['marijuana_lighter'], "used")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['marijuana_joint3g'], "remove", 1)
            TriggerClientEvent('doj:client:smokeJoint3g', source)
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have a Lighter", 'error')
    end
end)

