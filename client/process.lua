
local QBCore = exports['qb-core']:GetCoreObject()

-- grand senora desert
exports['qb-target']:AddTargetModel(`a_m_m_farmer_01`, {
    options = {
        {
            event = "doj:client:attemptTrimmer",
            icon = "fas fa-cut", 
            label = "Speak with Trimmer",
        },
    },
    distance = 2.5
})

RegisterNetEvent('doj:client:attemptTrimmer', function()
    -- local ped = PlayerPedId()
    -- QBCore.Functions.Progressbar("knocking", "Knocking..", (math.random(3700, 5000)), false, true, {
	-- 	disableMovement = true,
	-- 	disableCarMovement = true,
	-- 	disableMouse = false,
	-- 	disableCombat = true,
	-- }, {
	-- 	animDict = "timetable@jimmy@doorknock@",
	-- 	anim = "knockdoor_idle",
	-- 	flags = 16,
	-- }, {}, {}, function() -- Done
    --     ClearPedTasks(ped)
    --     if GetClockHours() >= 6 and GetClockHours() <= 21 then
    --         local chance = math.random(100)
    --         if chance <= 50 then
    --             TriggerEvent("doj:client:mainProcessMenu")
    --             QBCore.Functions.Notify('Yo whats up', 'success')
    --         else
    --             QBCore.Functions.Notify('No Response... maby try again', 'primary')
    --         end
    --     else
    --         QBCore.Functions.Notify('Go Away!! Its Too Late!', 'error')
    --     end
        
	-- end, function()
    --     ClearPedTasks(ped)
	-- end)
    TriggerEvent("doj:client:mainProcessMenu")
end)

RegisterNetEvent('doj:client:stopBaggieMenu', function()
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('doj:client:baggieMenu', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
    exports['qb-menu']:openMenu({
        {
            header = "Combine Marijuana",
            txt = "Required: 1oz of Marijuana",
            isMenuHeader = true
        },
        {
            header = "3.5g Low Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 1
            }
        },
        {
            header = "3.5g Mid Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 2

            }
        },
        {
            header = "3.5g High Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 3
            }
        },
        {
            header = "exit",
            params = {
                event = "doj:client:stopBaggieMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:CombineMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Combine Marijuana",
            txt = "Required: 1oz of Marijuana",
            isMenuHeader = true
        },
        {
            header = "3.5g Low Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 1
            }
        },
        {
            header = "3.5g Mid Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 2

            }
        },
        {
            header = "3.5g High Grade",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Go Back",
            params = {
                event = "doj:client:mainProcessMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:TrimMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Trim & Package Marijuana",
            txt = "Required: 3 Harvested Crops",
            isMenuHeader = true
        },
        {
            header = "1oz Low Grade",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 1
            }
        },
        {
            header = "1oz Mid Grade",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 2

            }
        },
        {
            header = "1oz High Grade",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Go Back",
            params = {
                event = "doj:client:mainProcessMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:mainProcessMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Marijuana Trimmer",
            txt = "Oz's sell to shops</p>3.5g's sell on streets",
            isMenuHeader = true
        },
        {
            header = "Trim & Package",
            txt = "",
            params = {
                event = "doj:client:TrimMenu",
            }
        },
        {
            header = "Combine oz's to 1/8's",
            txt = "",
            params = {
                event = "doj:client:CombineMenu",
            }
        },
        {
            header = "Leave",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)
