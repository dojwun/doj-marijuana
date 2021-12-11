# doj-marijuana

| If you are intested in recieving github updates join the community on **[Discord](https://discord.gg/NVsaunpesE)**! |
|----|


Script that allows players to Harvest,Plant,Sell & Smoke Marijuana

# Info

### Joints
- roll a **[joint](https://streamable.com/dcw13v)** & **[3g joint](https://streamable.com/z2n3bw)**
- lighter is required to smoke
- papers are required to roll
- joints can only be rolled with 3.5 marijuana baggies
- 1 baggie = 3 joints

### **[Process](https://streamable.com/pjp8pf)**
- harvested crops and process into 1oz packaged marijuana
- **[combine](https://streamable.com/l6lvbc)** 1oz to 3.5 baggies
- use baggies to **[weigh & bag up](https://streamable.com/gh2cva)** 1oz in to 3.5gs if you have a scale and 9 baggies

### **[Player Grow](https://streamable.com/ec6ukb)**
- grow plants anywhere with seeds
- take care of plants with water/food
- crops can be destroyed, harvested or even die
- grown crops are the high potency
- player grown crops have 6 growth stages

**[stage-1](https://i.imgur.com/bbOtecx.jpg)**
**[stage-2](https://i.imgur.com/kfKVVM2.jpg)**
**[stage-3](https://i.imgur.com/rdWYLun.jpg)**
**[stage-4](https://i.imgur.com/9Sofbyb.jpg)**
**[stage-5](https://i.imgur.com/Ranvuh4.jpg)**
**[stage-6](https://i.imgur.com/yL2mMP7.jpg)**


### Harvest
- harvest crops from 2 locations [near lake & the weed farm]
- a trowel is needed to harvest crops near the lake
- crops harvested from **[the lake](https://streamable.com/luzk8a)** are low potency
- crops harvested from **[the weed farm](https://streamable.com/jvpu37)** are mid potency
- crops harvested from **[player grown plants](https://streamable.com/4qdf3t)** are high potency

### Sell
- sell **[3.5 grams](https://streamable.com/afe4ta)** on the street to npc in certan locations with a **[burner phone](https://streamable.com/qhz86v)**
- sell 1oz to **[Smoke on the Water](https://streamable.com/eryvdi)** shops

### Marijuana characteristics (if using ```function FormatItemInfo``` )
- there is 3 types of marijuana (potency) **[low](https://i.imgur.com/i2UQvD2.png)**, **[mid](https://i.imgur.com/gPmcPXf.png)** & **[high](https://i.imgur.com/ohEUFC0.png)**
- each type of marijuana has 12 diffrent strains 4 hybrid, 4 indica & 4 sativa
- marijuana characteristics are choosen at random  

# Required
- qb-core/shared.lua info
```
	-- LowGrade
	['marijuana_crop_low'] 			 	 = {['name'] = 'marijuana_crop_low', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'marijuana_crop_low.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'low grade harvested marijuana crop'},	
	['marijuana_3.5_low'] 			 	 = {['name'] = 'marijuana_3.5_low', 				['label'] = '3.5g marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_3.5_low.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = '3.5g low grade marijuana'},	
	['marijuana_1oz_low'] 			 	 = {['name'] = 'marijuana_1oz_low', 				['label'] = '1oz marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_1oz_low.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = '1oz low grade marijuana'},	
	
	--Mid Grade
	['marijuana_crop_mid'] 		 	 	 = {['name'] = 'marijuana_crop_mid', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'marijuana_crop_mid.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'mid grade harvested marijuana crop'},	
	['marijuana_3.5_mid'] 		 	 	 = {['name'] = 'marijuana_3.5_mid', 				['label'] = '3.5g marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_3.5_mid.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = '3.5g mid grade marijuana'},	
	['marijuana_1oz_mid'] 		 	 	 = {['name'] = 'marijuana_1oz_mid', 				['label'] = '1oz marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_1oz_mid.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = '1oz mid grade marijuana'},	
	
	--High Grade
	['marijuana_crop_high'] 		 	 = {['name'] = 'marijuana_crop_high', 				['label'] = 'Harvested Crop', 			['weight'] = 5500, 		['type'] = 'item', 		['image'] = 'marijuana_crop_high.png', 				['unique'] = false,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'high grade harvested marijuana crop'},	
	['marijuana_3.5_high'] 		 	 	 = {['name'] = 'marijuana_3.5_high', 				['label'] = '3.5g marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_3.5_high.png', 				['unique'] = true,    	['useable'] = true,     ['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = '3.5g high grade marijuana'},	
	['marijuana_1oz_high'] 		 	 	 = {['name'] = 'marijuana_1oz_high', 				['label'] = '1oz marijuana', 			['weight'] = 2800, 		['type'] = 'item', 		['image'] = 'marijuana_1oz_high.png', 				['unique'] = true,    	['useable'] = false,    ['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = '1oz high grade marijuana'},	
	
	-- marijuana items
	['marijuana_seeds'] 			 	 = {['name'] = 'marijuana_seeds', 					['label'] = 'Marijuana Seeds', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'marijuana_seeds.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'marijuana seeds'},	
	['marijuana_joint'] 			 	 = {['name'] = 'marijuana_joint', 					['label'] = 'Joint', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'marijuana_joint.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = '1g joint'},	
	['marijuana_joint3g'] 			 	 = {['name'] = 'marijuana_joint3g', 				['label'] = 'Joint', 			    	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'marijuana_joint3g.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = '3g joint'},	
	
	-- Shop Items
	['marijuana_phone'] 			 	 = {['name'] = 'marijuana_phone', 					['label'] = 'Burner Phone', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'marijuana_phone.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Burner phone used to sell eights'},	
	['marijuana_trowel'] 			 	 = {['name'] = 'marijuana_trowel', 			  		['label'] = 'Trowel', 					['weight'] = 0, 		['type'] = 'item', 		['image'] = 'marijuana_trowel.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	["marijuana_lighter"] 		 	 	 = {["name"] = "marijuana_lighter", 				["label"] = "Lighter", 					["weight"] = 0, 	    ["type"] = "item", 		["image"] = "marijuana_lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Cheap tweaker lighter, Still does the job"},
	["marijuana_rollingpapers"] 		         = {["name"] = "marijuana_rollingpapers", 			["label"] = "Rolling Papers", 			["weight"] = 0, 	    ["type"] = "item", 		["image"] = "marijuana_rollingpapers.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "These aint Raw Rolling Papers!!?"},
	["marijuana_baggies"] 		 	 	 = {["name"] = "marijuana_baggies", 				["label"] = "Baggies", 					["weight"] = 0, 	    ["type"] = "item", 		["image"] = "marijuana_baggies.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    		["combinable"] = nil,   ["description"] = "Need some baggies? i got some baggies"},
	["marijuana_scale"] 		 	         = {["name"] = "marijuana_scale", 					["label"] = "Scale", 					["weight"] = 0, 	    ["type"] = "item", 		["image"] = "marijuana_scale.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   		["combinable"] = nil,   ["description"] = "This is not what it looks like"},
	['marijuana_nutrition'] 			 = {['name'] = 'marijuana_nutrition', 			    ['label'] = 'Plant Fertilizer', 		['weight'] = 0, 		['type'] = 'item', 		['image'] = 'marijuana_nutrition.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'Plant nutrition'},
	['marijuana_water'] 			 	 = {['name'] = 'marijuana_water', 			    	['label'] = 'Plant Water', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'marijuana_water.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'Plant water'},

```

# Optional (if you are not using my **[qb-inventory](https://github.com/dojwun/qb-inventory)**)
- This code is to display **[Inventory Tooltip](https://i.imgur.com/ohEUFC0.png)** 
- inside ```qb-inventory/html/js/app.js``` look for the ```function FormatItemInfo```
```
          else if (itemData.name == "marijuana_1oz_low") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        } else if (itemData.name == "marijuana_1oz_mid") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        } else if (itemData.name == "marijuana_1oz_high") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        } else if (itemData.name == "marijuana_3.5_low") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        } else if (itemData.name == "marijuana_3.5_mid") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        } else if (itemData.name == "marijuana_3.5_high") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Strain: ' + itemData.info.strain + '</p>Potency: ' + itemData.info.potency + '</p>Type: ' + itemData.info.type + '<p>Thc: ' + itemData.info.thc + '%</p>');
        }  
```

