# Minetest Pickaxe Tweaks Mod
![Luacheck](https://github.com/wsor4035/pick_axe_tweaks/workflows/luacheck/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![ContentDB](https://content.minetest.net/packages/wsor4035/pick_axe_tweaks/shields/downloads/)](https://content.minetest.net/packages/wsor4035/pick_axe_tweaks/)


## About

Adds the ability for pickaxes to place light nodes. Configurable per player.


## Setup

Download mod, put in your `mods` or `worldmods` folder and enable it. You can also install it from the content tab in Minetest, or download it from [ContentDB](https://content.minetest.net/packages/mt-mods/pick_axe_tweaks/).

If not using with Minetest Game, please change the default light node setting.

## Settings 

* `pat_light_node`: Default light node. (by default `default:torch`)

## API

For pickaxes, simply add the `pickaxe` group to the tool's groups, and it will automatically be registered.

Alternatively, for non-pickaxes, you can use the API function: `pick_axe_tweaks.register_tool(name)`

## Other comments

Thanks to @luk3yx and @S-S-X for suggestions.
