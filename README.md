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
> 	['compass'] 			 	     = {['name'] = 'compass', 			  	    	['label'] = 'Compass', 	         		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'compass.png', 		     	['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Just and handy compass!'},
```
