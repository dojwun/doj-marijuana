local QBCore = exports['qb-core']:GetCoreObject()
crop_type = {
    ["crop_stage"] = {
        stage_1 = {"bkr_prop_weed_bud_pruned_01a", -1.05},
        stage_2 = {"bkr_prop_weed_bud_02b", -1.05},
        stage_3 = {"bkr_prop_weed_bud_02a", -1.05},
        stage_4 = {"bkr_prop_weed_01_small_01b", -1.65},
        stage_5 = {"bkr_prop_weed_med_01b", -4.2},
        stage_6 = {"bkr_prop_weed_lrg_01b", -4.0}
    }
}

Plants = {}
SpawnedPlants = {}
CurrentPlant = nil
CurrentPlantInfo = nil

local nearPlant = true
local shown = false

--======================================================================= Threads

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local nPlant = nearPlant(ped)
        if nPlant ~= false then
            if not shown then
                shown = true
                QBCore.Functions.TriggerCallback("doj:server:getPlant",function(info)
                    CurrentPlant = nPlant
                    CurrentPlantInfo = info
                    if CurrentPlantInfo.food and CurrentPlantInfo.water == 0 then
                        PlantMenuDead()
                    else
                        PlantMenuAlive()
                    end
                end,nPlant)
            end
        else
            if shown then
                CurrentPlant = nil
                CurrentPlantInfo = nil
                exports['qb-menu']:closeMenu() 
                shown = false
            end
        end
        if nPlant == false then
            Wait(1000)
        else
            Wait(1)
        end
        Wait(100)
    end
end)

--======================================================================= Callbacks

QBCore.Functions.TriggerCallback("doj:server:getInfo",function(plants)
    Plants = plants
    for k, v in pairs(Plants) do
        spawnPlant(v.seed, v.coords, v.info.stage, k)
    end
end)

--======================================================================= Events

RegisterNetEvent("doj:client:growPlant",function(id, percent)
    if Plants[id] ~= nil and SpawnedPlants[id] ~= nil then
        setPlant(id, percent)
    end
end)

RegisterNetEvent("doj:client:growthUpdate",function()
    if CurrentPlantInfo ~= nil then
        CurrentPlantInfo.water = CurrentPlantInfo.water - (0.01 * CurrentPlantInfo.rate)
        CurrentPlantInfo.food = CurrentPlantInfo.food - (0.01 * CurrentPlantInfo.rate)
        CurrentPlantInfo.stage = CurrentPlantInfo.stage + (0.01 * CurrentPlantInfo.rate)
    end
end)

RegisterNetEvent("doj:client:startPlanting",function(plant)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    if GetGroundHash(ped) == -1286696947 or GetGroundHash(ped) == -1885547121 or GetGroundHash(ped) == 223086562 or GetGroundHash(ped) == -461750719 then
        local canPlant = true
        for k, v in pairs(Plants) do
            if #(coords - v.coords) < 2.5 then
                canPlant = false
            end
        end

        if canPlant then
            TriggerServerEvent("doj:server:addPlantToDatabase", plant, coords)
        else
            QBCore.Functions.Notify('You are to close to another plant', 'error')
        end
    else
        QBCore.Functions.Notify('You cant plant here', 'error')
    end
end)

RegisterNetEvent("doj:client:addPlant",function(seed, coords, id)
    local entity = 'crop_stage'
    local ped = PlayerPedId()
    Plants[id] = {seed = seed, coords = coords}
    QBCore.Functions.Notify("Planting...", "success", 6000)
    TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
    Wait(100)
    ClearPedTasks(ped)
    SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],false,true,1)
    SetEntityAsMissionEntity(SpawnedPlants[id], true, true)  
end)

RegisterNetEvent('doj:client:cropOptions', function(args, data)
    local args = tonumber(args)
	if args == 1 then
        local percent = math.random(10,15)
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Notify("+"..percent.." fertilizer", "success")
                if percent > 0 then
                    CurrentPlantInfo.food = CurrentPlantInfo.food + percent
                    if CurrentPlantInfo.food > 100 then
                        CurrentPlantInfo.food = 100
                    end
                    TriggerServerEvent("doj:server:updatePlant", CurrentPlant, CurrentPlantInfo)
                    TriggerServerEvent("QBCore:Server:RemoveItem", "marijuana_nutrition", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["marijuana_nutrition"], "remove", 1) 
                    PlantMenuStacic()
                end
            else
                PlantMenuAlive()
                QBCore.Functions.Notify("You dont have any fertilizer", "error")
            end
        end, "marijuana_nutrition")
    elseif args == 2 then
        local percent = math.random(5,10)
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Notify("+"..percent.." Water", "success")
                if percent > 0 then
                    CurrentPlantInfo.water = CurrentPlantInfo.water + percent
                    if CurrentPlantInfo.water > 100 then
                        CurrentPlantInfo.water = 100
                    end
                    TriggerServerEvent("doj:server:updatePlant", CurrentPlant, CurrentPlantInfo)
                    TriggerServerEvent("QBCore:Server:RemoveItem", "marijuana_water", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["marijuana_water"], "remove", 1)
                    PlantMenuStacic()
                end
            else
                PlantMenuAlive()
                QBCore.Functions.Notify("You dont have any water", "error")
            end
        end, "marijuana_water")
    elseif args == 3 then
        local ped = PlayerPedId()
        TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
        exports['qb-menu']:closeMenu() 
        Wait(3000)
        if SpawnedPlants[CurrentPlant] ~= nil then
            DeleteEntity(SpawnedPlants[CurrentPlant])
        end
        TriggerServerEvent("doj:server:deletePlant", CurrentPlant)
        TriggerServerEvent("doj:server:addHighGradeMarijuana", Plants[CurrentPlant].seed, CurrentPlantInfo) 
        Plants[CurrentPlant] = nil
        SpawnedPlants[CurrentPlant] = nil
        CurrentPlant = nil
        CurrentPlantInfo = nil
        ClearPedTasks(ped)
        Wait(4000)
        ClearPedTasksImmediately(ped)
    elseif args == 4 then
        local ped = PlayerPedId()
        TaskStartScenarioInPlace(ped, "world_human_gardener_plant", 0, false)
        exports['qb-menu']:closeMenu() 
        Wait(2000)
        if SpawnedPlants[CurrentPlant] ~= nil then
            DeleteEntity(SpawnedPlants[CurrentPlant])
        end
        Plants[CurrentPlant] = nil
        SpawnedPlants[CurrentPlant] = nil
        TriggerServerEvent("doj:server:deletePlant", CurrentPlant)
        CurrentPlant = nil
        CurrentPlantInfo = nil
        ClearPedTasks(ped)
        Wait(4000)
        ClearPedTasksImmediately(ped)
    else
        exports['qb-menu']:closeMenu() 
        Wait(100)
        PlantMenuAlive()
    end
end)

--======================================================================= Functions

function spawnPlant(plant, coords, percent, id)
    local entity = 'crop_stage'
    if percent < 20 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],false,true,1)
    elseif percent < 30 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_2[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_2[2],false,true,1)
    elseif percent < 45 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_3[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_3[2],false,true,1)
    elseif percent < 60 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_4[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_4[2],false,true,1)
    elseif percent < 85 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_5[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_5[2],false,true,1)
    elseif percent <= 100 then
        SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_6[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_6[2],false,true,1)
    end
    SetEntityAsMissionEntity(SpawnedPlants[id], true, true)
end

function setPlant(id, percent)
    local plant = Plants[id].type
    local entity = 'crop_stage'
    if SpawnedPlants[id] ~= nil then
        local coords = Plants[id].coords
        DeleteEntity(SpawnedPlants[id])
        if percent < 20 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_1[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_1[2],false,true,1)
        elseif percent < 30 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_2[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_2[2],false,true,1)
        elseif percent < 45 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_3[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_3[2],false,true,1)
        elseif percent < 60 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_4[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_4[2],false,true,1)
        elseif percent < 85 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_5[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_5[2],false,true,1)
        elseif percent <= 100 then
            SpawnedPlants[id] =CreateObject(GetHashKey(crop_type[entity].stage_6[1]),coords[1],coords[2],coords[3] + crop_type[entity].stage_6[2],false,true,1)
        end
        SetEntityAsMissionEntity(SpawnedPlants[id], true, true)
    else
        print("There was an error loading a plant!")
    end
end

function GetGroundHash(ped)
    local posped = GetEntityCoords(ped)
    local num = StartShapeTestCapsule(posped.x, posped.y, posped.z + 4, posped.x, posped.y, posped.z - 2.0, 2, 1, ped, 7)
    local arg1, arg2, arg3, arg4, arg5 = GetShapeTestResultEx(num)
    return arg5
end

function nearPlant(ped)
    for k, v in pairs(Plants) do
        if #(v.coords - GetEntityCoords(ped)) < 1.0 then
            return k
        end
    end
    return false
end

function PlantMenuDead()
    exports['qb-menu']:showHeader({
        {
            header = "Dead Marijuana Plant: "..CurrentPlant,
            txt = "Stage: "..CurrentPlantInfo.stage.."%",
            isMenuHeader = true
        },
        {
            header = "Harvest dead crop",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 3
            }
        },
        {
            header = "Destroy dead crop",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 4
            }
        },
    })
end

function PlantMenuStacic()
    exports['qb-menu']:openMenu({
        { 
            header = "Marijuana Plant: "..CurrentPlant,
            txt = "Stage: "..CurrentPlantInfo.stage.."%<p>Rate: "..CurrentPlantInfo.rate.."%",
            isMenuHeader = true
        },
        {
            header = "Fertilizer",
            txt = "Nutrition: "..CurrentPlantInfo.food.."%",
            params = {
                event = "doj:client:cropOptions",
                args = 1
            }
        },
        {
            header = "Water",
            txt = "Water: "..CurrentPlantInfo.water.."%",
            params = {
                event = "doj:client:cropOptions",
                args = 2
            }
        },
        {
            header = "Harvest",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 3
            }
        },
        {
            header = "Destroy",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 4
            }
        },
        {
            header = "Return",
            params = {
                event = "doj:client:cropOptions",
                args = 5
            }
        },
    })
end

function PlantMenuAlive()
    exports['qb-menu']:showHeader({
        {
            header = "Marijuana Plant: "..CurrentPlant,
            txt = "Stage: "..CurrentPlantInfo.stage.."%<p>Rate: "..CurrentPlantInfo.rate.."%",
            isMenuHeader = true
        },
        {
            header = "Fertilizer",
            txt = "Nutrition: "..CurrentPlantInfo.food.."%",
            params = {
                event = "doj:client:cropOptions",
                args = 1
            }
        },
        {
            header = "Water",
            txt = "Water: "..CurrentPlantInfo.water.."%",
            params = {
                event = "doj:client:cropOptions",
                args = 2
            }
        },
        {
            header = "Harvest",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 3
            }
        },
        {
            header = "Destroy",
            txt = "",
            params = {
                event = "doj:client:cropOptions",
                args = 4
            }
        },
    })
end

