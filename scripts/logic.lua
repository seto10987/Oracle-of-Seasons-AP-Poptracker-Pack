function has(item)
  return Tracker:ProviderCountForCode(item) == 1
end

-- ALL CHECKS MARKED AS "HARD" IN THE RANDOMIZER ARE NOT USED HERE

-- WEIRD LOGIC CHECKS

-- Deprecated
function get_bombs()
	return has("sword1") or
	has("sword2") or 
	has("shovel") or 
	(use_seeds() and has("emberseeds")) or
	(use_seeds() and has("scentseeds")) or	
	has("foolsore") or
	has("biggoron_sword")
end

-- Can farm Ore Chunks in Subrosia
function ore_chunks()
	return has("shovel") or 
	has("sword1") or 
	has("bracelet") or
	has("magicboomerang") or
	has("biggoron_sword")
end

-- Saves time on having to check for specific flutes in spots that simply need the flute
function any_flute()
	return moosh() or
	ricky() or
	dimitri()
end

function moosh()
	return has("flute_generic") and has("natzu_moosh")
end
function ricky()
	return has("flute_generic") and has("natzu_ricky")
end
function dimitri()
	return has("flute_generic") and has("natzu_dimitri")
end


-- If you have any season, you have a rod!
function has_rod()
	return has("winter") or
	has("spring") or
	has("summer") or
	has("fall")
end

-- Can the player use a punch ring?
function punch()
	return has("ring_fist") or has("ring_expert")
end

-- Can the player harvest seeds?
-- Dimitri is not globally available for all trees so he's not here
function harvest_seeds()
	return use_seeds() and
	(has("sword") or has_rod() or
	has("foolsore") or punch()) or
	has("biggoron_sword")
end

-- INTERACT RULES

function shoot_seeds()
	return has("slingshot1") or
	has("hss")
end


function use_seeds()
	return has("satchel") or
	shoot_seeds()
end

function destroy_bush()
	return has("sword1") or
	has("magicboomerang") or
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("bracelet") or
	has("bombs") or
	has("biggoron_sword")
end

function destroy_bush_flute()
	return destroy_bush() or any_flute()
end

function destroy_bush_limited()
	return has("bombs")
end

function destroy_pot()
	return has("sword2") or 
	has("bracelet") or
	has("biggoron_sword")
end 

function destroy_mushroom()
	return has("magicboomerang") or 
	has("bracelet") or
	dimitri()
end 

function destroy_flower()
	return has("sword1") or 
	has("magicboomerang") or
	has("biggoron_sword")
end 

function destroy_crystal()
	return has("sword1") or 
	has("bracelet") or
	has("ring_expert") or
	has("biggoron_sword")
end 

function destroy_bush_respawn()
	return has("sword1") or
	has("bombs") or
	has("foolsore") or
	has("biggoron_sword")
end

function hit_lever()
	return has("sword1") or 
	has("shovel") or
	has("foolsore") or
	has("boomerang") or
	has("magicboomerang") or
	has("slingshot1") or
	(has("emberseeds") and use_seeds()) or
	(has("scentseeds") and use_seeds()) or
	punch() or
	has("winter") or
	has("summer") or
	has("fall") or
	has("spring") or
	has("biggoron_sword")
end 

function hit_far_lever()
	return shoot_seeds() or
	has("magicboomerang")
end 

function hit_far_lever_hard()
	return shoot_seeds() or
	has("boomerang") or 
	(max_jump() >= 1 and
	(has("sword1") or any_rod() or has("foolsore")))
end

function hit_switch()
	return has("sword1") or 
	has_rod() or
	has("foolsore") or
	has("boomerang") or
	use_seeds() or
	get_bombs() or
	has("shovel") or
	has("biggoron_sword")
end

function hit_far_switch()
	return has("boomerang") or
	has("bombs") or
	shoot_seeds() or
	(has("sword1") and has("ring_energy"))
end 

function max_jump()
	local j = 0
	
	if (has("cape") and has("satchel") and has("pegasusseeds")) then
		j = 4
	elseif has("cape") then
		j = 3
	elseif (has("feather") and has("satchel") and has("pegasusseeds")) then
		j = 2
	elseif has ("feather") then
		j = 1
	end
	
	return j
end 

function cross_water()
	return has("flippers") or
	max_jump() >= 1
end

function check_hint()
	return use_seeds() and has("mysteryseeds")
end

-- KILL RULES (order of appearance)

-- Generic damage check
function kill_normal()
	return has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("foolsore") or
	has("ring_expert") or
	has("ring_fist") or
	has("biggoron_sword")
end
function kill_keese()
	return has ("$kill_normal") or
	has ("boomerang")
end
function kill_hard()
	if kill_normal() or
		(has("satchel") and has("scentseeds")) or
		(has("satchel") and has("galeseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_stalfos()
	return kill_normal() or 
	has_rod()
end
function kill_stalfos_hard()
	return kill_hard() or 
	has_rod()
end

function kill_goriyabros()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("ring_expert") or
	has("biggoron_sword")
end
function kill_goriyabros_hard()
	if kill_goriyabros() or 
		(has("satchel") and has("scentseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_goriya()
	return kill_normal()
end

function kill_aquamentus()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_aquamentus_hard()
	if kill_aquamentus() or 
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_rope()
	return kill_normal()
end

function kill_hardhat_pit()
	return has("sword1") or 
	has("boomerang") or
	has("shield") or
	has_rod() or
	(shoot_seeds() and (has("galeseeds") or has("scentseeds"))) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_hardhat_pit_hard()
	if kill_hardhat_pit() or
		(has("satchel") and (has("galeseeds") or has("scentseeds"))) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_moblin_pit()
	return has("sword1") or 
	(use_seeds() and has("scentseeds")) or
	(shoot_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("galeseeds")) or
	has("foolsore") or
	(max_jump() >= 1 and kill_normal()) or
	has("biggoron_sword")
end
function kill_moblin_pit_hard()
	if kill_moblin_pit() or
	(max_jump() >= 1 and kill_hard()) or
	punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_zol()
	return kill_normal()
end

function kill_facade()
	return has("bombs")
end

-- REDUNDANT
function kill_dodongo()
	return get_bombs() and
	has("bracelet")
end

function kill_beetle()
	return (shoot_seeds() and has("galeseeds")) or
	((has("shield1") or has("shovel")) and
	(has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	has("biggoron_sword") or
	has("cane") or has("hook1")))
end
function kill_beetle_hard()
	return (use_seeds() and has("galeseeds")) or
	((has("shield1") or has("shovel")) and
	(has("sword1") or 
	(use_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds")) or
	has("cane") or
	(has("satchel") and has("scentseeds")) or
	has("bombs") or has("hook1")))
end

function kill_mimic()
	return kill_normal()
end

function kill_omuai()
	return has("bracelet") and
	(has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore")) or
	has("biggoron_sword")
end
function kill_omuai_hard()
	if kill_omuai() or
		(has("bracelet") and
		has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bracelet") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_mothula()
	return has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_mothula_hard()
	if kill_mothula() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_shroudedstalfos()
	return kill_stalfos()
end

-- redundant?
function kill_likelike()
	return kill_normal() or
	has("bracelet") or
	has_rod()
end

function kill_watertektite()
	return kill_normal()
end

function kill_agunima()
	return use_seeds() and has("emberseeds") and
	(has("sword1") or 
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("ring_expert")) or
	has("biggoron_sword")
end
function kill_agunima_hard()
	if kill_agunima() or
		(has("emberseeds") and 
		((has("satchel") and has("scentseeds")) or
		punch())) then
		return true, AccessibilityLevel.Normal
	elseif has("emberseeds") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

-- redundant
function kill_wizzrobe_cart()
	return kill_normal() or 
	has("shield1") or
	has("shield2") or
	has_rod() or
	has("bracelet") or
	has("biggoron_sword")
end

function kill_gohma()
	return (shoot_seeds() and has("emberseeds")) or
	(shoot_seeds() and has("scentseeds"))
end

function kill_moldorm()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword") or
	(shoot_seeds() and has("scentseeds")) or
	has("ring_expert")
end
function kill_moldorm_hard()
	if kill_moldorm() or
		(has("satchel") and has("scentseeds")) or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

--kill_normal
function kill_ironmask()
	return has("sword1") or
	has("sword2") or
	(use_seeds() and has("emberseeds")) or
	(use_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_ironmask_hard()
	if kill_ironmask() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_armos()
	return has("sword1") or
	has("magicboomerang") or
	(shoot_seeds() and has("scentseeds")) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_armos_hard()
	if kill_armos() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_gibdo()
	return kill_normal() or
	has("magicboomerang") or
	has_rod() or
	has("biggoron_sword")
end
function kill_gibdo_hard()
	return kill_gibdo() or
	kill_hard()
end

function kill_darknut()
	return has("sword1") or
	has("foolsore") or
	(shoot_seeds() and has("scentseeds")) or
	has("biggoron_sword")
end
function kill_lynel()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword") or
	(shoot_seeds() and has("scentseeds"))
end
function kill_darknut_hard()
	if kill_darknut() or
	(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_darknut_pit()
	return kill_darknut() or
	has("shield1")
end
function kill_darknut_pit_hard()
	return kill_darknut_hard() or
	has("shield1")
end

function kill_syger()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword") or
	(shoot_seeds() and has("scentseeds"))
end
function kill_syger_hard()
	if kill_syger() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

--redundant-ish
function kill_digdogger()
	return has("glove")
end

function kill_hardhat_magnet()
	return has("glove") or
	(shoot_seeds() and has("galeseeds"))
end
function kill_hardhat_magnet_hard()
	return has("glove") or
	(use_seeds() and has("galeseeds"))
end

function kill_vire()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert") or
	has("biggoron_sword")
end
function kill_vire_hard()
	if kill_vire() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_manhandla()
	return has("magicboomerang") and
	(has("sword1") or
	shoot_seeds() or
	has("foolsore")) or
	has("biggoron_sword")
end
function kill_manhandla_hard()
	if kill_manhandla() then
		return true, AccessibilityLevel.Normal
	elseif has("magicboomerang") and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_wizzrobe()
	return kill_normal()
end

function kill_keese()
	return kill_normal() or
	has("boomerang")
end

function kill_magunesu()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert") or
	has("biggoron_sword")
end

function kill_poe()
	return has("sword1") or
	(shoot_seeds() and has("scentseeds")) or
	(use_seeds() and has("emberseeds")) or
	has("foolsore") or
	has("biggoron_sword")
end
function kill_poe_hard()
	if kill_poe() or
		(has("satchel") and has("scentseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_darknut_across()
	return (shoot_seeds() and has("scentseeds")) or
	has("magnet") or
	(has("sword1") and has("ring_energy")) or
	(has("cape") and
	kill_darknut_pit())
end
function kill_darknut_across_hard()
	return (shoot_seeds() and has("scentseeds") or
	has("magnet")) or
	(has("cape") and
	kill_darknut_pit_hard())
end

--redundant
function kill_wizzrobe_pit()
	return has("sword1") or
	(has("sword1") and has("ring_energy")) or 
	has("shield1") or
	has("shield2") or
	(use_seeds() and has("scentseeds")) or
	has_rod() or
	get_bombs() or
	has("foolsore") or
	has("biggoron_sword")
end

--redundant
function kill_stalfos_pit()
	return kill_normal() or 
	has("shield1") or
	has("shield2") or
	(use_seeds() and has("scentseeds")) or
	has_rod() or
	get_bombs() or
	has("foolsore") or
	has("biggoron_sword")
end

function kill_gleeok()
	return has("sword1") or
	has("foolsore") or
	has("ring_expert") or
	has("biggoron_sword")
end
function kill_gleeok_hard()
	if kill_gleeok() or
		punch() then
		return true, AccessibilityLevel.Normal
	elseif has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function kill_frypolar()
	return (shoot_seeds() and has("mysteryseeds") and
	has("bracelet")) or
	(shoot_seeds() and has("emberseeds"))
end
function kill_frypolar_hard()
	return kill_frypolar() or
	((has("satchel") and has("mysteryseeds") and
	has("bracelet")) or
	(has("satchel") and has("emberseeds")))
end

--redundant
function kill_polsvoice_pit()
	return has("sword1") or
	has("sword2") or
	has("boomerang") or
	has("magicboomerang") or
	has_rod() or
	(use_seeds() and has("scentseeds")) or
	(use_seeds() and has("galeseeds")) or
	get_bombs() or
	has("shield1") or
	has("shield2") or
	has("foolsore") or
	has("mooshflute") or
	has("rickyflute") or
	has("dimitriflute")  or
	has("biggoron_sword")
end

function kill_medusahead()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword")
end

function kill_floormaster()
	return kill_normal()
end

function kill_onox()
	return has("sword1") and
	max_jump() >= 1
end

-- HORON VILLAGE

function member_shop()
	return has("memberscard")
end

-- NORTH HORON

function north_stump()
	return destroy_bush_flute()
end

function enter_d1()
	return has("d1key") and north_stump()
	--(south_swamp() and (has("flippers") or dimitri())) 
end


function wet_lake()
	return has("defaultseasonson") or has("north_winter") or has("north_spring") or has("north_fall") or
	has("winter") or has("spring") or has("fall")
end

function d5_stump_d1()
	return (north_stump() and
	(max_jump() >= 1 or ricky() or moosh()) and
	(has("winter") or has("north_winter") or has("defaultseasonson") or
	has("flippers") or (dimitri()) and has("bracelet")))
end

function d5_stump()
	return d5_stump_d1() 
end

function enter_d5()
	return d5_stump() and
	(destroy_mushroom() or dimitri()) and
	(has("fall") or 
	(has("north_fall") and (has("flippers") or (dimitri() and has("bracelet")) or (has("winter") and dimitri())) or 
	(has("winter") and has("fall") and (max_jump() >= 1 or ricky() or moosh()))))
end

-- WESTERN COAST

function pirate_ship()
	return has("polishedbell")
	and pirate_house()
end
function pirate_ship_hard()
	return has("polishedbell")
	and pirate_house_hard()
end

function graveyard()
	return pirate_ship() and
	(max_jump() >= 2 or
	has("coast_summer") or
	(has("bombs") and max_jump() >= 1 and has("summer")))
end
function graveyard_hard()
	return pirate_ship_hard() and
	coast_to_D7_hard()
end

function coast_to_D7()
	return has("coast_summer") or
		(has("bombs") and max_jump() >= 1 and has("summer")) or
		(max_jump() >= 2 and
		((has("coast_winter") and has("shovel")) or 
		((has("defaultseasonson") and has("shovel")) or 
		has("coast_spring") or has("coast_fall"))))
end
function coast_to_D7_hard()
	return has("coast_summer") or
	(has("bombs") and has("summer")) or
	(max_jump() >= 2 and
	(has("coast_winter") and has("shovel")) or 
	has("coast_spring") or has("coast_fall"))
end


-- SUBURBS + WOODS OF WINTER

function village_to_suburbs()
	return use_seeds() and has("emberseeds")
end

function suburbs_to_fountain()
	return cross_water() or
	dimitri() or ricky() or
	has("suburbs_winter") or has("winter")
end

function fountain_to_WoW()
	return has("winter") or
	has("suburbs_winter")
end

function fountain_to_D2()
	return max_jump() >= 1 or
	has("shovel") or any_flute() or
	has("spring") or has("summer") or has("fall") or
	(has("flippers") and (has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or has ("defaultseasonson")))
end
function enter_d2()
	return (village_to_suburbs() and suburbs_to_fountain() and fountain_to_D2 and open_d2()) or
	(scent_tree() and cross_natzu() and fountain_to_D2() and open_d2())
end
function d2_A()
	return destroy_bush_flute()
end
function d2_B()
	return has("bracelet") and
	(has("wow_summer") or has ("defaultseasonson") or ricky())
end

function open_d2()
	return d2_A() or d2_B()
end

function plain_natzu_suburbs()
	return scent_tree() and
	(cross_natzu() or (natzu_to_moblin() and moblin_keep_to_sunken())) and
	natzu_to_suburbs()
end


function suburbs()
	return (use_seeds() and has("emberseeds")) or 
	suburbs_swamp() or
	suburbs_lake() or
	suburbs_temple() or
	suburbs_hns() or
	--suburbs_sunken() or NOT BLOCKED BY SPRING ANYMORE
	suburbs_natzu()
end
function suburbs_hard()
	return (use_seeds() and has("emberseeds")) or 
	suburbs_swamp() or
	suburbs_lake() or
	suburbs_temple_hard() or
	suburbs_hns_hard() or
	--suburbs_sunken() or NOT BLOCKED BY SPRING ANYMORE
	suburbs_natzu()
end



function suburbs_swamp()
--portal_swamp() doesn't work? TODO
	return has("bracelet") and --bracelet is needed no matter what
	--getting to the swamp portal 
	(((ricky() or moosh() or --having either of these animals leads to the pegasus tree
	((max_jump() >= 1 or has("plain_winter"))) and  --get to the plain stump
	(has("summer") or has("plain_summer") or max_jump() >= 3)) and --climb up to pegasus tree
	hit_lever() and --drain the way
	((use_seeds() and has("pegasusseeds")) or max_jump() >= 3) and --cross to floodgate keyhole
	has("d3key") and --drain the swamp
	(any_flute() or max_jump() >= 2)) or --get to the portal
	has("flippers") or dimitri()) and --no matter what, swimming makes the portal accessible
	--getting to the portal from subrosia
	(max_jump() >= 1 or has("ribbon"))--cross from beach to temple
end

function suburbs_lake()
	return portal_lake() and
	--getting to the portal from subrosia
	(max_jump() >= 3 or (max_jump() >= 1 and (has("magnet") or has("bracelet")))) --jump past furnace
end

function suburbs_temple()
	return has("bracelet") and
	max_jump() >= 3 and --need a long jump no matter what
	portal_remains()
end
function suburbs_temple_hard()
	return has("bracelet") and
	max_jump() >= 3 and --need a long jump no matter what
	portal_remains_hard()
end

function suburbs_hns()
	return (portal_village() or --can go through pirates with this
	(destroy_bush_flute() and 
	has("bracelet") and has("shovel") and --otherwise, through mountain portal
	(has("flippers") or dimitri() or max_jump() >= 4))) and
	max_jump() >= 1 and hns_to_beach()
end
function suburbs_hns_hard()
	return (portal_village_hard() or --can go through pirates with this
	(destroy_bush_flute() and 
	has("bracelet") and has("shovel") and --otherwise, through mountain portal
	(has("flippers") or dimitri() or max_jump() >= 4))) and
	max_jump() >= 1 and hns_to_beach_hard()
end

function suburbs_natzu()
	return fairy_fountain_natzu() and
	(max_jump() >= 1 or has("flippers") 
	or has("winter") or has("suburbs_winter") 
	or dimitri() or ricky())--cross the water to the south
end

function fairy_fountain()
	return village_to_suburbs() and suburbs_to_fountain()
end
function fairy_fountain_hard()
	return suburbs_hard() and
	(has("suburbs_winter") or has("winter") or 
	cross_water() or dimitri() or ricky())
end

function fairy_fountain_natzu()
	return north_stump() and has("bracelet") and
	--cross natzu
	((has("natzu_dimitri") and (dimitri() or has("flippers")) and max_jump() >= 1) or --cross dimitri's natzu
	(has("natzu_moosh") and (moosh() or (destroy_bush_flute() and max_jump() >= 3))) or --crosh Moosh's natzu
	(has("natzu_ricky") and ricky()))--cross ricky's natzu
end
function fairy_fountain_natzu_hard()
	return north_stump() and has("bracelet") and
	--cross natzu
	((has("natzu_dimitri") and (dimitri() or has("flippers")) and max_jump() >= 1) or --cross dimitri's natzu
	(has("natzu_moosh") and (moosh() or 
	((has("magicboomerang") or destroy_bush_flute()) and 
	max_jump() >= 2))) or --cross Moosh's natzu
	(has("natzu_ricky") and ricky()))--cross ricky's natzu
end

function mystery_tree()
	return (fairy_fountain() or (fairy_fountain_natzu() and has("satchel") and has("galeseeds"))) and
	(max_jump() >= 1 or (cross_water() or ricky() or dimitri()) or--feather gives access no matter the season
	((has("suburbs_winter") or has("winter")) and
	(has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall") or has ("defaultseasonson")))
end
function mystery_tree_hard()
	return (fairy_fountain_hard() or (fairy_fountain_natzu_hard() and has("satchel") and has("galeseeds"))) and
	(max_jump() >= 1 or (cross_water() or ricky() or dimitri()) or--feather gives access no matter the season
	((has("suburbs_winter") or has("winter")) and
	(has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall") or has ("defaultseasonson")))
end

function mystery_tree_natzu()
	return fairy_fountain_natzu() and
	(max_jump() >= 1 or --feather gives access no matter the season
	((has("suburbs_winter") or has("winter")) and
	(has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall") or has ("defaultseasonson")))
end
function mystery_tree_natzu_hard()
	return fairy_fountain_natzu_hard() and
	(max_jump() >= 1 or --feather gives access no matter the season
	((has("suburbs_winter") or has("winter")) and
	(has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall") or has ("defaultseasonson")))
end

function fountain_to_mysterytree()
	return (max_jump() >= 1 or ricky() or moosh()) or
	((has("suburbs_winter") or has("winter")) and
	(has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall") or has ("defaultseasonson"))
end

function d2_mushrooms()
	return destroy_mushroom() and
	(has("wow_fall") or 
	((d2_B() or (d2_A() and use_seeds() and has("emberseeds") and has("bracelet")) 
	or ricky() or has("wow_summer") or has ("defaultseasonson")) and has("fall"))) and
	(max_jump() >= 3 or has("glove"))
end
function d2_mushrooms_hard()
	return destroy_mushroom() and
	(has("wow_fall") or 
	(d2_B_hard() or ricky() or has("wow_summer")) and has("fall")) and
	((max_jump() >= 2 and has("bombs")) or has("glove"))
end


function enter_d2_hard()
	return d2_A_hard() or d2_B_hard()
end

-- HOLODRUM PLAIN

function scent_tree()
	return scent_normal() or
	scent_suburbs()
end
function scent_tree_hard()
	return scent_normal() or
	scent_suburbs_hard()
end

function scent_normal()
	return north_stump() and
	(has("bracelet") or has("flippers") or dimitri())
end

function scent_suburbs()
	--only path that doesn't require any of the above items
	return village_to_suburbs() and
	suburbs_to_fountain() and
	(has("spring") or has("suburbs_spring")) and--climb up to natzu area
	cross_natzu()
end
function scent_suburbs_hard()
	--only path that doesn't require any of the above items
	return village_to_suburbs() and
	suburbs_to_fountain() and
	(has("spring") or has("suburbs_spring")) and--climb up to natzu area
	cross_natzu_hard()
end

function plain_stump()
	return plain_stump_scent() or
	plain_stump_north()
end
function plain_stump_hard()
	return plain_stump_scent_hard() or
	plain_stump_north()
end

function plain_stump_scent()
	return scent_tree() and
	((max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or--get over holes
	((has("flippers") or dimitri()) and destroy_bush_flute())) --swim around
end
function plain_stump_scent_hard()
	return scent_tree_hard() and
	((max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or--get over holes
	((has("flippers") or dimitri()) and destroy_bush_flute())) --swim around
end

function plain_stump_north()
	return north_stump() and
	(has("flippers") or dimitri()) and destroy_bush_flute() --swim around
end



-- SPOOL SWAMP

function pegasus_tree()
	return plain_stump() and
	(has("plain_summer") or has("summer") or has("cape") or ricky() or moosh())
end
function pegasus_tree_hard()
	return plain_stump_hard() and
	(has("plain_summer") or has("summer") or has("cape") or ricky() or moosh())
end

function swamp_stump()
	return pegasus_tree() and
	(has("bracelet") or hit_lever()) and
	((has("satchel") and has("pegasusseeds")) or has("flippers") or has("cape") or
	(has("bombs") and max_jump() >= 2)) and
	has("bracelet") and has("d3key")
end
function swamp_stump_hard()
	return pegasus_tree_hard() and
	(has("bracelet") or hit_lever()) and
	((has("satchel") and has("pegasusseeds")) or has("flippers") or has("cape") or
	(has("bombs") and max_jump() >= 2)) and
	has("bracelet") and has("d3key")
end

function dry_swamp()
	return has("swamp_summer") or has("swamp_winter") or has("swamp_fall") or has("defaultseasonson") or
	(swamp_stump() and (has("summer") or has("winter") or has("fall")))
end
function dry_swamp_hard()
	return has("swamp_summer") or has("swamp_winter") or has("swamp_fall") or
	(swamp_stump_hard() and (has("summer") or has("winter") or has("fall")))
end

function south_swamp()
	return south_swamp_stump() or
	south_swamp_scent() or
	south_swamp_suburbs() or
	south_swamp_pirates()
end
function south_swamp_hard()
	return south_swamp_stump_hard() or
	south_swamp_scent_hard() or
	south_swamp_suburbs_hard() or
	south_swamp_pirates()
end

function south_swamp_stump()
	return swamp_stump() and
	(has("flippers") or dimitri() or --go through the water
	(dry_swamp() and (max_jump() >= 2 or any_flute()))) --go through other flute spots
end
function south_swamp_stump_hard()
	return swamp_stump_hard() and
	(has("flippers") or dimitri() or --go through the water
	(dry_swamp_hard() and (max_jump() >= 2 or any_flute()))) --go through other flute spots
end

function south_swamp_scent()
	return plain_stump() and
	(has("flippers") or dimitri())
end
function south_swamp_scent_hard()
	return plain_stump_hard() and
	(has("flippers") or dimitri())
end

function south_swamp_suburbs()
	return village_to_suburbs() and destroy_bush_flute() and --get to rosa portal
	max_jump() >= 1 and has("bracelet") --get to the beach portal and lift rock
end
function south_swamp_suburbs_hard()
	return village_to_suburbs() and destroy_bush_flute() and --get to rosa portal
	max_jump() >= 1 and has("bracelet") --get to the beach portal and lift rock
end

function south_swamp_pirates()
	return has("bracelet") and has("magicboomerang") and --get to pirate portal
	max_jump() >= 1 and --jump to hns area
	--get to beach area
	(max_jump() >= 4 or--from bridge
	(max_jump() >= 2 or (max_jump() >= 1 and has("magnet"))))--through shortcut
end
function south_swamp_pirates_hard()
	return has("bracelet") and (has("magicboomerang") or max_jump() >= 4) and --get to pirate portal
	max_jump() >= 1 and --jump to hns area
	--get to beach area
	(max_jump() >= 4 or--from bridge
	(max_jump() >= 2 or (max_jump() >= 1 and has("magnet"))))--through shortcut
end

function enter_d3()
	return swamp_stump() and (has("summer") or has("swamp_summer"))
end
function enter_d3_hard()
	return swamp_stump_hard() and (has("summer") or has("swamp_summer"))
end

-- NATZU

function cross_natzu()
	return ricky() or
	(has("natzu_dimitri") and (dimitri() or has("flippers")) and max_jump() >= 1 ) or
	(has("natzu_moosh") and (moosh() or (destroy_bush() and max_jump() >= 2)))
end
function cross_natzu_hard()
	return ricky() or
	(has("natzu_dimitri") and (dimitri() or has("flippers")) and max_jump() >= 1 ) or
	(has("natzu_moosh") and (moosh() or (destroy_bush() and (max_jump() >= 2 or (max_jump() >= 1 and has("bombs"))))))
end

function natzu_to_moblin()
	if ricky() or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or max_jump() >= 2)) then
		if has("flippers") or max_jump() >= 4 then
			return true, AccessibilityLevel.Normal
		elseif (max_jump() >= 3 and has("bombs")) then
			return true, AccessibilityLevel.SequenceBreak
		else
			return false, AccessibilityLevel.None
		end
	else
		return false, AccessibilityLevel.None
	end			
end
function natzu_to_moblin_hard()
	return (ricky() or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or max_jump() >= 1))) and 
	(has("flippers") or max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))
end

function sunken_to_moblin()
	if has("natzu_ricky") or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or max_jump() >= 2)) then
		if has("flippers") or max_jump() >= 4 then
			return true, AccessibilityLevel.Normal
		elseif (max_jump() >= 3 and has("bombs")) then
			return true, AccessibilityLevel.SequenceBreak
		else
			return false, AccessibilityLevel.None
		end
	else
		return false, AccessibilityLevel.None
	end			
end
function sunken_to_moblin_hard()
	return (has("natzu_ricky") or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or max_jump() >= 1))) and 
	(has("flippers") or max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))
end

function moblin_keep_to_sunken()
	if has("satchel") and has("galeseeds") then
		return true, AccessibilityLevel.Normal
	else
		return true, AccessibilityLevel.SequenceBreak
	end
	
	return AccessibilityLevel.None
end

function natzu_to_suburbs()
	if (has("spring") or has("suburbs_spring") or
		(has("satchel") and has("galeseeds"))) then
		return true, AccessibilityLevel.Normal
	elseif has("treewarp") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

-- SUNKEN CITY

function sunken_city()
	return (cross_water() or dimitri() or has("sunken_winter")) and
	(sunken_suburbs() or
	sunken_natzu() or
	sunken_mountain() or
	sunken_pirates() or
	sunken_rosa() or
	sunken_lake() or
	sunken_swamp() or
	sunken_temple())
end
function sunken_city_hard()
	return cross_water() and
	sunken_suburbs() --or
	--sunken_natzu_hard() or
	--sunken_mountain_hard() or
	--sunken_pirates() or
	--sunken_rosa() or
	--sunken_lake() or
	--sunken_swamp() or
	--sunken_temple_hard())
end

function sunken_natzu()
	return scent_tree() and
	--cross natzu
	cross_natzu() --or (natzu_to_moblin() and moblin_keep_to_sunken())
end
function sunken_natzu_hard()
	return scent_tree_hard() and
	--cross natzu
	cross_natzu_hard() or (natzu_to_moblin_hard() and moblin_keep_to_sunken())
end

function sunken_suburbs()
	return suburbs() and
	suburbs_to_fountain() and
	(has("spring") or has("suburbs_spring")) --has to be spring
end

function sunken_mountain()
	return scent_tree() and
	(has("flippers") or max_jump() >= 4) and --get to goron cave
	has("bracelet") and has("shovel") and --get to cucco mountain
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers")--go through tunnel
end
function sunken_mountain_hard()
	return scent_tree_hard() and
	(has("flippers") or max_jump() >= 4) and --get to goron cave
	has("bracelet") and has("shovel") and --get to cucco mountain
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers")--go through tunnel
end

function sunken_pirates()
	return (has("magicboomerang") or max_jump() >= 4) and --get to pirate portal
	max_jump() >= 1 and--get to hns area
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers")--go through tunnel
end

function sunken_rosa()
	return suburbs() and destroy_bush_flute() and --get to rosa portal
	max_jump() >= 4 and --get to hns area
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers")--go through tunnel
end

function sunken_lake()
	return north_stump() and max_jump() >= 4 and (has("winter") or has("north_winter")) and --get to lake portal without any flute
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers") --go through tunnel
end

function sunken_swamp()
	return south_swamp() and has("bracelet") and --get to swamp portal
	max_jump() >= 4 and --get to hns area
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers") --go through tunnel
end

function sunken_temple()
	return scent_tree() and max_jump() >= 4 and --get to temple remains
	--getting to the temple portal
	((has("fall") and has("winter")) or--general check no matter the season
	(has("temple_winter") or has("defaultseasonson") and has("shovel")) or --what to do in winter
	(has("temple_spring") and destroy_flower() and has("winter")) or --what to do in spring
	(has("temple_summer") and has("winter")) or --what to do in summer
	(has("temple_fall") and has("winter"))) and --what to do in autumn
	
	(has("summer") or has("sunken_summer") or has("defaultseasonson")) and --summer requirement of rando
	has("flippers") --go through tunnel
end
function sunken_temple_hard()
	return scent_tree_hard() and max_jump() >= 4 and --get to temple remains
	--getting to the temple portal
	((has("fall") and has("winter")) or--general check no matter the season
	(has("temple_winter") and has("shovel")) or --what to do in winter
	(has("temple_spring") and destroy_flower() and has("winter")) or --what to do in spring
	(has("temple_summer") and has("winter")) or --what to do in summer
	(has("temple_fall") and has("winter"))) and --what to do in autumn
	
	(has("summer") or has("sunken_summer")) and --summer requirement of rando
	has("flippers") --go through tunnel
end

function gale_tree()
	return sunken_city() and
	(has("flippers") or max_jump() >= 1 or has("sunken_winter"))
end

function dimitri_rescue()
	return gale_tree() and has("bombs")
end
function waterfalls()
	return dimitri() or has("bombs")
end

function sunken_to_cucco()
	return (has("summer") or has("sunken_summer") or has ("defaultseasonson")) and
	has("flippers")
end

function sunken_to_wow()
	if has("spring") or has("summer") or has("fall") or
		has("sunken_spring") or has("sunken_summer") or has ("defaultseasonson") or has("sunken_fall") then
		if ((has("winter") or has("suburbs_winter")) and
				(has("spring") or has("suburbs_spring"))) or
			(has("satchel") and has("galeseeds")) then
			return true, AccessibilityLevel.Normal
		elseif has("treewarp") then
			return true, AccessibilityLevel.SequenceBreak
		else
			return false, AccessibilityLevel.None
		end
	else
		return false, AccessibilityLevel.None
	end
end

-- MOUNT CUCCO

function mount_cucco()
	return cucco_goron() or
	cucco_pirates() or
	cucco_summer() 
	
end
function mount_cucco_hard()
	return cucco_goron_hard() or
	cucco_pirates() or
	cucco_summer() or
	cucco_temple_hard()
	
end

function cucco_to_sunken()
	if has("sunken_summer") or has("summer") or has ("defaultseasonson") or
	(has("satchel") and has("galeseeds")) then
		return true, AccessibilityLevel.Normal
	elseif has("treewarp") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function cucco_summer()
	return sunken_city() and has("flippers") and (has("sunken_summer") or has("summer")or has ("defaultseasonson"))
end

function cucco_goron()
	return scent_tree() and
	(has("flippers") or max_jump() >= 4) and has("bracelet") and has("shovel")
end
function cucco_goron_hard()
	return scent_tree_hard() and
	(has("flippers") or max_jump() >= 4) and --get to goron cave
	has("bracelet") and has("shovel")
end


function cucco_pirates()
	return (has("magicboomerang") or max_jump() >= 4) and --get to pirate portal
	max_jump() >= 1
end

function cucco_temple_hard()
	return temple_hard() and temple_to_hns_hard()
end

function talon_cave()
	return mount_cucco() and 
	(has("sunken_spring") or has("spring"))
end
function talon_cave_hard()
	return mount_cucco_hard() and 
	(has("sunken_spring") or has("spring"))
end

function enter_d4()
	return talon_cave() and has("winter") and
	max_jump() >= 1 and has("bracelet") and
	has("d4key") and has("summer")
end
function enter_d4_hard()
	return talon_cave_hard() and has("winter") and
	max_jump() >= 1 and has("bracelet") and
	has("d4key") and has("summer")
end

-- GORON MOUNTAIN

function goron_mountain()
	return (mount_cucco() and (has("shovel") or has("banana")) and has("bracelet")) or
	(scent_tree() and has("flippers")) or
	(temple_remains() and max_jump() >= 2 and (has("flippers") or max_jump() >= 4))
end
function goron_mountain_hard()
	return --(mount_cucco_hard() and (has("shovel") or has("banana")) and has("bracelet")) or
	--(scent_tree_hard() and has("flippers")) or
	(temple_remains() and max_jump() >= 2 and (has("flippers") or 
	(max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))))
end

-- TARM RUINS

function tarm_ruins()
	return pegasus_tree() and
	has("squarejewel") and has("roundjewel") and has("pyramidjewel") and has("xjewel")
end
function tarm_ruins_hard()
	return pegasus_tree_hard() and
	has("squarejewel") and has("roundjewel") and has("pyramidjewel") and has("xjewel")
end

function tarm_tree()
	return tarm_ruins() and destroy_mushroom() and
	has("winter") and has("spring") and has("summer") and has("fall")
end
function tarm_tree_hard()
	return tarm_ruins_hard() and destroy_mushroom() and
	has("winter") and has("spring") and has("summer") and has("fall")
end

function enter_d6()
	return tarm_tree() and destroy_flower() and (has("shovel") or (use_seeds() and has("emberseeds")))
end
function enter_d6_hard()
	return tarm_tree_hard() and destroy_flower() and (has("shovel") or (use_seeds() and has("emberseeds")))
end
function enter_d7()
	return graveyard()
end
function enter_d7_hard()
	return graveyard_hard()
end
function enter_d8()
	return scent_tree() and enter_remains() and
	portal_remains() and has("bombs") and portal_d8()
end
function enter_d8_hard()
	return scent_tree() and enter_remains_hard() and
	portal_remains_hard() and has("bombs") and portal_d8_hard()
end



-- SAMASA DESERT

function desert()
	return suburbs() and 
	pirate_house() 
end
function desert_hard()
	return suburbs_hard() and 
	pirate_house_hard() 
end

-- TEMPLE REMAINS

function temple_remains()
	return scent_tree() and max_jump() >= 2 
	--goron mountain way requires bracelet and jump so this is essentially the same as counting for both
end
function temple_remains_hard()
	return scent_tree_hard() and max_jump() >= 2 
	--goron mountain way requires bracelet and jump so this is essentially the same as counting for both
end

function enter_remains()
	if max_jump() >= 2 then
		return true, AccessibilityLevel.Normal
	elseif max_jump() >= 1 and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
function enter_remains_hard()
	return max_jump() >= 2 or (max_jump() >= 1 and has("bombs"))
end


-- SUBROSIA LOCATIONS

function temple()
	return portal_rosa() or --normal way
	(portal_swamp() and temple_to_beach()) or --through beach
	((portal_mountain() or portal_village()) and --through hns
	((hns_to_beach() and temple_to_beach()) or temple_to_hns())) or 
	(portal_lake() and max_jump() >= 1 and furnace_to_beach()) or--through furnace
	(portal_remains() and remains_to_temple()) --through remains
end
function temple_hard()
	return portal_rosa() or --normal way
	(portal_swamp() and temple_to_beach()) or --through beach
	((portal_mountain() or portal_village_hard()) and --through hns
	((hns_to_beach_hard() and temple_to_beach()) or temple_to_hns_hard())) or 
	(portal_lake() and max_jump() >= 1 and furnace_to_beach_hard()) or--through furnace
	(portal_remains() and remains_to_temple_hard()) --through remains
end

function beach()
	return portal_swamp() or
	(portal_rosa() and temple_to_beach()) --through temple
	
	-- or (hns() and max_jump() >= 2 and has("bracelet")) or 
	-- or (hns() and max_jump() >= 1 and has("bracelet") and has("glove")) or 
	-- or (furnace() and max_jump() >= 1 and has("bracelet")) or 
	-- or (furnace() and max_jump() >= 3) or 
	-- or (furnace() and max_jump() >= 1 and has("glove")) or 
end

--redundant?
function beach_hard()
	return portal_swamp() or
	(temple() and max_jump() >= 1) or
	((portal_mountain() or portal_village()) and
	max_jump() >= 1 and has("bracelet") and 
	(max_jump() >= 2 or has("magnet") or has("bombs")))
end



function hns()
	return ((portal_mountain() or portal_village()) and max_jump() >= 1) or -- normal way
	(temple_to_hns() and 
	(portal_rosa() or (portal_remains() and remains_to_temple())))  --from temple->bridge->hns
end
function hns_hard()
	return ((portal_mountain() or portal_village()) and max_jump() >= 1) or -- normal way
	(temple_to_hns_hard() and 
	(portal_rosa() or (portal_remains() and remains_to_temple_hard())))  --from temple->bridge->hns
end



function pirate_house()
	return portal_village() or (hns() and max_jump() >= 1)
end
function pirate_house_hard()
	return portal_village_hard() or (hns() and max_jump() >= 1)
end


function furnace()
	return portal_lake() or
	(beach() and beach_to_furnace())
end
function furnace_hard()
	return portal_lake() or
	(beach() and beach_to_furnace_hard())
end

function bridge()
	return (temple() and temple_to_bridge()) or
	(portal_remains() and remains_to_temple()) or
	(hns() and temple_to_hns())
end
function bridge_hard()
	return (temple() and temple_to_bridge()) or
	(portal_remains() and remains_to_temple_hard()) or
	(hns() and temple_to_hns_hard())
end

-- SUBROSIA NAVIGATION

function temple_to_beach()
	return max_jump() >= 1 or
	(portal_swamp() and has("ribbon"))
end

function temple_to_hns()
	return max_jump() >= 4
end
function temple_to_hns_hard()
	return max_jump() >= 3 and 
	has("bombs")
end

function temple_to_bridge()
	return max_jump() >= 1
end

function beach_to_furnace()
	if max_jump() >= 3 or
		has("magnet") then
		return true, AccessibilityLevel.Normal
	elseif max_jump() >= 2 and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
function beach_to_furnace_hard()
	if max_jump() >= 3 or has("magnet") or
	(max_jump() >= 2 and has("bombs")) then
		return true, AccessibilityLevel.Normal
	elseif max_jump() >= 2 then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end

function hns_to_pirates()
	return max_jump() >= 1
end

function hns_to_beach()
	if has("bracelet") and max_jump() >= 1 and
		(max_jump() >= 2 or has("magnet")) then
		return true, AccessibilityLevel.Normal
	elseif has("bracelet") and max_jump() >= 1 and
		(max_jump() >= 2 or has("magnet") or has("bombs")) then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
function hns_to_beach_hard()
	return has("bracelet") and max_jump() >= 1 and
	(max_jump() >= 2 or has("magnet") or has("bombs"))
end


function furnace_to_beach()
	if max_jump() >= 3 or
		((has("magnet") or has("bracelet")) 
			and max_jump() >= 1) then
		return true, AccessibilityLevel.Normal
	elseif max_jump() >= 2 then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
function furnace_to_beach_hard()
	return max_jump() >= 2 or
	((has("magnet") or has("bracelet")) and max_jump() >= 1)
end

function remains_to_temple()
	if has("bracelet") and max_jump() >= 3 then
		return true, AccessibilityLevel.Normal
	elseif has("bracelet") and
		max_jump() >= 2 and has("bombs") then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end
end
function remains_to_temple_hard()
	return has("bracelet") and
	max_jump() >= 2 and has("bombs")
end

-- PORTALS

function portal_rosa()
	return (suburbs() and (destroy_bush() or any_flute()))
	-- or temple() 
end

function portal_swamp()
	return south_swamp() and has("bracelet") and
	(any_flute() or has("swamp_summer") or has("swamp_fall") or has("defaultseasonson") or
	(swamp_stump() and (has("summer") or has("fall"))) or
	(has("shovel") and (has("swamp_winter") or (swamp_stump() and has("winter")))) or
	(destroy_flower() and (has("swamp_spring") or (swamp_stump() and has("spring")))))
	-- or beach() 
end

function portal_mountain()
	return max_jump() >= 1 and mount_cucco()
end

function portal_lake()
	return north_stump() and
		((wet_lake() and (max_jump() >= 1 or ricky() or moosh()) and
		(has("flippers") or (dimitri() and has("bracelet")))) or
		(max_jump() >= 4 and (has("north_winter") or has("winter") or has ("defaultseasonson"))))
end
function portal_lake_hard()
	return north_stump() and
	((wet_lake() and (max_jump() >= 1 or ricky() or moosh()) and
	(has("flippers") or (dimitri() and has("bracelet")))) or
	((max_jump() >= 4 or (max_jump() >= 3 and has("bombs"))) and 
	(has("north_winter") or has("winter") or has("defaultseasonson"))))
end
	
function portal_village()
	return has("magicboomerang")
end
function portal_village_hard()
	return has("magicboomerang") or
	max_jump() >= 4
	-- or (pirate_house() and hit_lever()) 
end

function portal_remains()
	if destroy_bush() and
		max_jump() >= 1 and has("winter") and
		(has("temple_fall") or has("fall")) then
		return true, AccessibilityLevel.Normal
	elseif (has("temple_winter") or has("winter") or has("defaultseasonson")) and
		((has("shovel") and destroy_bush() and max_jump() >= 4) or
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and max_jump() >= 4 and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and max_jump() >= 4 and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))) then
		return true, AccessibilityLevel.SequenceBreak
	else
		return false, AccessibilityLevel.None
	end	
end
function portal_remains_hard()
	return (has("temple_winter") or has("winter") or has("defaultseasonson")) and
	((has("shovel") and destroy_bush() and max_jump() >= 4) or --what to do in winter
	((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and max_jump() >= 4 and has("winter")) or --what to do in spring
	((has("temple_summer") or has("summer")) and destroy_bush() and max_jump() >= 4 and has("winter")) or --what to do in summer
	((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))) --what to do in autumn
end

function portal_d8()
	if has("temple_summer") or has("summer") then
		if max_jump() >= 4 or 
			(max_jump() >= 2 and has("glove")) then
			return true, AccessibilityLevel.Normal
		elseif max_jump() >= 1 and has("bombs") then
			return true, AccessibilityLevel.SequenceBreak
		else
			return false, AccessibilityLevel.None
		end
	else
		return false, AccessibilityLevel.None
	end
end
function portal_d8_hard()
	return (has("temple_summer") or has("summer")) and
	(((max_jump() >= 2 or (max_jump() >= 1 and has("bombs"))) and has("glove")) or max_jump() >= 4)
end



-- SPECIAL LOCATIONS THAT CAN BE SEQUENCE BROKEN INTO --

function moblin_road_chest()
	return destroy_bush() and (ricky() or has("bombs")) and --open the cave and the chest
	(has("wow_spring") or has("wow_summr") or has ("defaultseasonson") or has("wow_fall") or --the cave isn't blocked by winter blocks
	has("spring") or has("summer") or has("fall")) --alternatively, the player can change to a season that isn't winter
end
--]]



-- FULL CLEAR CHECKS --

function d1clear()
	return use_seeds() and has("emberseeds") and 
	has("bombs") and kill_goriyabros() and kill_aquamentus()
end
function d1clear_hard()
	return use_seeds() and has("emberseeds") and 
	has("bombs")
end

function d2clear()
	return use_seeds() and has("emberseeds") and 
	has("bracelet") and has("bombs")
end
function d2clear_hard()
	return use_seeds() and (has("emberseeds") or has("mysteryseeds")) and 
	has("bracelet") and has("bombs")
end

function d3clear()
	return kill_beetle() and max_jump() >= 1 and 
	has("bombs") and has("bracelet") and 
	kill_omuai() and kill_mothula()
end
function d3clear_hard()
	return kill_beetle_hard() and max_jump() >= 1 and 
	has("bombs") and has("bracelet") and 
	kill_omuai_hard() and kill_mothula_hard()
end

function d4clear()
	return has("flippers") and destroy_pot() and 
	has("bombs") and max_jump() >= 1 and 
	shoot_seeds() and has("emberseeds") and 
	kill_agunima() and kill_gohma()
end
function d4clear_hard()
	return has("flippers") and destroy_pot() and 
	has("bombs") and max_jump() >= 1 and 
	shoot_seeds() and has("emberseeds") and 
	kill_agunima_hard() and kill_gohma()
end

function d5clear()
	return has("magnet") and kill_syger() and 
	max_jump() >= 1 and (max_jump() >= 4 or has("flippers"))
end
function d5clear_hard()
	return has("magnet") and kill_syger_hard() and 
	max_jump() >= 1 and
	(max_jump() >= 3 or has("flippers"))
end

function d6clear()
	return has("magnet") and max_jump() >= 1 and
	has("bombs") and has("magicboomerang") and
	shoot_seeds() and has("emberseeds") and destroy_crystal() and
	kill_vire() and kill_manhandla()
end
function d6clear_hard()
	return has("magnet") and max_jump() >= 1 and
	has("bombs") and has("magicboomerang") and
	shoot_seeds() and has("emberseeds") and destroy_crystal() and
	kill_vire_hard() and kill_manhandla_hard()
end

function d7clear()
	return max_jump() >= 3 and has("bombs") and has("bracelet") and
	has("satchel") and has("pegasusseeds") and
	shoot_seeds() and has("emberseeds") and has("magnet") and
	has("flippers") and kill_magunesu() and
	kill_poe() and kill_gleeok()
end
function d7clear_hard()
	return max_jump() >= 2 and has("bombs") and has("bracelet") and
	use_seeds() and has("emberseeds") and has("magnet") and
	has("flippers") and kill_magunesu() and
	kill_poe_hard() and kill_gleeok_hard()
end

function d8clear()
	return has("slingshot2") and max_jump() >= 3 and
	has("magnet") and has("bombs") and
	has("emberseeds") and has("bracelet") and kill_magunesu() and
	(has("magicboomerang") or max_jump() >= 4) and kill_polsvoice_pit() and 
	kill_frypolar() and kill_medusahead() 
end
function d8clear_hard()
	return has("slingshot2") and max_jump() >= 2 and 
	has("magnet") and has("bombs") and
	has("emberseeds") and has("bracelet") and
	kill_polsvoice_pit() and kill_magunesu() and
	kill_frypolar_hard() and kill_medusahead() 
end
function has(item, amount)
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	if not amount then
	  return count > 0
	else
	  return count == amount
	end
end