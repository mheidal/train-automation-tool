local data_util = require("__flib__/data-util")

local rolling_stock_entities = {
  "locomotive",
  "cargo-wagon",
  "fluid-wagon",
  "artillery-wagon",
}

data:extend{
  {
    type = "custom-input",
    name = "tat_get_tool",
    key_sequence = "ALT + A",
    order = "a",
  },
  {
    type="shortcut",
    name="tat_get_tool",
    action="lua",
    icon=data_util.build_sprite(nil, {0, 0}, "__train-automation-tool__/graphics/tat-shortcut-dark.png", 32, 2),
    disabled_icon=data_util.build_sprite(nil, {0, 0}, "__train-automation-tool__/graphics/tat-shortcut-light.png", 32, 2),
    toggleable=true,
    associated_control_input="tat_get_tool"
  },
  {
    type = "selection-tool",
    name = "tat-tool",
    localised_name = { "item-name.tat-tool" },
    icons = {
      -- { icon = data_util.black_image, icon_size = 1, scale = 64 },
      { icon = "__train-automation-tool__/graphics/tat-tool.png", icon_size = 32, icon_mipmaps = 2 },
    },
    subgroup = "tool",
    order = "c[automated-construction]-x",
    -- selection: activate
    selection_mode = { "blueprint" },
    selection_color = { g=1, },
    selection_cursor_box_type = "not-allowed",
    entity_type_filters = rolling_stock_entities,
    -- alt selection: toggle
    alt_selection_mode = { "blueprint" },
    alt_selection_color = { b=1, },
    alt_selection_cursor_box_type = "not-allowed",
    alt_entity_type_filters = rolling_stock_entities,
    -- reverse selection: toggle
    reverse_selection_mode = {"blueprint"},
    reverse_selection_color = { r=1, },
    reverse_selection_cursor_box_type = "not-allowed",
    reverse_entity_type_filters = rolling_stock_entities,

    stack_size = 1,
    flags = { "hidden", "only-in-cursor", "spawnable" },
    draw_label_for_cursor_render = true,
    -- mouse_cursor = "tl-tool-cursor",
    alt_reverse_selection_mode = {"nothing"},
    alt_reverse_selection_color = { a=0, },
  },
}