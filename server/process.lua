local QBCore = exports['qb-core']:GetCoreObject()
--==========================================================================

RegisterServerEvent('doj:server:process1ozMarijuana', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 3
    local returnAmount = 1
	if args == 1 then 
        local lowGrade = Player.Functions.GetItemByName("marijuana_crop_low") 
        if lowGrade ~= nil then
            if lowGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_crop_low", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_crop_low'], "remove", removeAmount)
                local number = math.random(1,9)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "Low", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "Low", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "Low", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "Low", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "Low", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "Low", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_1oz_low', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_1oz_low"], "add", returnAmount)
                    TriggerClientEvent('doj:client:TrimMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough low grade marijuana", 'error')
                TriggerClientEvent('doj:client:TrimMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any low grade marijuana", "error")
            TriggerClientEvent('doj:client:TrimMenu', src)
        end
    elseif args == 2 then 
        local midGrade = Player.Functions.GetItemByName("marijuana_crop_mid")
        if midGrade ~= nil then
            if midGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_crop_mid", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_crop_mid'], "remove", removeAmount)
                local number = math.random(10,18)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "Mid", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "Mid", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "Mid", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_1oz_mid', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_1oz_mid"], "add", returnAmount)
                    TriggerClientEvent('doj:client:TrimMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough mid grade marijuana", 'error')
                TriggerClientEvent('doj:client:TrimMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any mid grade marijuana", "error")
            TriggerClientEvent('doj:client:TrimMenu', src)
        end
    else
        local highGrade = Player.Functions.GetItemByName("marijuana_crop_high")
        if highGrade ~= nil then
            if highGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_crop_high", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_crop_high'], "remove", removeAmount)
                local number = math.random(20,32)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "High", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "High", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "High", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "High", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "High", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "High", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "High", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "High", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "High", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "High", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "High", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "High", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_1oz_high', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_1oz_high"], "add", returnAmount)
                    TriggerClientEvent('doj:client:TrimMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough high grade marijuana", 'error')
                TriggerClientEvent('doj:client:TrimMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any high grade marijuana", "error")
            TriggerClientEvent('doj:client:TrimMenu', src)
        end
    end
end)

--==========================================================================

RegisterServerEvent('doj:server:process3.5gMarijuana', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 1
    local returnAmount = 9
	if args == 1 then 
        local lowGrade = Player.Functions.GetItemByName("marijuana_1oz_low") 
        if lowGrade ~= nil then
            if lowGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_1oz_low", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_low'], "remove", removeAmount)
                local number = math.random(1,9)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "Low", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "Low", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "Low", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "Low", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "Low", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "Low", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "Low", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "Low", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_3.5_low', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_low"], "add", returnAmount)
                    TriggerClientEvent('doj:client:CombineMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough low grade marijuana", 'error')
                TriggerClientEvent('doj:client:CombineMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any low grade marijuana", "error")
            TriggerClientEvent('doj:client:CombineMenu', src)
        end
    elseif args == 2 then 
        local midGrade = Player.Functions.GetItemByName("marijuana_1oz_mid")
        if midGrade ~= nil then
            if midGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_1oz_mid", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_mid'], "remove", removeAmount)
                local number = math.random(10,18)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "Mid", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "Mid", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "Mid", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "Mid", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "Mid", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "Mid", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_3.5_mid', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_mid"], "add", returnAmount)
                    TriggerClientEvent('doj:client:CombineMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough mid grade marijuana", 'error')
                TriggerClientEvent('doj:client:CombineMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any mid grade marijuana", "error")
            TriggerClientEvent('doj:client:CombineMenu', src)
        end
    else
        local highGrade = Player.Functions.GetItemByName("marijuana_1oz_high")
        if highGrade ~= nil then
            if highGrade.amount >= removeAmount then
                Player.Functions.RemoveItem("marijuana_1oz_high", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_high'], "remove", removeAmount)
                local number = math.random(20,32)
                local randomInfo = { 
                    --Hybrid
                    {strain = "Wedding Cake",   potency = "High", thc = number, type = "Hybrid"},
                    {strain = "Runtz",          potency = "High", thc = number, type = "Hybrid"},
                    {strain = "Gelato",         potency = "High", thc = number, type = "Hybrid"},
                    {strain = "OG Kush",        potency = "High", thc = number, type = "Hybrid"},
                    --Indica
                    {strain = "Do-Si-Dos",      potency = "High", thc = number, type = "Indica"},
                    {strain = "Zkittlez",       potency = "High", thc = number, type = "Indica"},
                    {strain = "Bubba Kush",     potency = "High", thc = number, type = "Indica"},
                    {strain = "Mendo Breath",   potency = "High", thc = number, type = "Indica"},
                    --Sativa
                    {strain = "Sour Diesel",    potency = "High", thc = number, type = "Sativa"},
                    {strain = "Jack Herer",     potency = "High", thc = number, type = "Sativa"},
                    {strain = "Durban Poison",  potency = "High", thc = number, type = "Sativa"},
                    {strain = "Green Crack",    potency = "High", thc = number, type = "Sativa"},
                }
                local info = randomInfo[math.random(#randomInfo)]
                if Player.Functions.AddItem('marijuana_3.5_high', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_high"], "add", returnAmount)
                    TriggerClientEvent('doj:client:CombineMenu', src)
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough high grade marijuana", 'error')
                TriggerClientEvent('doj:client:CombineMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any high grade marijuana", "error")
            TriggerClientEvent('doj:client:CombineMenu', src)
        end
    end
end)

--==========================================================================
RegisterServerEvent('doj:server:process3.5gMarijuanaBaggies', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 1
    local returnAmount = 9
    local baggieAmount = 9
    local packageTime = 7500
	if args == 1 then 
        local lowGrade = Player.Functions.GetItemByName("marijuana_1oz_low") 
        if lowGrade ~= nil then
            if lowGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("marijuana_baggies") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("marijuana_1oz_low", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_low'], "remove", removeAmount)
                        local number = math.random(1,9)
                        local randomInfo = { 
                            --Hybrid
                            {strain = "Wedding Cake",   potency = "Low", thc = number, type = "Hybrid"},
                            {strain = "Runtz",          potency = "Low", thc = number, type = "Hybrid"},
                            {strain = "Gelato",         potency = "Low", thc = number, type = "Hybrid"},
                            {strain = "OG Kush",        potency = "Low", thc = number, type = "Hybrid"},
                            --Indica
                            {strain = "Do-Si-Dos",      potency = "Low", thc = number, type = "Indica"},
                            {strain = "Zkittlez",       potency = "Low", thc = number, type = "Indica"},
                            {strain = "Bubba Kush",     potency = "Low", thc = number, type = "Indica"},
                            {strain = "Mendo Breath",   potency = "Low", thc = number, type = "Indica"},
                            --Sativa
                            {strain = "Sour Diesel",    potency = "Low", thc = number, type = "Sativa"},
                            {strain = "Jack Herer",     potency = "Low", thc = number, type = "Sativa"},
                            {strain = "Durban Poison",  potency = "Low", thc = number, type = "Sativa"},
                            {strain = "Green Crack",    potency = "Low", thc = number, type = "Sativa"},
                        }
                        local info = randomInfo[math.random(#randomInfo)]
                        TriggerClientEvent('QBCore:Notify', src, "Packaging...", 'primary', packageTime)
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('marijuana_3.5_low', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_low"], "add", returnAmount)
                                TriggerClientEvent('doj:client:baggieMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", 'error')
                        TriggerClientEvent('doj:client:baggieMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", "error")
                    TriggerClientEvent('doj:client:baggieMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough low grade marijuana", 'error')
                TriggerClientEvent('doj:client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any low grade marijuana", "error")
            TriggerClientEvent('doj:client:baggieMenu', src)
        end
    elseif args == 2 then 
        local midGrade = Player.Functions.GetItemByName("marijuana_1oz_mid") 
        if midGrade ~= nil then
            if midGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("marijuana_baggies") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("marijuana_1oz_mid", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_mid'], "remove", removeAmount)
                        local number = math.random(1,9)
                        local randomInfo = { 
                            --Hybrid
                            {strain = "Wedding Cake",   potency = "Mid", thc = number, type = "Hybrid"},
                            {strain = "Runtz",          potency = "Mid", thc = number, type = "Hybrid"},
                            {strain = "Gelato",         potency = "Mid", thc = number, type = "Hybrid"},
                            {strain = "OG Kush",        potency = "Mid", thc = number, type = "Hybrid"},
                            --Indica
                            {strain = "Do-Si-Dos",      potency = "Mid", thc = number, type = "Indica"},
                            {strain = "Zkittlez",       potency = "Mid", thc = number, type = "Indica"},
                            {strain = "Bubba Kush",     potency = "Mid", thc = number, type = "Indica"},
                            {strain = "Mendo Breath",   potency = "Mid", thc = number, type = "Indica"},
                            --Sativa
                            {strain = "Sour Diesel",    potency = "Mid", thc = number, type = "Sativa"},
                            {strain = "Jack Herer",     potency = "Mid", thc = number, type = "Sativa"},
                            {strain = "Durban Poison",  potency = "Mid", thc = number, type = "Sativa"},
                            {strain = "Green Crack",    potency = "Mid", thc = number, type = "Sativa"},
                        }
                        local info = randomInfo[math.random(#randomInfo)]
                        TriggerClientEvent('QBCore:Notify', src, "Packaging...", 'primary', packageTime)
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('marijuana_3.5_mid', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_mid"], "add", returnAmount)
                                TriggerClientEvent('doj:client:baggieMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", 'error')
                        TriggerClientEvent('doj:client:baggieMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", "error")
                    TriggerClientEvent('doj:client:baggieMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough mid grade marijuana", 'error')
                TriggerClientEvent('doj:client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any mid grade marijuana", "error")
            TriggerClientEvent('doj:client:baggieMenu', src)
        end
    else
        local highGrade = Player.Functions.GetItemByName("marijuana_1oz_high") 
        if highGrade ~= nil then
            if highGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("marijuana_baggies") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("marijuana_1oz_high", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['marijuana_1oz_high'], "remove", removeAmount)
                        local number = math.random(1,9)
                        local randomInfo = { 
                            --Hybrid
                            {strain = "Wedding Cake",   potency = "High", thc = number, type = "Hybrid"},
                            {strain = "Runtz",          potency = "High", thc = number, type = "Hybrid"},
                            {strain = "Gelato",         potency = "High", thc = number, type = "Hybrid"},
                            {strain = "OG Kush",        potency = "High", thc = number, type = "Hybrid"},
                            --Indica
                            {strain = "Do-Si-Dos",      potency = "High", thc = number, type = "Indica"},
                            {strain = "Zkittlez",       potency = "High", thc = number, type = "Indica"},
                            {strain = "Bubba Kush",     potency = "High", thc = number, type = "Indica"},
                            {strain = "Mendo Breath",   potency = "High", thc = number, type = "Indica"},
                            --Sativa
                            {strain = "Sour Diesel",    potency = "High", thc = number, type = "Sativa"},
                            {strain = "Jack Herer",     potency = "High", thc = number, type = "Sativa"},
                            {strain = "Durban Poison",  potency = "High", thc = number, type = "Sativa"},
                            {strain = "Green Crack",    potency = "High", thc = number, type = "Sativa"},
                        }
                        local info = randomInfo[math.random(#randomInfo)]
                        TriggerClientEvent('QBCore:Notify', src, "Packaging...", 'primary', packageTime)
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('marijuana_3.5_high', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["marijuana_3.5_high"], "add", returnAmount)
                                TriggerClientEvent('doj:client:baggieMenu', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", 'error')
                        TriggerClientEvent('doj:client:baggieMenu', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast 9 baggies", "error")
                    TriggerClientEvent('doj:client:baggieMenu', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough high grade marijuana", 'error')
                TriggerClientEvent('doj:client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any high grade marijuana", "error")
            TriggerClientEvent('doj:client:baggieMenu', src)
        end
    end
end)






