--global for api
pick_axe_tweaks = {}

local function default_light_node()
    local node = minetest.settings:get("pat_light_node")

    if not minetest.registered_nodes[node] then
        return "default:torch"
    elseif minetest.registered_nodes[node].paramtype ~= "light" then
        minetest.log("error", node .. " is does not have a paramtype of light")
    else
        return node
    end
end

function pick_axe_tweaks.register_pick_axes(pick_axes)
    for _, pa in pairs(pick_axes) do
        if minetest.registered_items[pa] then
            minetest.override_item(pa, {
                on_place = function(itemstack, player, pointed_thing)
                    local pmeta = player:get_meta()
                    if pmeta:get_string("pa_status") == "false" then
                        return
                    end

                    local light_node = default_light_node()--"default:torch"
                    if pmeta:get_string("pa_node") ~= "" then light_node = pmeta:get_string("pa_node") end
                    local pinv = player:get_inventory()
                    local contains_ln = pinv:contains_item("main", light_node)
                    local is_air = minetest.get_node(pointed_thing.above).name == "air"
                    local noddef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]

                    if not player:get_player_control().sneak and noddef.on_rightclick then
                        return minetest.item_place(itemstack, player, pointed_thing)
                    elseif pointed_thing.type ~= "node" then return
                    end

                    if contains_ln and is_air then
                        if minetest.registered_nodes[light_node].paramtype2 == "wallmounted" then
                            minetest.registered_nodes[light_node].on_place(itemstack, player, pointed_thing)
                        else
                            minetest.item_place(ItemStack(light_node), player, pointed_thing)
                        end
                        pinv:remove_item("main", light_node)
                    end
                end
            })
        end
    end
end