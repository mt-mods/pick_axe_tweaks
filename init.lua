
pick_axe_tweaks = {}  -- Global for API

local modpath = minetest.get_modpath("pick_axe_tweaks")

dofile(modpath .. "/api.lua")
dofile(modpath .. "/chat_commands.lua")

-- Register all tools with `pickaxe` group
minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_items) do
		if def.type == "tool" and def.groups and def.groups.pickaxe then
			pick_axe_tweaks.register_tool(name)
		end
	end
end)
