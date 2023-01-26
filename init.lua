local modpath = minetest.get_modpath("pick_axe_tweaks")
dofile(modpath .. "/api.lua")
dofile(modpath .. "/chat_commands.lua")

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