--enables or disables the setting pick axes read to see if they can place a light node or not
minetest.register_chatcommand("pick_axe_status", {
	params = "<bool>",
	description = "disables or re enables ability of pick axes to place a light source",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player == nil then
			return false, minetest.chat_send_player(name, "You need to be in game to use this comamnd")
		end
		local pmeta = player:get_meta()

		if param ~= "true" and param ~= "false" then
			minetest.chat_send_player(name, "not valid input, please enter true or false")
		elseif param == "false" then
			pmeta:set_string("pa_status", "false")
			minetest.chat_send_player(name, "[pick_axe_tweaks] - setting disabled")
		elseif param == "true" then
			pmeta:set_string("pa_status", "")
			minetest.chat_send_player(name, "[pick_axe_tweaks] - setting re enabled")
		end
	end,
})

--comand for setting the light node
minetest.register_chatcommand("set_light_node", {
	params = "<light_node>",
	description = "set the light source node the pick axe places",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player == nil then
			return false, minetest.chat_send_player(name, "You need to be in game to use this comamnd")
		end
		local pmeta = player:get_meta()

		if not minetest.registered_nodes[param] then
			minetest.chat_send_player(name, param .. " is not a valid node")
		elseif minetest.registered_items[param].paramtype ~= "light" then
			minetest.chat_send_player(name, param .. " does not have a paramtype of light")
		else
			pmeta:set_string("pa_node", param)
			minetest.chat_send_player(name, param .. " set.")
		end
	end,
})