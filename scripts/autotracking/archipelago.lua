ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    print("test")
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, location_array in pairs(LOCATION_MAPPING) do
        for _, location in pairs(location_array) do
            if location then
                local obj = Tracker:FindObjectForCode(location)
                if obj then
                    if location:sub(1, 1) == "@" then
                        obj.AvailableChestCount = obj.ChestCount
                    else
                        obj.Active = false
                    end
                end
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0

    if slot_data["required_essences"] then
        Tracker:FindObjectForCode("onox_essences").CurrentStage = tonumber(slot_data["required_essences"])
    end
    if slot_data["treehouse_old_man_requirement"] then
        Tracker:FindObjectForCode("oldmanessences").CurrentStage = tonumber(slot_data["treehouse_old_man_requirement"])
    end
    if slot_data["golden_beasts_requirement"] then
        Tracker:FindObjectForCode("goldenbeastsrequired").CurrentStage = tonumber(slot_data["golden_beasts_requirement"])
    end
    if slot_data["tarm_gate_required_jewels"] then
        Tracker:FindObjectForCode("jewelreq").CurrentStage = tonumber(slot_data["tarm_gate_required_jewels"])
    end
    if slot_data["logic_difficulty"] then
        Tracker:FindObjectForCode("logiclevel").CurrentStage = tonumber(slot_data["logic_difficulty"])
    end
    if slot_data["shuffle_dungeons"] then
        Tracker:FindObjectForCode("dungeonshuffle").CurrentStage = tonumber(slot_data["shuffle_dungeons"])
    end
    if slot_data["warp_to_start"] then
        Tracker:FindObjectForCode("treewarp").CurrentStage = tonumber(slot_data["warp_to_start"])
    end
    if slot_data["shuffle_portals"] then
        Tracker:FindObjectForCode("portalshuffle").CurrentStage = tonumber(slot_data["shuffle_portals"])
    end
    if slot_data["goal"] then
        Tracker:FindObjectForCode("goal").CurrentStage = tonumber(slot_data["goal"])
    end
    if slot_data["horon_village_season"] then
        Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage = tonumber(slot_data["horon_village_season"])
    end
    if slot_data["shuffle_old_men"] then
        Tracker:FindObjectForCode("shuffle_old_men").CurrentStage = tonumber(slot_data["shuffle_old_men"])
    end
    if slot_data["shuffle_golden_ore_spots"] then
        Tracker:FindObjectForCode("shuffle_gold_ores").CurrentStage = tonumber(slot_data["shuffle_golden_ore_spots"])
    end
    if slot_data["lost_woods_item_sequence"] then
        Tracker:FindObjectForCode("lost_woods_item_sequence").CurrentStage = tonumber(slot_data["lost_woods_item_sequence"])
    end
    if slot_data["advance_shop"] then
        Tracker:FindObjectForCode("advance_shop").CurrentStage = tonumber(slot_data["advance_shop"])
    end
    if slot_data["default_seasons_option"] then
        Tracker:FindObjectForCode("defaultseasons").CurrentStage = tonumber(slot_data["default_seasons_option"])
    end
    if slot_data["animal_companion"] == "Ricky" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 0
    elseif slot_data["animal_companion"] == "Dimitri" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 1
    elseif slot_data["animal_companion"] == "Moosh" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 2
    end

    season_dictionary = {
        spring = 0,
        summer = 1,
        autumn = 2,
        winter = 3
      }
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "north horon" then
        Tracker:FindObjectForCode("season_northhoron").CurrentStage = season_dictionary[season_name]
        end
    end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "eastern suburbs" then
        Tracker:FindObjectForCode("season_eastsuburbs").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "woods of winter" then
        Tracker:FindObjectForCode("season_woodsofwinter").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "holodrum plain" then
        Tracker:FindObjectForCode("season_holodrumplain").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "spool swamp" then
        Tracker:FindObjectForCode("season_spoolswamp").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "sunken city" then
        Tracker:FindObjectForCode("season_sunkencity").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "western coast" then
        Tracker:FindObjectForCode("season_coast").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "temple remains" then
        Tracker:FindObjectForCode("season_templeremains").CurrentStage = season_dictionary[season_name]
    end
end
    for region_name, season_name in pairs(slot_data["default_seasons"]) do
        if  region_name == "horon village" then
        Tracker:FindObjectForCode("season_horonvillage").CurrentStage = season_dictionary[season_name]
    end
end
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
        return
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
    local location_array = LOCATION_MAPPING[location_id]
    if not location_array or not location_array[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end

    for _, location in pairs(location_array) do
        local obj = Tracker:FindObjectForCode(location)
        -- print(location, obj)
        if obj then
            if location:sub(1, 1) == "@" then
                obj.AvailableChestCount = obj.AvailableChestCount - 1
            else
                obj.Active = true
            end
        else
            print(string.format("onLocation: could not find object for code %s", location))
        end
    end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    Archipelago:AddLocationHandler("location handler", onLocation)
end