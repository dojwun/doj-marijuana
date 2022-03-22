local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    updatePlants()
end)

function updatePlants()
    SetTimeout(Config.GrowRate * 1000, function()
        updatePlants()
    end)
    --DEAD PLANTS
    MySQL.query("SELECT id FROM player_crops WHERE (water = 0 OR food = 0) AND rate = 0",{},function(id)
        for _, v in ipairs(id) do
            MySQL.update('DELETE FROM player_crops WHERE id = ?', {v.id}, function()
                TriggerClientEvent("doj:client:DeleteEntity", -1)  
            end)
        end
    end)
    -- ALIVE PLANT REDUCTION
    MySQL.update("UPDATE `player_crops` SET `stage`=`stage` + (0.01 * `rate`) , `food` = `food` - (0.02 * `rate`), `water` = `water` -  (0.02 * `rate`) WHERE water >= 2 OR food >= 2",{},
    function()
        TriggerClientEvent("doj:client:growthUpdate", -1)
    end)
    -- GROW PLANTS
    MySQL.query("SELECT id, stage FROM player_crops WHERE (stage >= 30 AND stage <= 31) OR (stage >= 80 AND stage <= 81)",{},
    function(info)
        for _, v in ipairs(info) do
            TriggerClientEvent("doj:client:growPlant", -1, v.id, v.stage)
        end
    end)
end

function addPlant(seed, coords, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local zone = nil
    MySQL.insert('INSERT INTO player_crops (coords, seed, stage, rate, water, food) VALUES (?, ?, ?, ?, ?, ?)',{
        json.encode({x = coords[1], y = coords[2], z = coords[3]}),
        seed,
        0,
        10,
        10,
        10
    },function(id)
        TriggerClientEvent("doj:client:addPlant", src, seed, coords, id)
    end)
end

RegisterNetEvent("doj:server:addPlantToDatabase",function(seed, coords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    addPlant(seed, coords, src)
    Player.Functions.RemoveItem(seed, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[seed], "remove", 1)
end)

RegisterNetEvent("doj:server:deletePlant",function(id)
    MySQL.update('DELETE FROM player_crops WHERE id = ?', {id})
end)

RegisterNetEvent("doj:server:updatePlant",function(id, info)
    MySQL.update('UPDATE player_crops SET stage = ?, rate = ?, food = ?, water = ? WHERE id = ?',{info.stage, info.rate, info.food, info.water, id})
end)

QBCore.Functions.CreateCallback("doj:server:getInfo",function(source, cb)
    MySQL.query('SELECT * FROM player_crops WHERE 1',{}, function(infoPlants)
        local plants = {}
        for _, v in ipairs(infoPlants) do
            local coords = json.decode(v.coords) or {x = 0, y = 0, z = 0}
            local data = {stage = v.stage, rate = v.rate, water = v.water, food = v.food} 
            coords = vector3(coords.x, coords.y, coords.z)
            plants[v.id] = {seed = v.seed, coords = coords, info = data}
        end
        cb(plants)
    end)
end)

QBCore.Functions.CreateCallback("doj:server:getPlant",function(source, cb, id)
    MySQL.query("SELECT stage,rate,food,water FROM player_crops WHERE id = @id LIMIT 1",{["@id"] = id},function(info)
        local data = {stage = info[1].stage, rate = info[1].rate, water = info[1].water, food = info[1].food}
        cb(data)
    end)
end)
