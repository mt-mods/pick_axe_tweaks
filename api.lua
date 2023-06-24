
function pick_axe_tweaks.is_light_node(name)
	local def = minetest.registered_nodes[name]
	if def and def.paramtype == "light" and def.light_source and def.light_source > 0 then
		return true
	end
	return false
end

local function default_light_node()
	local node = minetest.settings:get("pat_light_node")

	if not minetest.registered_nodes[node] then
		return "default:torch"
	elseif not pick_axe_tweaks.is_light_node(node) then
		minetest.log("error", "[pick_axe_tweaks] Node " .. node .. " is not a light")
	else
		return node
	end
end

local function place_light(itemstack, player, pointed_thing)
	-- Should prevent crashes from mods passing fake players improperly
	if type(player) ~= "userdata" or pointed_thing.type ~= "node" then
		return
	end

	local node = minetest.get_node(pointed_thing.under)
	local def = minetest.registered_nodes[node.name]
	if def and def.on_rightclick and not player:get_player_control().sneak then
		return def.on_rightclick(pointed_thing.under, node, player, itemstack, pointed_thing)
	end

	local pmeta = player:get_meta()
	if pmeta:get_string("pa_status") == "false" then
		return
	end
	local light_node = default_light_node()
	if pmeta:get_string("pa_node") ~= "" then
		light_node = pmeta:get_string("pa_node")
	end
	if not pick_axe_tweaks.is_light_node(light_node) then
		return
	end

	node = minetest.get_node(pointed_thing.above)
	def = minetest.registered_nodes[node.name]
	if not def or not def.buildable_to or def.drawtype ~= "airlike" then
		return
	end

	local pinv = player:get_inventory()
	if pinv:contains_item("main", light_node) then
		minetest.registered_nodes[light_node].on_place(ItemStack(light_node), player, pointed_thing)
		pinv:remove_item("main", light_node)
	end
end

function pick_axe_tweaks.register_tool(name)
	if minetest.registered_items[name] then
		minetest.override_item(name, {
			on_place = place_light,
		})
	end
end

-- Deprecated API function, kept for compatibility
function pick_axe_tweaks.register_pick_axes(pick_axes)
	minetest.log("warning", "[pick_axe_tweaks] `pick_axe_tweaks.register_pick_axes()` is deprecated. " ..
			"Please add the `pickaxe` group, or use `pick_axe_tweaks.register_tool()`")

	for _, pa in pairs(pick_axes) do
		pick_axe_tweaks.register_tool(pa)
	end
end
