local QBCore = exports['qb-core']:GetCoreObject()
--======================================================================================================== Sell Eights

local pedAvailable = {}
local sellAmount = 0
local sellingweed = false
local cooldown = false

local zoneNames = {
	AIRP = "Los Santos International Airport",
	ALAMO = "Alamo Sea",
	ALTA = "Alta",
	ARMYB = "Fort Zancudo",
	BANHAMC = "Banham Canyon Dr",
	BANNING = "Banning",
	BAYTRE = "Baytree Canyon", 
	BEACH = "Vespucci Beach",
	BHAMCA = "Banham Canyon",
	BRADP = "Braddock Pass",
	BRADT = "Braddock Tunnel",
	BURTON = "Burton",
	CALAFB = "Calafia Bridge",
	CANNY = "Raton Canyon",
	CCREAK = "Cassidy Creek",
	CHAMH = "Chamberlain Hills",
	CHIL = "Vinewood Hills",
	CHU = "Chumash",
	CMSW = "Chiliad Mountain State Wilderness",
	CYPRE = "Cypress Flats",
	DAVIS = "Davis",
	DELBE = "Del Perro Beach",
	DELPE = "Del Perro",
	DELSOL = "La Puerta",
	DESRT = "Grand Senora Desert",
	DOWNT = "Downtown",
	DTVINE = "Downtown Vinewood",
	EAST_V = "East Vinewood",
	EBURO = "El Burro Heights",
	ELGORL = "El Gordo Lighthouse",
	ELYSIAN = "Elysian Island",
	GALFISH = "Galilee",
	GALLI = "Galileo Park",
	golf = "GWC and Golfing Society",
	GRAPES = "Grapeseed",
	GREATC = "Great Chaparral",
	HARMO = "Harmony",
	HAWICK = "Hawick",
	HORS = "Vinewood Racetrack",
	HUMLAB = "Humane Labs and Research",
	JAIL = "Bolingbroke Penitentiary",
	KOREAT = "Little Seoul",
	LACT = "Land Act Reservoir",
	LAGO = "Lago Zancudo",
	LDAM = "Land Act Dam",
	LEGSQU = "Legion Square",
	LMESA = "La Mesa",
	LOSPUER = "La Puerta",
	MIRR = "Mirror Park",
	MORN = "Morningwood",
	MOVIE = "Richards Majestic",
	MTCHIL = "Mount Chiliad",
	MTGORDO = "Mount Gordo",
	MTJOSE = "Mount Josiah",
	MURRI = "Murrieta Heights",
	NCHU = "North Chumash",
	NOOSE = "N.O.O.S.E",
	OCEANA = "Pacific Ocean",
	PALCOV = "Paleto Cove",
	PALETO = "Paleto Bay",
	PALFOR = "Paleto Forest",
	PALHIGH = "Palomino Highlands",
	PALMPOW = "Palmer-Taylor Power Station",
	PBLUFF = "Pacific Bluffs",
	PBOX = "Pillbox Hill",
	PROCOB = "Procopio Beach",
	RANCHO = "Rancho",
	RGLEN = "Richman Glen",
	RICHM = "Richman",
	ROCKF = "Rockford Hills",
	RTRAK = "Redwood Lights Track",
	SanAnd = "San Andreas",
	SANCHIA = "San Chianski Mountain Range",
	SANDY = "Sandy Shores",
	SKID = "Mission Row",
	SLAB = "Stab City",
	STAD = "Maze Bank Arena",
	STRAW = "Strawberry",
	TATAMO = "Tataviam Mountains",
	TERMINA = "Terminal",
	TEXTI = "Textile City",
	TONGVAH = "Tongva Hills",
	TONGVAV = "Tongva Valley",
	VCANA = "Vespucci Canals",
	VESP = "Vespucci",
	VINE = "Vinewood",
	WINDF = "Ron Alternates Wind Farm",
	WVINE = "West Vinewood",
	ZANCUDO = "Zancudo River",
	ZP_ORT = "Port of South Los Santos",
	ZQ_UAR = "Davis Quartz"
}

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent('doj:client:useBurnerPhone', function()
	if sellingweed then
		EndSelling()
		return
	end
	if cooldown then
		QBCore.Functions.Notify('You can only sell once every 5 minutes.', 'error')
		return
	end
	local ped = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local zone = tostring(GetNameOfZone(x, y, z))
    local Area = zoneNames[tostring(zone)]
	if (Area == Config.cornerSellLocation.area1) or (Area == Config.cornerSellLocation.area2) or (Area == Config.cornerSellLocation.area3) or (Area == Config.cornerSellLocation.area4) or (Area == Config.cornerSellLocation.area5) or (Area == Config.cornerSellLocation.area6) or (Area == Config.cornerSellLocation.area7) or (Area == Config.cornerSellLocation.area8) or (Area == Config.cornerSellLocation.area9) or (Area == Config.cornerSellLocation.area10) then
		sellingweed = true
		cooldown = true
		QBCore.Functions.Notify('This looks like a good area', 'success', 5000)
		loadAnimDict( "amb@world_human_stand_mobile@male@standing@call@base" ) 
		TaskPlayAnim( ped, "amb@world_human_stand_mobile@male@standing@call@base", "base", 8.0, 1.0, -1, 48, 0, 0, 0, 0 )
		Wait(7000)
		ClearPedTasks(ped)
		QBCore.Functions.Notify('Selling active at '..Area, 'success')
	else
		QBCore.Functions.Notify('No one is looking for that here', 'error')
		return
	end

	local plyStartCoords = GetEntityCoords(ped)
    while sellingweed do
		Wait(20000)
		if sellingweed then
			local playerCoords = GetEntityCoords(ped)
			local distance = GetDistanceBetweenCoords(plyStartCoords, playerCoords)
			if distance > 75.0 then
				QBCore.Functions.Notify('You moved too far from your area!', 'error')
				EndSelling()
			end
			local RandomNPC = GetRandomNPC()
			if RandomNPC then
				QBCore.Functions.Notify('Someone is approching', 'primary')
			end
			TriggerEvent("doj:client:AllowSale", RandomNPC)
		end
    end
    Wait(300000)
    cooldown = false 
end)

RegisterNetEvent('doj:client:AllowSale', function(NPC)
	local timer = 0
	local player = PlayerPedId()
	local startdst = GetDistanceBetweenCoords(GetEntityCoords(NPC),GetEntityCoords(player))
	TriggerEvent("doj:client:MovePed", NPC)
	while true do
		if not canPedBeUsed(NPC,false) then
			return
		end
		local curdst = GetDistanceBetweenCoords(GetEntityCoords(NPC),GetEntityCoords(player))
		if curdst-2 > startdst then
			TaskWanderStandard(NPC, 10.0, 10)
			return
		end
		local x,y,z=table.unpack(GetEntityCoords(NPC))
		local distance = GetDistanceBetweenCoords(GetEntityCoords(player),x,y,z,true)

		if distance < 2.0 then
			exports['textUi']:DrawTextUi('show', "[E] - sell [H] - Shoo")
			if IsControlJustReleased(2,38) and distance < 2.0 then
				local chance = math.random(1, 20) 
				if chance <= 5 then
					QBCore.Functions.Notify('The buyer has changed their mind.', 'error')
					TaskWanderStandard(NPC, 10.0, 10)
					PlayPedAmbientSpeechNative(NPC, "Apology_No_Trouble", "Speech_Params_Force_Shouted_Critical")
					exports['textUi']:DrawTextUi('hide')
					return
				else
					QBCore.Functions.TriggerCallback('doj:server:checkEights', function(result)
						if result ~= nil then
							cornerSellingMenu()
						else
							exports['textUi']:DrawTextUi('hide')
							EndSelling()
							QBCore.Functions.Notify('You dont have any eights to sell', 'error')
						end
					end)
					ClearPedTasks(NPC)
					ClearPedSecondaryTask(NPC)
					TaskTurnPedToFaceEntity(NPC, player, 1.0)
					PlayPedAmbientSpeechNative(NPC, "Generic_Hows_It_Going", "Speech_Params_Force")
					TaskStartScenarioInPlace(NPC, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
					Wait(8000)
					if TaskStartScenarioInPlace(NPC, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false) then
						PlayPedAmbientSpeechNative(NPC, "Chat_State", "Speech_Params_Force")
						TaskWanderStandard(NPC, 10.0, 10)
						Wait(1000)
						exports['textUi']:DrawTextUi('hide')
						exports['qb-menu']:closeMenu()
					end
					return
				end
			end
			if IsControlJustReleased(2,74) and GetDistanceBetweenCoords(GetEntityCoords(player),x,y,z,true) < 2.0 then
				TaskWanderStandard(NPC, 10.0, 10)
				PlayPedAmbientSpeechNative(NPC, "Generic_Curse_Med", "Speech_Params_Force")
				exports['textUi']:DrawTextUi('hide')
				return
			end
		else
			exports['textUi']:DrawTextUi('hide')
		end
		timer = timer + 1
		if timer > 60000 then
			TaskWanderStandard(NPC, 10.0, 10)
			return
		end
		Wait(1)
	end
end)

function EndSelling()
	QBCore.Functions.Notify('Corner selling stopped!', 'error')
	sellAmount = 0
	sellingweed = false
end 

function cornerSellingMenu()
	exports['textUi']:DrawTextUi('hide')
	exports['qb-menu']:openMenu({
		{
			header = "Corner Selling 3.5gs",
			txt = "",
			isMenuHeader = true
		},
		{
			header = "Low Grade",
			txt = "Offer: $" .. Config.lowGradeEighthPrice,
			params = {
				event = "doj:server:sellEighth",
				isServer = true,
				args = 1
			}
		},
		{
			header = "Mid Grade",
			txt = "Offer: $" .. Config.midGradeEighthPrice,
			params = {
				event = "doj:server:sellEighth",
				isServer = true,
				args = 2
			}
		},
		{
			header = "High Grade",
			txt = "Offer: $" .. Config.highGradeEighthPrice,
			params = {
				event = "doj:server:sellEighth",
				isServer = true,
				args = 3
			}
		},
		{
			header = "close",
			params = {
				event = "qb-menu:closeMenu"
			}
		},
	})
end

RegisterNetEvent('doj:client:sellReact', function()
	local player = PlayerPedId()
	loadAnimDict( "random@mugging4" ) 
	TaskPlayAnim(player, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
	Wait(1000)
    loadAnimDict( "mp_safehouselost@" )
    TaskPlayAnim(player, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end)

function loadModel(modelName)
    RequestModel(GetHashKey(modelName))
    while not HasModelLoaded(GetHashKey(modelName)) do
        RequestModel(GetHashKey(modelName))
        Wait(1)
    end
end

RegisterNetEvent('doj:client:MovePed',function(p)
    local usingped = p
    local nm1 = math.random(6,9) / 100
    local nm2 = math.random(6,9) / 100
    nm1 = nm1 + 0.3
    nm2 = nm2 + 0.3
    if math.random(10) > 5 then
      nm1 = 0.0 - nm1
    end
    if math.random(10) > 5 then
      nm2 = 0.0 - nm2
    end
    local moveto = GetOffsetFromEntityInWorldCoords(PlayerPedId(), nm1, nm2, 0.0)
    TaskGoStraightToCoord(usingped, moveto, 1.0, 30.0, 0.0, 0.0)
    SetPedKeepTask(usingped, true) 
    local dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(usingped), false)
    local toolong = 0
    local lastcheck = GetDistanceBetweenCoords(GetEntityCoords(usingped),GetEntityCoords(PlayerPedId()))
    while dist > 3.5 and toolong < 600 and GetDistanceBetweenCoords(GetEntityCoords(usingped),GetEntityCoords(PlayerPedId())) > 1.5 do
    	local dstmoved = lastcheck - GetDistanceBetweenCoords(GetEntityCoords(usingped),GetEntityCoords(PlayerPedId()))
    	if dstmoved < 0.5 then
    		toolong = toolong + 20
    	end
      	toolong = toolong + 1
      	TaskGoStraightToCoord(usingped, moveto, 1.0, 30.0, 0.0, 0.0)
      	dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(usingped), false)
      	Wait(1000)
      	lastcheck = GetDistanceBetweenCoords(GetEntityCoords(usingped),GetEntityCoords(PlayerPedId()))
    end
    if toolong > 500 then
    	TaskWanderStandard(usingped, 10.0, 10)
    else 
	    TaskLookAtEntity(usingped, PlayerPedId(), 5500.0, 2048, 3)
	    TaskTurnPedToFaceEntity(usingped, PlayerPedId(), 5500)
	    if not sellingweed then
		    TaskStartScenarioInPlace(usingped, "WORLD_HUMAN_BUM_STANDING", 0, 1)
		end
    end
end)

function GetRandomNPC()
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if canPedBeUsed(ped,true) and distance > 1.0 and distance < 25.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped
            success = false
            pedAvailable["conf"..rped] = true
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return rped
end

function canPedBeUsed(ped, available)
    if ped == nil then
        return false
    end
    if pedAvailable["conf"..ped] and available then
      return false
    end
    if ped == PlayerPedId() then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    if IsPedAPlayer(ped) then
        return false
    end
    if IsPedFatallyInjured(ped) then
        return false
    end
    if IsPedFleeing(ped) then
        return false
    end
    if IsPedInCover(ped) or IsPedGoingIntoCover(ped) or IsPedGettingUp(ped) then
        return false
    end
    if IsPedInMeleeCombat(ped) then
        return false
    end
    if IsPedShooting(ped) then
        return false
    end
    if IsPedDucking(ped) then
        return false
    end
    if IsPedBeingJacked(ped) then
        return false
    end
    if IsPedSwimming(ped) then
        return false
    end
    if IsPedSittingInAnyVehicle(ped) or IsPedGettingIntoAVehicle(ped) or IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
        return false
    end
    if IsPedOnAnyBike(ped) or IsPedInAnyBoat(ped) or IsPedInFlyingVehicle(ped) then
        return false
    end
    local pedType = GetPedType(ped)
    if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
        return false
    end
    return true
end
