# Minetest Pick_Axe_Tweaks Mod

![Luacheck](https://github.com/wsor4035/pick_axe_tweaks/workflows/luacheck/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## About

adds the ability for pick axes to place a configurable light node ffrom in game and per player

## Links

* [Github](https://github.com/wsor4035/pick_axe_tweaks)
* [Contentdb](not yet available)
* [forums](not avaible yet)

## Setup

download mod, put in your worldmods folder, or mods folder and enable it
* if not using with mtg, please change the setting found under header `minetest.conf settings`
* also use a mod that uses this mods api to register its pick axes

## minetest.conf settings 

* pat_light_node (by default default:torch): default light node for pick axes

## API

example pulled from init.lua

```lua
if minetest.get_modpath("default") then
    local default_pick_axes = {
        "default:pick_wood",
        "default:pick_stone",
        "default:pick_bronze",
        "default:pick_steel",
        "default:pick_mese",
        "default:pick_diamond",
    }

    pick_axe_tweaks.register_pick_axes(default_pick_axes)
end
```
