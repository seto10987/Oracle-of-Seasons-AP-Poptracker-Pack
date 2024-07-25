ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function onClear(slot_data)

        -- print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
        -- function dump_table(tbl)
        --     for key, value in pairs(tbl) do
        --         print(key, value)
        --     end
        -- end
        -- print("test")
        
        -- print("Called onClear, slot_data:")
        -- dump_table(slot_data)

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
    if slot_data["normalize_horon_village_season"] then
        Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage = tonumber(slot_data["normalize_horon_village_season"])
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
    if slot_data["master_keys"] then
        Tracker:FindObjectForCode("master_keys").CurrentStage = tonumber(slot_data["master_keys"])
    end
    if slot_data["remove_d0_alt_entrance"] then
        Tracker:FindObjectForCode("d0_alt_entrance").CurrentStage = tonumber(slot_data["remove_d0_alt_entrance"])
    end
    if slot_data["remove_d2_alt_entrance"] then
        Tracker:FindObjectForCode("d2_alt_entrance").CurrentStage = tonumber(slot_data["remove_d2_alt_entrance"])
    end
    if slot_data["keysanity_small_keys"] then
        Tracker:FindObjectForCode("small_keysanity").CurrentStage = tonumber(slot_data["keysanity_small_keys"])
    end
    if slot_data["keysanity_boss_keys"] then
        Tracker:FindObjectForCode("boss_keysanity").CurrentStage = tonumber(slot_data["keysanity_boss_keys"])
    end
    if slot_data["enforce_potion_in_shop"] then
        Tracker:FindObjectForCode("horon_shop_potion").CurrentStage = tonumber(slot_data["enforce_potion_in_shop"])
    end
    
    if slot_data["animal_companion"] == "Ricky" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 0
    elseif slot_data["animal_companion"] == "Dimitri" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 1
    elseif slot_data["animal_companion"] == "Moosh" then
        Tracker:FindObjectForCode("natzu_animal").CurrentStage = 2
    end

    if slot_data["default_seasons_option"] == "vanilla" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 0
    elseif slot_data["default_seasons_option"] == "randomized" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 1
    elseif slot_data["default_seasons_option"] == "random_singularity" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 2
    elseif slot_data["default_seasons_option"] == "spring_singularity" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 3
    elseif slot_data["default_seasons_option"] == "summer_singularity" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 4
    elseif slot_data["default_seasons_option"] == "autumn_singularity" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 5
    elseif slot_data["default_seasons_option"] == "winter_singularity" then
        Tracker:FindObjectForCode("default_seasons").CurrentStage = 6
    end

    -- season_dictionary = {
        -- spring = 0,
        -- summer = 1,
        -- autumn = 2,
        -- winter = 3
      -- }
    for region_name, season_id in pairs(slot_data["default_seasons"]) do

        if  region_name == "EYEGLASS_LAKE" then
        Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage = season_id
        end
        if  region_name == "EASTERN_SUBURBS" then
        Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage = season_id
        end
        if  region_name == "WOODS_OF_WINTER" then
        Tracker:FindObjectForCode("wow_season_hidden").CurrentStage = season_id
        end
        if  region_name == "HOLODRUM_PLAIN" then
        Tracker:FindObjectForCode("plain_season_hidden").CurrentStage = season_id
        end
        if  region_name == "SPOOL_SWAMP" then
        Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage = season_id
        end
        if  region_name == "SUNKEN_CITY" then
			Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage = season_id
        end
        if  region_name == "WESTERN_COAST" then
			Tracker:FindObjectForCode("coast_season_hidden").CurrentStage = season_id
        end
        if  region_name == "TEMPLE_REMAINS" then
			Tracker:FindObjectForCode("remains_season_hidden").CurrentStage = season_id
        end
		if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
			if  region_name == "HORON_VILLAGE" then
				Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage = season_id
			end
        end
    end

    portal_dictionary = {
        ['volcanoes west portal'] = 1,
        ['subrosia market portal'] = 2,
        ['great furnace portal'] = 3,
        ['strange brothers portal'] = 4,
        ['house of pirates portal'] = 5,
        ['volcanoes east portal'] = 6,
        ['d8 entrance portal'] = 7,
        ['eastern suburbs portal'] = 0,
        ['spool swamp portal'] = 0,
        ['eyeglass lake portal'] = 0,
        ['horon village portal'] = 0,
        ['mt. cucco portal'] = 0,
        ['temple remains upper portal'] = 0,
        ['temple remains lower portal'] = 0
    }
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "eastern suburbs portal" then
        Tracker:FindObjectForCode("suburbs_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "spool swamp portal" then
        Tracker:FindObjectForCode("swamp_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "eyeglass lake portal" then
        Tracker:FindObjectForCode("lake_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
    end
        end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "mt. cucco portal" then
        Tracker:FindObjectForCode("mtcucco_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "horon village portal" then
        Tracker:FindObjectForCode("horon_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "temple remains lower portal" then
        Tracker:FindObjectForCode("remains_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end
    for region_name, portal_name in pairs(slot_data["portal_connections"]) do
        if  region_name == "temple remains upper portal" then
        Tracker:FindObjectForCode("d8_portal_selector_hidden").CurrentStage = portal_dictionary[portal_name]
        end
    end


    dungeon_dictionary = {
        ['enter d0'] = 1,
        ['enter d1'] = 2,
        ['enter d2'] = 3,
        ['enter d3'] = 4,
        ['enter d4'] = 5,
        ['enter d5'] = 6,
        ['enter d6'] = 7,
        ['enter d7'] = 8,
        ['enter d8'] = 9
    }
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d0 entrance" then
        Tracker:FindObjectForCode("d0_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d1 entrance" then
        Tracker:FindObjectForCode("d1_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d2 entrance" then
        Tracker:FindObjectForCode("d2_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
    end
        end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d3 entrance" then
        Tracker:FindObjectForCode("d3_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d4 entrance" then
        Tracker:FindObjectForCode("d4_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d5 entrance" then
        Tracker:FindObjectForCode("d5_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d6 entrance" then
        Tracker:FindObjectForCode("d6_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d7 entrance" then
        Tracker:FindObjectForCode("d7_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
        end
    end
    for region_name, dungeon_entrance in pairs(slot_data["dungeon_entrances"]) do
        if  region_name == "d8 entrance" then
        Tracker:FindObjectForCode("d8_ent_selector_hidden").CurrentStage = dungeon_dictionary[dungeon_entrance]
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