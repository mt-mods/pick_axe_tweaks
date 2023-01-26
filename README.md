# Minetest Pickaxe Tweaks Mod
![Luacheck](https://github.com/wsor4035/pick_axe_tweaks/workflows/luacheck/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## About

Adds the ability for pickaxes to place light nodes. Configurable per player.

## Links

* [Github](https://github.com/wsor4035/pick_axe_tweaks)
* ContentDB (not yet available)
* Minetest forum (not avaible yet)

## Setup

Download mod, put in your `mods` or `worldmods` folder and enable it.

If not using with Minetest Game, please change the default light node setting.

## Settings 

* `pat_light_node`: Default light node. (by default `default:torch`)

## API

`pick_axe_tweaks.register_pick_axes()`: Registers a list of pickaxes.

Example:

```lua
local pickaxes = {
	"my_mod:pick_wood",
	"my_mod:pick_stone",
	"my_mod:pick_diamond",
}

pick_axe_tweaks.register_pick_axes(pickaxes)
```

## Other comments

Thanks to @luk3yx and @S-S-X for suggestions.
