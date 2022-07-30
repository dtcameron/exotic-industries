-- this file contains the prototype definition for varios stuff from dark age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_poor-iron-chunk",
        type = "item",
        icon = ei_graphics_item_path.."poor-iron-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a1",
    },
    {
        name = "ei_poor-copper-chunk",
        type = "item",
        icon = ei_graphics_item_path.."poor-copper-chunk.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-raw",
        order = "a2",
    },
    {
        name = "ei_slag",
        type = "item",
        icon = ei_graphics_item_path.."slag.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-byproduct",
        order = "a1",
    },
    {
        name = "ei_iron-ingot",
        type = "item",
        icon = ei_graphics_item_path.."iron-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a1",
    },
    {
        name = "ei_copper-ingot",
        type = "item",
        icon = ei_graphics_item_path.."copper-ingot.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-ingot",
        order = "a2",
    },
    {
        name = "ei_iron-beam",
        type = "item",
        icon = ei_graphics_item_path.."iron-beam.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-beam",
        order = "a1",
    },
    {
        name = "ei_copper-beam",
        type = "item",
        icon = ei_graphics_item_path.."copper-beam.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-beam",
        order = "a2",
    },
    {
        name = "ei_iron-mechanical-parts",
        type = "item",
        icon = ei_graphics_item_path.."iron-mechanical-parts.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-parts",
        order = "a1",
    },
    {
        name = "ei_copper-mechanical-parts",
        type = "item",
        icon = ei_graphics_item_path.."copper-mechanical-parts.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-parts",
        order = "a2",
    },
    {
        name = "ei_dark-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."dark-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a1",
    },
    {
        name = "ei_steam-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."steam-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a2",
    }
    
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_poor-iron-chunk:smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {"ei_poor-iron-chunk", 1}
        },
        results = {
            {type = "item", name = "ei_iron-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.1}
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_iron-ingot",
    },
    {
        name = "ei_poor-copper-chunk:smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {"ei_poor-copper-chunk", 1}
        },
        results = {
            {type = "item", name = "ei_copper-ingot", amount = 1},
            {type = "item", name = "ei_slag", amount = 1, probability = 0.1}
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_copper-ingot",
    },
    {
        name = "ei_iron-beam",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_iron-ingot", 2},
        },
        results = {
            {type = "item", name = "ei_iron-beam", amount = 1},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_iron-beam",
    },
    {
        name = "ei_copper-beam",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_copper-ingot", 2},
        },
        results = {
            {type = "item", name = "ei_copper-beam", amount = 1},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_copper-beam",
    },
    {
        name = "ei_iron-mechanical-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {"ei_iron-ingot", 1},
        },
        results = {
            {type = "item", name = "ei_iron-mechanical-parts", amount = 2},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_iron-mechanical-parts",
    },
    {
        name = "ei_copper-mechanical-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {"ei_copper-ingot", 1},
        },
        results = {
            {type = "item", name = "ei_copper-mechanical-parts", amount = 2},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_copper-mechanical-parts",
    },
    {
        name = "ei_stone:slag_processing",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {"ei_slag", 2},
        },
        results = {
            {type = "item", name = "stone", amount = 1},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "stone",
    },
    {
        name = "ei_dark-age-tech",
        type = "recipe",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {"ei_iron-ingot", 1},
            {"ei_copper-ingot", 1},
        },
        results = {
            {type = "item", name = "ei_dark-age-tech", amount = 2},
        },
        always_show_made_in = true,
        enabled = true,
        main_product = "ei_dark-age-tech",
    },
    {
        name = "ei_steam-engine",
        type = "recipe",
        category = "crafting",
        energy_required = 1.5,
        ingredients = {
            {"ei_iron-mechanical-parts", 1},
            {"pipe", 1},
        },
        results = {
            {type = "item", name = "engine-unit", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "engine-unit",
    },
    {
        name = "ei_steam-age-tech",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {"ei_copper-mechanical-parts", 2},
            {"engine-unit", 1},
        },
        results = {
            {type = "item", name = "ei_steam-age-tech", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_steam-age-tech",
    }
})

--TECHS
------------------------------------------------------------------------------------------------------

-- insert steam-age-tech and engine unit aswell as pipe into steam-age-tech

data.raw["technology"]["ei_steam-age"].effects = {
    {
        type = "unlock-recipe",
        recipe = "pipe"
    },
    {
        type = "unlock-recipe",
        recipe = "ei_steam-engine"
    },
    {
        type = "unlock-recipe",
        recipe = "ei_steam-age-tech"
    }
}