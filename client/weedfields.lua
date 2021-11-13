
-- WeedField
exports['qb-target']:AddTargetModel(`prop_weed_02`, {
	options = {
		{
			event = "doj:client:harvestLakeCrop",
			icon = "fas fa-cannabis",
			label = "Harvest Crop",
		},
	},
	distance = 1.3
}) 

-- WeedFarm
exports['qb-target']:AddTargetModel(`prop_weed_01`, {
    options = {
        {
            event = "doj:client:harvestFarmCrop",
            icon = "fas fa-cannabis",
            label = "Harvest Crop",
        },
    },
    distance = 1.3
}) 
 
--========================================================================================================== Weed near lake

local spawnedWeeds = 0
local weedPlants = {}
local isPickingUp = false
local isProcessing = false

RegisterNetEvent('doj:client:harvestLakeCrop', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID

	for i=1, #weedPlants, 1 do
		if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1.2 then
			nearbyObject, nearbyID = weedPlants[i], i
		end
	end
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			if nearbyObject and IsPedOnFoot(playerPed) then
				isPickingUp = true
				exports['progressBars']:drawBar(8500, 'Harvesting crop...') 
				TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
				Wait(6500)
				ClearPedTasks(playerPed)
				Wait(1000)
				DeleteObject(nearbyObject) 
				table.remove(weedPlants, nearbyID)
				spawnedWeeds = spawnedWeeds - 1
				TriggerServerEvent('doj:server:addLowGradeMarijuana')
			else
				QBCore.Functions.Notify('crop cant be harvested', 'error', 3500)
			end
		else
			QBCore.Functions.Notify('You dont have a trowl to dig up the plant!', 'error', 3500)
		end
	end, "marijuana_trowel")
end)

CreateThread(function()
	while true do
		Wait(10)
		local coords = GetEntityCoords(PlayerPedId())
		if GetDistanceBetweenCoords(coords, Config.WeedField, true) < 50 then
			SpawnWeedPlants()
			Wait(500)
		else
			Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(weedPlants) do
			DeleteObject(v)
		end
	end
end)

function SpawnObject(model, coords, cb)
	local model = (type(model) == 'number' and model or GetHashKey(model))
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cb then
        cb(obj)
    end
end

function SpawnWeedPlants()
	while spawnedWeeds < 15 do
		Wait(1)
		local weedCoords = GenerateWeedCoords()
		SpawnObject('prop_weed_02', weedCoords, function(obj)
			table.insert(weedPlants, obj)
			spawnedWeeds = spawnedWeeds + 1
		end)
	end
end 

function ValidateWeedCoord(plantCoord)
	if spawnedWeeds > 0 then
		local validate = true
		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end
		if GetDistanceBetweenCoords(plantCoord, Config.WeedField, false) > 50 then
			validate = false
		end
		return validate
	else
		return true
	end
end

function GenerateWeedCoords()
	while true do
		Wait(1)
		local weedCoordX, weedCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-35, 35)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-35, 35)
		weedCoordX = Config.WeedField.x + modX
		weedCoordY = Config.WeedField.y + modY
		local coordZ = GetCoordZWeed(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)
		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

function GetCoordZWeed(x, y)
	local groundCheckHeights = { 45, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 53.85
end

--======================================================================================================= Weed near farm
harvestedPlants = {}
weedProp = { "prop_weed_01" }

RegisterNetEvent('doj:client:harvestFarmCrop', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    for i = 1, #weedProp do
        local Weed = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(weedProp[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(Weed) then
            entity = Weed
            plant    = GetEntityCoords(entity)                
                if not harvestedPlants[entity] then
                    searchPlant(entity)
                else
                    QBCore.Functions.Notify("Plant has already been Harvested...", "error", 3500)
                end
            break
        else
            Wait(1000)
        end
    end
end)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function searchPlant(entity)
	local playerPed = PlayerPedId()
    playAnim("anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_crouch_checkingleaves_idle_01_inspector", 35000)
	local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
    if finished ~= 100 then
		QBCore.Functions.Notify("Failed to Harvest Plant...", "error", 3500)
		ClearPedTasks(playerPed)
    else
		local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
        if finished2 ~= 100 then
			QBCore.Functions.Notify("Failed to Harvest Plant...", "error", 3500)
			ClearPedTasks(playerPed)
        else
			local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
            if finished3 ~= 100 then
				QBCore.Functions.Notify("Failed to Harvest Plant...", "error", 3500)
				ClearPedTasks(playerPed)
            else
				local HarvestTime = math.random(20000,30000)
                FreezeEntityPosition(playerPed, true)
                TriggerEvent('pogressBar:drawBar', HarvestTime, 'Harvesting crop...') 
                Wait(HarvestTime)
                harvestedPlants[entity] = true
                TriggerServerEvent('doj:server:addMidGradeMarijuana')
                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, false)
            end
        end
    end
end
