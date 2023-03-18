# C2K UI COMPASS - PRIVATE GITHUB REPOSITORY

Introducing a new FiveM resource that adds a customizable compass to your gameplay experience! With this script, you can now easily toggle the visibility of a sleek and modern compass that appears on the upper section of your screen.

<br>

<img src="https://i.imgur.com/MCqHvUu.png" alt="C2K COMPASS" />

Discord: https://dsc.gg/c2k

## Supported Frameworks

- <b>QB-CORE</b>
- <b>ESX</b>

## Resources Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core) (Latest)
- [es_extended](https://github.com/esx-framework/esx-legacy) (Latest)

## Features

- Use the Item <b>COMPASS</b> to show/hide the compass UI
- You can decide to disable the item and always show/hide the compass UI through the configuration file
- Size, position and color of every element is fully customizable directly through

## Setup

- Go on https://store.andreamarucci.com/
- Log into your <b>CFX.re</b> Account
- Select the <b>C2K_COMPASS</b> resource from the resource list and buy it
- Download the asset provived by the store and put it inside your resources folder
- Add the item "<b>COMPASS</b>" to your items
- Ensure the start of <b>C2K_COMPASS</b> inside your server.cfg writing </b>'ensure c2k_compass'</b>
- Start the server and <b>enjoy</b> your new resource!

**QB-CORE ITEM TO ADD**:

```
['compass'] 			 	     = {['name'] = 'compass', 			  	    	['label'] = 'Compass', 	         		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'compass.png', 		     	['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Just and handy compass!'},
```

**C2K_COMPASS CONFIG.LUA**:

```
Config = {}

Config.framework = 'QB' -- You can change it to 'ESX' or 'QB'. This setting is casesensitive so pay attention to the capital letters!

-- Compass Settings

Config.compass = { degree={}, cardinal={}, intercardinal={}}

Config.compass.useItem = true -- Turn to False if you want to always show/hide the compass regardless the Item

Config.compass.show = false -- Change it to true or false if Config.compass.useItem == false otherwise this setting is useless to change and will be toggled just using the Compass Item
Config.compass.position = {x = 0.5, y = 0.04, centered = true}
Config.compass.width = 0.25
Config.compass.fov = 180
Config.compass.followGameplayCam = true

Config.compass.degree.show = true -- Draw Azimut Degrees
Config.compass.degree.textSize = 0.25
Config.compass.degree.textOffset = -0.03
Config.compass.degree.position = {x = 0.5, y = 0.01, centered = true}
Config.compass.degree.colour = {r = 255, g = 255, b = 255, a = 255}

Config.compass.ticksBetweenCardinals = 9.0
Config.compass.tickColour = {r = 255, g = 255, b = 255, a = 255}
Config.compass.tickSize = {w = 0.001, h = 0.003}

Config.compass.cardinal.textSize = 0.3
Config.compass.cardinal.textOffset = 0.015
Config.compass.cardinal.textColour = {r = 255, g = 19, b = 39, a = 255}

Config.compass.cardinal.tickShow = true
Config.compass.cardinal.tickSize = {w = 0.001, h = 0.012}
Config.compass.cardinal.tickColour = {r = 255, g = 255, b = 255, a = 255}

Config.compass.intercardinal.show = true
Config.compass.intercardinal.textShow = true
Config.compass.intercardinal.textSize = 0.2
Config.compass.intercardinal.textOffset = 0.015
Config.compass.intercardinal.textColour = {r = 255, g = 255, b = 255, a = 255}

Config.compass.intercardinal.tickShow = true
Config.compass.intercardinal.tickSize = {w = 0.001, h = 0.006}
Config.compass.intercardinal.tickColour = {r = 255, g = 255, b = 255, a = 255}


-- Street Names Settings

Config.streetName = {}

Config.streetName.show = false -- IMPORTANT: You can use streetName only if Config.compass.show == true
Config.streetName.position = {x = 0.5, y = 0.08, centered = true}
Config.streetName.textSize = 0.25
Config.streetName.textColour = {r = 255, g = 255, b = 255, a = 230}
```
