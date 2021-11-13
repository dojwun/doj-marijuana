-------- START OF JOINTS ------------
RegisterNetEvent('doj:client:smokeJoint', function(prop_name)
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot smoke this while inside a vehicle", "error", 3500)
        return
    end
    QBCore.Functions.Progressbar("smoking", "Smoking a Joint...", 10000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "amb@world_human_smoking_pot@male@idle_a",
		anim = "idle_b",
		flags = 16,
    }, {
        model = "p_cs_joint_01",
        bone = 26610,
        coords = { x = 0.10, y = -0.03, z = 0.00},
        rotation = { x = 0.00, y = 25.0, z = 0.0},
    }, {}, function() -- Done
        playAnim("timetable@gardener@smoking_joint", "idle_cough", 2000)
        AddArmourToPed(playerPed, math.random(9, 14))
        Wait(3000)
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10)) 
	end, function() -- Cancel
        ClearPedTasks(playerPed)
	end)
end)

-------- START OF JOINT 2 ------------

RegisterCommand('doj:client:stopJoint', function()
    local playerPed = PlayerPedId()
    if inJoint then
        inJoint = false
        ClearPedTasks(playerPed)
        exports['textUi']:DrawTextUi('hide')
        playAnim("timetable@gardener@smoking_joint", "idle_cough", 2000)
        AddArmourToPed(playerPed, math.random(15, 20))
        Wait(3000)
        TriggerServerEvent('hud:server:RelieveStress', math.random(15, 20))
    end 
end)
RegisterKeyMapping('doj:client:stopJoint', 'Stop Smoking Joint', 'keyboard', 'X')

RegisterNetEvent('doj:client:smokeJoint3g')
AddEventHandler('doj:client:smokeJoint3g', function(source)
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot smoke this while inside a vehicle", "error", 3500)
        return
    end
	inJoint = true
    exports['progressBars']:drawBar(3700, 'Smoking a Joint...')
    exports['textUi']:DrawTextUi('show', "[X] - Stop smoking")
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
end)


  

