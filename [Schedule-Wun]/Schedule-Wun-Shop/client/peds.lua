local spawnedPeds = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.PedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)
            local DistanceSpawn = 20.0
			if distance < DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
				local options = {
					{
						name = v.name,
						icon = v.icon,
						label = v.label,
						iconColor = v.iconColor,
						distance = v.distance,
						onSelect = function()
							TriggerEvent(v.event)
						end,
						canInteract = function()
							return true
						end
					}
				}
				exports['ox_target']:addLocalEntity(spawnedPed, options)
			end
			if distance >= DistanceSpawn and spawnedPeds[k] then
                for i = 255, 0, -51 do
                    Citizen.Wait(50)
                    SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)

function NearPed(model, coords, scenario)
	-- local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	-- SetBlipSprite(blip, 1)
	-- SetBlipScale(blip, 0.8)
	-- SetBlipAsShortRange(blip, true)
	-- BeginTextCommandSetBlipName("STRING")
	-- AddTextComponentString("SHOP STUFF")
	-- EndTextCommandSetBlipName(blip)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
	spawnedPed = CreatePed(0, model, coords.x, coords.y, coords.z - 1, coords.w, false, true)
	SetEntityAlpha(spawnedPed, 0, false)
	FreezeEntityPosition(spawnedPed, true)
	SetEntityInvincible(spawnedPed, true)
	SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    for i = 0, 255, 51 do
        Citizen.Wait(50)
        SetEntityAlpha(spawnedPed, i, false)
    end
	return spawnedPed
end
