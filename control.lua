---@alias train_id number

local function handle_get_tool(event)
    local player = game.get_player(event.player_index)
    if not player then return end
    local name = event.prototype_name or event.input_name
    if name == "tat_get_tool" then
        if player.clear_cursor() then
            player.cursor_stack.set_stack({name="tat-tool", count = 1})
        end
    end
end

script.on_event("tat_get_tool", handle_get_tool)
script.on_event(defines.events.on_lua_shortcut, handle_get_tool)

---@param entities LuaEntity[]
---@return {[train_id]: LuaTrain}
local function get_selected_trains(entities)
    local trains = {}
    for _, entity in pairs(entities) do
        if not entity.train then goto continue end
        trains[entity.train.id] = entity.train
        ::continue::
    end
    return trains
end

-- Left click
-- Normal selection: set to automatic mode
script.on_event(defines.events.on_player_selected_area, function (event)
    if event.item == "tat-tool" then
        for _, train in pairs(get_selected_trains(event.entities)) do
            train.manual_mode = false
        end
    end
end)

-- Right click
-- Alt selection: set to manual mode
script.on_event(defines.events.on_player_alt_selected_area, function (event)
    if event.item == "tat-tool" then
        for _, train in pairs(get_selected_trains(event.entities)) do
            train.manual_mode = not train.manual_mode
        end
    end
end)

-- Shift + left click
-- Reverse selection: toggle mode
script.on_event(defines.events.on_player_reverse_selected_area, function (event)
    if event.item == "tat-tool" then
        for _, train in pairs(get_selected_trains(event.entities)) do
            train.manual_mode = true
        end
    end
end)