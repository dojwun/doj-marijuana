local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('doj:server:sellOz', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local marijuana_1oz_low = Player.Functions.GetItemByName("marijuana_1oz_low")
		if marijuana_1oz_low ~= nil then
			local payment = Config.lowGradeOzPrice
			Player.Functions.RemoveItem("marijuana_1oz_low", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_low'], "remove", 1)
            TriggerClientEvent('doj:client:sellOzMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any to sell", "error")
            TriggerClientEvent('doj:client:sellOzMenu', src)
		end
	elseif args == 2 then
		local marijuana_1oz_mid = Player.Functions.GetItemByName("marijuana_1oz_mid")
		if marijuana_1oz_mid ~= nil then
			local payment = Config.midGradeOzPrice
			Player.Functions.RemoveItem("marijuana_1oz_mid", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_mid'], "remove", 1)
            TriggerClientEvent('doj:client:sellOzMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any to sell", "error")
            TriggerClientEvent('doj:client:sellOzMenu', src)
		end
	else
		local marijuana_1oz_high = Player.Functions.GetItemByName("marijuana_1oz_high")
		if marijuana_1oz_high ~= nil then
			local payment = Config.highGradeOzPrice
			Player.Functions.RemoveItem("marijuana_1oz_high", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_high'], "remove", 1)
            TriggerClientEvent('doj:client:sellOzMenu', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any to sell", "error")
            TriggerClientEvent('doj:client:sellOzMenu', src)
		end
	end
end)

RegisterServerEvent('doj:server:sellEighth', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local marijuana_eighth_low = Player.Functions.GetItemByName("marijuana_3.5_low")
		if marijuana_eighth_low ~= nil then
			local payment = Config.lowGradeEighthPrice
			Player.Functions.RemoveItem("marijuana_3.5_low", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_low'], "remove", 1)
			TriggerClientEvent('doj:client:sellReact', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have the amount I need", "error")
		end
	elseif args == 2 then
		local marijuana_eighth_mid = Player.Functions.GetItemByName("marijuana_3.5_mid")
		if marijuana_eighth_mid ~= nil then
			local payment = Config.midGradeEighthPrice
			Player.Functions.RemoveItem("marijuana_3.5_mid", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_mid'], "remove", 1)
			TriggerClientEvent('doj:client:sellReact', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have the amount I need", "error")
		end
	else
		local marijuana_eighth_high = Player.Functions.GetItemByName("marijuana_3.5_high")
		if marijuana_eighth_high ~= nil then
			local payment = Config.highGradeEighthPrice
			Player.Functions.RemoveItem("marijuana_3.5_high", 1)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('QBCore:Notify', src, "+$"..payment, "success")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_3.5_high'], "remove", 1)
			TriggerClientEvent('doj:client:sellReact', src)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have the amount I need", "error")
		end
	end
end)

--======================================================================================================== Sell Eights

QBCore.Functions.CreateUseableItem("marijuana_phone", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent('doj:client:useBurnerPhone', src)
	end
end)

eightsList = {
    "marijuana_3.5_low",
    "marijuana_3.5_mid",
    "marijuana_3.5_high",
}
QBCore.Functions.CreateCallback('doj:server:checkEights', function(source, cb)
    local eights = {}
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for i = 1, #eightsList, 1 do
        local item = Player.Functions.GetItemByName(eightsList[i])
        if item ~= nil then
            eights[#eights+1] = {
                item = item.name,
                amount = item.amount,
                label = QBCore.Shared.Items[item.name]["label"]
            }
        end
    end
    if next(eights) ~= nil then
        cb(eights)
    else
        cb(nil)
    end
end)

