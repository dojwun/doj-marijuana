-- Smoke on the water
exports['qb-target']:AddBoxZone("sellOz", Config.smokeShopMenu, 1.0, 3.0, {
    name="sellOz",
    heading= 127.339,
    debugPoly=false,
    minZ=3.664,
    maxZ=6.664
    }, {
    options = {
        {
            event = "doj:client:smokeOnTheWaterMenu",
            icon = "fas fa-circle", 
            label = "Smoke on the water",
        },
    },
    distance = 1.3
}) 

RegisterNetEvent('doj:client:smokeOnTheWaterMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "Marijuana Vendor",
            isMenuHeader = true
        },
        {
            header = "Sell to Shop",
            txt = "See current prices",
            params = {
                event = "doj:client:sellOzMenu",
            }
        },
        {
            header = "Browse Shop",
            txt = "See what we have to offer",
            params = {
                event = "inventory:client:OpenSmokeShop",
            }
        },
        {
            header = "exit",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:sellOzMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Smoke on the Water",
            txt = "We only accept ounces",
            isMenuHeader = true
        },
        {
            header = "$"..Config.lowGradeOzPrice.." per Low Grade Oz",
            txt = "",
            params = {
                event = "doj:server:sellOz",
                isServer = true,
                args = 1
            }
        },
        {
            header = "$"..Config.midGradeOzPrice.." per Mid Grade Oz",
            txt = "",
            params = {
                event = "doj:server:sellOz",
                isServer = true,
                args = 2

            }
        },
        {
            header = "$"..Config.highGradeOzPrice.." per High Grade Oz",
            txt = "",
            params = {
                event = "doj:server:sellOz",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Return",
            params = {
                event = "doj:client:smokeOnTheWaterMenu"
            }
        },
    })
end)

RegisterNetEvent('inventory:client:OpenSmokeShop')
AddEventHandler('inventory:client:OpenSmokeShop', function()
    local ShopItems = {}
    ShopItems.label = "Smoke on the Water"
    ShopItems.items = Config.SmokeontheWaterItems
    ShopItems.slots = #Config.SmokeontheWaterItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "SmokeShop_", ShopItems)
end)
