-- Reorder vanilla resources to match exotic industries progression.
-- Uranium-ore, Stone-ore will get removed from auto-generated resources.

-- resources to remove
local remove_resource = {
    "uranium-ore",
    "stone"
} 

--====================================================================================================
--REMOVE RESOURCES FROM AUTOPLACE
--====================================================================================================

-- remove autoplace in prototypes and data.raw
for i,v in ipairs(remove_resource) do
    data.raw["resource"][v].autoplace = nil
    data.raw["autoplace-control"][v] = nil

    log("Removed autoplace for " .. v)
end

-- fix map-gen-presets by removing autoplace-control
-- note there can only be one map-gen-presets
for i,v in pairs(data.raw["map-gen-presets"].default) do

    -- check if basic_settings is set
    if v.basic_settings then

        -- check if autoplace-controls is set
        if v.basic_settings.autoplace_controls then

            -- loop over and search for remove_resource
            for x,y in pairs(data.raw["map-gen-presets"].default[i].basic_settings.autoplace_controls) do
                for z,w in ipairs(remove_resource) do

                    -- check if resource is found
                    if x == w then

                        -- remove resource
                        data.raw["map-gen-presets"].default[i].basic_settings.autoplace_controls[x] = nil
                        log("Removed autoplace-control for " .. w .. " in map-gen-presets: ".. i)
                    end
                end
            end
        end
    end
end

--====================================================================================================
--REMOVE GAIA TILES/ENTITIES FORM NAUVIS
--====================================================================================================

--ENTITIES NOT ON NAUVIS
------------------------------------------------------------------------------------------------------

local remove_entities = {
    "ei_core-patch",
    "ei_cryoflux-patch",
    "ei_phytogas-patch",
    "ei_gaia-tree-01",
    "ei_gaia-tree-02",
    "ei_gaia-tree-05",
    --"ei_gaia-tree-09"
}

local remove_entity_settings = {}
for i,v in ipairs(remove_entities) do
    remove_entity_settings[v] = {frequency = 0, size = 0, richness = 0}
end

--TILES NOT ON NAUVIS
------------------------------------------------------------------------------------------------------

local remove_tiles = {}

for i,v in pairs(data.raw["tile"]) do
    -- if tile starts with "ei_" add to remove_tiles
    if string.sub(i, 1, 3) == "ei_" then
        table.insert(remove_tiles, i)
    end
end

local remove_tiles_settings = {}
for i,v in ipairs(remove_tiles) do
    remove_tiles_settings[v] = {frequency = 0, size = 0, richness = 0}
end

local new_autoplace_settings = {
    ["tile"] = {
        ["treat_missing_as_default"] = true,
        ["settings"] = remove_tiles_settings
    },
    ["entity"] = {
        ["treat_missing_as_default"] = true,
        ["settings"] = remove_entity_settings
    },
    ["decorative"] = {
        ["treat_missing_as_default"] = true,
        ["settings"] = {}
    }
}

--APPLY CHANGES
------------------------------------------------------------------------------------------------------

for i,v in pairs(data.raw["map-gen-presets"].default) do

    if not (type(data.raw["map-gen-presets"].default[i]) == "table") then
        goto continue
    end

    -- skip default settings
    if i == "default" then
        goto continue
    end

    if not v.basic_settings then
        data.raw["map-gen-presets"].default[i].basic_settings = {}
    end

    data.raw["map-gen-presets"].default[i].basic_settings.autoplace_settings = new_autoplace_settings

    log("Removed gaia tiles from map-gen-presets: ".. i)
    
    ::continue::

end

-- add a new EI-default setting
data.raw["map-gen-presets"].default["ei_default"] = {
    order = "a",
    basic_settings = {
        autoplace_settings = new_autoplace_settings
    }
}
