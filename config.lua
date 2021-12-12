Config = {}

Config.WeedField = vector3(311.286, 4304.369, 46.82) -- Location of the weed farm by the lake

Config.GrowRate = 10 -- In how many seconds it takes to update the plant (At 100% rate plant will grow 1% every update)

Config.SmokeontheWaterItems = {                      -- Items sold at Some on the Water shop
    [1] = { name = "marijuana_baggies",         price = 5,   amount = 999, info = {}, type = "item", slot = 1 },
    [2] = { name = "marijuana_scale",           price = 500, amount = 999, info = {}, type = "item", slot = 2 },
    [3] = { name = "marijuana_rollingpapers",   price = 500, amount = 999, info = {}, type = "item", slot = 3 },
    [4] = { name = "marijuana_lighter",         price = 500, amount = 999, info = {}, type = "item", slot = 4 },
    [5] = { name = "marijuana_trowel",          price = 500, amount = 999, info = {}, type = "item", slot = 5 },
    [6] = { name = "marijuana_phone",           price = 500, amount = 999, info = {}, type = "item", slot = 6 },
    [7] = { name = "marijuana_water",           price = 500, amount = 999, info = {}, type = "item", slot = 7 },
    [8] = { name = "marijuana_nutrition",       price = 500, amount = 999, info = {}, type = "item", slot = 8 },
}

Config.lowGradeOzPrice      = math.random(100,150)      -- Price of 1 low grade oz
Config.midGradeOzPrice      = math.random(200,250)      -- Price of 1 mid grade oz
Config.highGradeOzPrice     = math.random(300,350)      -- Price of 1 high grade oz

Config.lowGradeEighthPrice  = math.random(20,40)        -- Price of 1 low grade eighth
Config.midGradeEighthPrice  = math.random(45,60)        -- Price of 1 mid grade eighth
Config.highGradeEighthPrice = math.random(70,99)        -- Price of 1 high grade eighth


Config.cornerSellLocation = { -- *Avalible corner selling locations (see below) Max 10
    area1 = 'Mirror Park',
	area2 = 'Davis',
    area3 = 'Chamberlain Hills',
    area4 = 'Del Perro Beach',
    area5 = '',
    area6 = '',
    area7 = '',
    area8 = '',
    area9 = '',
    area10 = '',
}


-- [SOURCE: https://github.com/sjpfeiffer/ped_spawner]
Config.PedList = {                                              -- Peds that will be spawned in
	{
		model = "a_f_y_hippie_01",                              -- Smoke on the water shop              
		coords = vector3(-1170.474, -1571.001, 3.2),               
		heading = 114.796,
		gender = "female",
        scenario = "PROP_HUMAN_SEAT_BENCH_FOOD" 
	},
	{
		model = "a_m_m_farmer_01",                              -- Marijuana trimmer in grand senora desert                       
		coords = vector3(848.644, 2862.025, 57.0),               
		heading = 141.22,
		gender = "male",
        scenario = "PROP_HUMAN_SEAT_CHAIR_DRINK_BEER" 
	},
    {
		model = "a_f_m_fatwhite_01",                           -- Ambiant ped next to Marijuana trimmer                      
		coords = vector3(849.136, 2860.534, 57.0),               
		heading = 85.405,
		gender = "female",
        scenario = "PROP_HUMAN_SEAT_CHAIR_FOOD" 
	},
}

































-- *Avalible corner selling locations
-- "Los Santos International Airport",
-- "Alamo Sea",
-- "Alta",
-- "Fort Zancudo",
-- "Banham Canyon Dr",
-- "Banning",
-- "Baytree Canyon", 
-- "Vespucci Beach",
-- "Banham Canyon",
-- "Braddock Pass",
-- "Braddock Tunnel",
-- "Burton",
-- "Calafia Bridge",
-- "Raton Canyon",
-- "Cassidy Creek",
-- "Chamberlain Hills",
-- "Vinewood Hills",
-- "Chumash",
-- "Chiliad Mountain State Wilderness",
-- "Cypress Flats",
-- "Davis",
-- "Del Perro Beach",
-- "Del Perro",
-- "La Puerta",
-- "Grand Senora Desert",
-- "Downtown",
-- "Downtown Vinewood",
-- "East Vinewood",
-- "El Burro Heights",
-- "El Gordo Lighthouse",
-- "Elysian Island",
-- "Galilee",
-- "Galileo Park",
-- "GWC and Golfing Society",
-- "Grapeseed",
-- "Great Chaparral",
-- "Harmony",
-- "Hawick",
-- "Vinewood Racetrack",
-- "Humane Labs and Research",
-- "Bolingbroke Penitentiary",
-- "Little Seoul",
-- "Land Act Reservoir",
-- "Lago Zancudo",
-- "Land Act Dam",
-- "Legion Square",
-- "La Mesa",
-- "La Puerta",
-- "Mirror Park",
-- "Morningwood",
-- "Richards Majestic",
-- "Mount Chiliad",
-- "Mount Gordo",
-- "Mount Josiah",
-- "Murrieta Heights",
-- "North Chumash",
-- "N.O.O.S.E",
-- "Pacific Ocean",
-- "Paleto Cove",
-- "Paleto Bay",
-- "Paleto Forest",
-- "Palomino Highlands",
-- "Palmer-Taylor Power Station",
-- "Pacific Bluffs",
-- "Pillbox Hill",
-- "Procopio Beach",
-- "Rancho",
-- "Richman Glen",
-- "Richman",
-- "Rockford Hills",
-- "Redwood Lights Track",
-- "San Andreas",
-- "San Chianski Mountain Range",
-- "Sandy Shores",
-- "Mission Row",
-- "Stab City",
-- "Maze Bank Arena",
-- "Strawberry",
-- "Tataviam Mountains",
-- "Terminal",
-- "Textile City",
-- "Tongva Hills",
-- "Tongva Valley",
-- "Vespucci Canals",
-- "Vespucci",
-- "Vinewood",
-- "Ron Alternates Wind Farm",
-- "West Vinewood",
-- "Zancudo River",
-- "Port of South Los Santos",
-- "Davis Quartz"
