
local ox_inventory = exports.ox_inventory
local qbx_core = exports.qbx_core

RegisterServerEvent('doj:server:addPlantGrowShopItems', function(item, price, amount)
    local Player = qbx_core:GetPlayer(source)
    local total = amount * price

    local balance = Player.Functions.GetMoney("cash") 
    if balance >= price then
		ox_inventory:AddItem(source, item, amount)
        Player.Functions.RemoveMoney("cash", total, "Grow Shop")
        TriggerClientEvent('ox_lib:notify', source, {title= 'Bought '..amount..' '..exports.ox_inventory:Items(item).label.." for $"..total, type='success'})
    else
        TriggerClientEvent('ox_lib:notify', source, {title= 'Not Enough Money', description = 'Kick rocks!', type='error'})
    end
end)



























