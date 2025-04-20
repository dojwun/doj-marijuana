

RegisterNetEvent('doj:client:smokeOnTheWaterMenu', function()
    exports['envi-interact']:PedInteraction(spawnedPed, {
        title = 'PlantGrow Item Dealer',
        speech = 'Yo Whats Up! How can i help you?',
        duration = 100,
        menuID = 'npc-interaction-shop',
        position = 'right',
        greeting = 'GENERIC_HOWS_IT_GOING',
        focusCam = true,
        options = {
          {
            key = 'E',
            label = 'Browse Products',
            reaction = 'CHAT_STATE',
            selected = function(data)
                TriggerEvent('doj:client:PlantGrowCatalog')
                exports['envi-interact']:CloseMenu(data.menuID)
            end,
          },
          {
            key = 'X',
            reaction = 'GENERIC_BYE',
            label = 'Leave',
            selected = function(data)
                exports['envi-interact']:CloseMenu(data.menuID)
            end
          }
        }
    })
end)


RegisterNetEvent("doj:client:PlantGrowCatalog", function()
    local GrowShopItems = {}
    for k, v in pairs(Config.GrowShop) do
        GrowShopItems[#GrowShopItems + 1] =
        {
            title = exports.ox_inventory:Items(v.Items).label,
            icon = "nui://ox_inventory/web/images/"..v.Items..".png",
            onSelect = function()
                local input = lib.inputDialog('Cash Only!', {
                    {
                        type = 'slider',
                        label = 'How much you tryna buy?',
                        icon = 'hashtag',
                        required = true,
                        min = 1, max = 25,
                        default = 1,
                        step = 1,
                    },
                })
                if not input then
                    lib.notify({
                        title = 'Stop wasting my time',
                        description = 'You need to enter an amount.',
                        type = 'warning',
                        duration = 5000,
                    })
                    return
                end

                TriggerServerEvent("doj:server:addPlantGrowShopItems", v.Items, v.Price, input[1])
                SellReactGrowShop(spawnedPed)
            end
        }
    end
    lib.registerContext({
        id = 'PlantGrowMenu',
        title = 'PlantGrow Item Shop',
        canClose = true,
        options = GrowShopItems,
    })
    lib.showContext('PlantGrowMenu')
end)


function SellReactGrowShop(spawnedPed)
    local playerPed = PlayerPedId()
    local ped = spawnedPed
    local animDict = 'mp_common'
    local animName = 'givetake1_a'
    lib.requestAnimDict(animDict)
    local PedItem = CreateObject(GetHashKey("prop_paper_bag_small"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(PedItem, ped, GetPedBoneIndex(ped, 0x188E), 0.08, -0.06, -0.01, 96.0, 20.0, 180.0, true, true, false, true, 1, true)
    TaskPlayAnim(playerPed, animDict, animName, 1.0, -1.0, 1000, 49, 0, false, false, false)
    TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1000, 49, 0, false, false, false)
    Citizen.Wait(1000)
    DeleteObject(PedItem)
    local PlayerItem = CreateObject(GetHashKey("prop_paper_bag_small"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(PlayerItem, playerPed, GetPedBoneIndex(playerPed, 0x188E), 0.08, -0.06, -0.01, 96.0, 20.0, 180.0, true, true, false, true, 1, true)
    Citizen.Wait(900)
    DeleteObject(PlayerItem)
    PlayPedAmbientSpeechNative(ped, 'GENERIC_BYE', 'SPEECH_PARAMS_FORCE_NORMAL_CLEAR')
end




