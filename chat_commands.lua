
minetest.register_chatcommand("pick_axe_status", {
	description = "Toggles the ability of pickaxes to place light sources",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "You need to be in-game to use this comamnd"
		end
		local pmeta = player:get_meta()
		local enabled = pmeta:get_string("pa_status") ~= "false"
		if enabled then
			pmeta:set_string("pa_status", "false")
			return true, "Pickaxe tweak disabled"
		else
			pmeta:set_string("pa_status", "")
			return true, "Pickaxe tweak enabled"
		end
	end,
})

minetest.register_chatcommand("set_light_node", {
	params = "[<node_name>]",
	description = "Set the light source node the pickaxe places. Omit the name to use the node in your hand.",
	func = function(name, node)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "You need to be in-game to use this comamnd"
		end
		local pmeta = player:get_meta()
		if node == "" then
			node = player:get_wielded_item():get_name()
		end
		local def = minetest.registered_nodes[node]
		if not def then
			return false, node .. " is not a valid node"
		elseif not pick_axe_tweaks.is_light_node(node) then
			return false, node .. " is not a light"
		else
			pmeta:set_string("pa_node", node)
			return true, "Light node set to " .. node
		end
	end,
})
