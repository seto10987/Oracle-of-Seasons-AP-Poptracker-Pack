ScriptHost:LoadScript("scripts/logic.lua")
ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/portal_logic.lua")
ScriptHost:LoadScript("scripts/autotracking.lua")
ScriptHost:LoadScript("scripts/locations.lua")

Tracker:AddItems("items/items.json")

Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/labels.json")
Tracker:AddMaps("maps/maps.json")

Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/tracker_layouts.json")
Tracker:AddLayouts("layouts/broadcast.json")

