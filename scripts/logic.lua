function has(item)
  return Tracker:ProviderCountForCode(item) == 1
end

-- WEIRD LOGIC CHECKS

-- Deprecated
function get_bombs()
	return sword_kill() or
	
	has ("casual") and has("shovel") or

	has ((("medium") or has("hard")) and 
		has("shovel") or 
		(use_seeds() and has("emberseeds")) or
		(use_seeds() and has("scentseeds")))
end

function destroy_signs()
	return has("bracelet") or
	has("sword2") or 
	has("biggoron_sword")
end

function bombs()
	return ricky() or has("bombs")
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
	return use_seeds() and sword_kill_punch()
end

function harvest_seeds_dimitri()
	return use_seeds() and
	(dimitri() or sword_kill_punch())
end

function harvest_cucco_tree()
	return has("sword1") or has("biggoron_sword") or has("foolsore")
end
-- INTERACT RULES

function shoot_seeds()
	return has("slingshot1") or
	has("hss")
end


function use_seeds()
	return has("satchel1") or
	shoot_seeds()
end

function shoot_seeds_combat()
	return has("satchel2") and
	shoot_seeds()
end

function contact_seeds()
	return has("emberseeds") or 
	has("scentseeds") or 
	has("mysteryseeds")
end

function burn_tree()
	return use_seeds() and has("emberseeds")
end

function torches()
	return use_seeds() and has("emberseeds") or
	
	((has("medium") or has("hard")) and use_seeds() and
		(has("emberseeds") or has("mysteryseeds")))
end

function torches_long()
	return shoot_seeds() and has("emberseeds") or
	((has("medium") or has("hard")) and 
		shoot_seeds() and (has("emberseeds") or has ("mysteryseeds")))
end

function torches_d8()
	return kill_magunesu() and jump3() and has("magnet") and has("slingshot2") and has ("emberseeds")
end

function torches_d8_alt()
	return has("hard") and max_jump() >= 4 and has("bombs") and kill_magunesu()
end

function destroy_bush() 
	return has("sword1") or
		has("magicboomerang") or
		has("bracelet") or
		has("biggoron_sword") or

	(has (("medium") or has("hard")) and
		((use_seeds() and has("emberseeds")) or
		(shoot_seeds() and has("galeseeds")) or
		has("bombs")))
end

function destroy_bush_flute()
	return destroy_bush() or any_flute()
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
	return sword_kill() or
	
	(has (("medium") or has("hard")) and 
		has("bombs"))
end

function hit_lever()
	return sword_kill_punch() or 
	has_rod() or
	has("shovel") or
	has("boomerang") or
	(contact_seeds() and use_seeds())
end 

function hit_far_lever()
	return shoot_seeds() or
	has("magicboomerang") or
	(has("hard") and has("ring_energy"))
end 

function hit_switch()
	return sword_kill() or
	has_rod() or
	use_seeds() or
	get_bombs() or
	has("boomerang") or
	has("shovel")
end

function hit_far_switch()
	return shoot_seeds() or
	has("boomerang") or
	has("bombs") or
	(has("sword1") and has("ring_energy"))
end 

function max_jump()
	local j = 0
	
	if (has("cape") and has("satchel1") and has("pegasusseeds")) then
		j = 4
	elseif has("cape") then
		j = 3
	elseif (has("feather") and has("satchel1") and has("pegasusseeds")) then
		j = 2
	elseif has ("feather") then
		j = 1
	end
	
	return j
end 

function jump2()
	return has("casual") and max_jump() >= 2 or
	(has("medium") or has("hard")) and max_jump() >= 1
end

function jump3()
	return has("casual") and max_jump() >= 3 or
	has("medium") and max_jump() >= 2 or
	has("hard") and (max_jump() >= 2 or (max_jump() >= 1 and has("bombs")))
end

function jump4()
	return has("casual") and max_jump() >= 4 or
	has("medium") and max_jump() >= 3 or
	has("hard") and (max_jump() >= 3 or (max_jump() >= 2 and has("bombs")))
end

function jump_liquid2()
	return (has("casual") or has("medium")) and max_jump() >= 2 or
	has("hard") and (max_jump() >= 2 or (max_jump() >= 1 and has("bombs")))
end

function jump_liquid3()
	return (has("casual") or has("medium")) and max_jump() >= 3 or
	has("hard") and (max_jump() >= 3 or (max_jump() >= 2 and has("bombs")))
end

function jump_liquid4()
	return (has("casual") or has("medium")) and max_jump() >= 4 or
	has("hard") and (max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))
end


function cross_water()
	return has("flippers") or
	max_jump() >= 1
end

-- KILL RULES (order of appearance)

function sword_kill()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword")
end

function sword_kill_punch()
	return punch() or
	has("sword1") or
	has("foolsore") or
	has("biggoron_sword")
end

function gale_kill()
	return has("casual") and
		shoot_seeds_combat() and has("galeseeds") or
	
	has("medium") and
		((shoot_seeds_combat() and has("galeseeds")) or
		(has("satchel2") and has("feather") and has("galeseeds"))) or

	has("hard") and
		has("satchel2") and has("galeseeds")
end

function kill_normal()
		return 
		sword_kill_punch() or
		gale_kill() or
		
	(has ("casual") and 
		has("satchel2") and (has("emberseeds") or has("scentseeds"))) or
	
	((has ("medium") or has("hard")) and
		has("satchel2") and contact_seeds())
end

function kill_keese()
	return kill_normal() or
	has("boomerang")
end

function kill_stalfos()
	return kill_normal() or has_rod()
end

function kill_goriyabros()
	return sword_kill_punch() or

	(has ("casual") and 
		shoot_seeds_combat() and has("scentseeds")) or
	
	(has (("medium") or ("hard")) and
		has("satchel2") and (has ("scentseeds") or has ("mysteryseeds")))
end

function kill_aquamentus()
	return sword_kill() or
		(has("satchel2") and has("scentseeds"))
end

function kill_hardhat_pit()
	return has("boomerang") or
		has("shield") or
		sword_kill() or
		has_rod() or
		gale_kill() or
		(shoot_seeds_combat() and has("scentseeds")) or
	
	(has("medium") or has("hard")) and 
		(has("satchel2") and has("scentseeds"))
end

function kill_moblin_pit()
	return has("satchel2") and has("scentseeds") or
		shoot_seeds_combat() and has("emberseeds") or
		shoot_seeds_combat() and has("galeseeds") or
		max_jump() >= 1 and (kill_normal() or gale_kill()) or
	
	(has("medium") or has("hard")) and
		sword_kill()
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
	return (has("shield1") or has("shovel")) and (has("satchel2") and (has("emberseeds") or has("scentseeds"))) or
		gale_kill() or
		sword_kill_punch() or
	
	(has("medium") or has("hard")) and
		((has("shield1") or has("shovel")) and has("satchel2") and contact_seeds())
end


function kill_moldorm()
	return shoot_seeds() and has("scentseeds") or
		sword_kill_punch() or

	(has("medium") or has("hard")) and
		has("satchel2") and has("scentseeds")
end

function kill_omuai()
	return has("bracelet") and
		(sword_kill() or
		shoot_seeds_combat() and has("scentseeds") or
	
(has (("medium") or ("hard")) and
		has("satchel2") and has("scentseeds")))
end

function kill_mothula()
	return sword_kill() or
		shoot_seeds_combat() and has("scentseeds") or
	
	(has (("medium") or ("hard")) and
		has("satchel2") and has("scentseeds") or
		sword_kill())
end

function kill_wizzrobe()
	return kill_normal()
end

function kill_ironmask()
	return shoot_seeds_combat() and has("emberseeds") or
		shoot_seeds_combat() and has("scentseeds") or
		sword_kill() or

	(has(("medium") or has("hard")) and
		has("satchel2") and (has("emberseeds") or has("scentseeds")))
end

function kill_gibdo()
	return kill_normal() or
	has("magicboomerang") or
	has_rod()
end

function kill_magunesu()
	return sword_kill_punch()
end

function kill_poe()
	return sword_kill() or
		shoot_seeds_combat() and has("scentseeds") or
		has("satchel2") and has("emberseeds") or

	((has("medium") or ("hard")) and
		has("satchel2") and (has("emberseeds") or has("scentseeds")))
end

function kill_agunima()
	return has("casual") and
	use_seeds() and has("emberseeds") and
	((shoot_seeds_combat() and has("scentseeds")) or
	sword_kill_punch()) or

	(has("medium") or ("hard")) and
	use_seeds() and has("emberseeds") and
	((has("satchel2") and has("scentseeds")) or
	sword_kill_punch())
end

function kill_2nd_poe()
	return kill_poe() and has("bracelet") and 
		torches_long() and has("satchel1") and has("pegasusseeds") and has("emberseeds") or

	(has("medium") and
		kill_poe() and has("bracelet") and 
		torches_long() and has("satchel1") and has("pegasusseeds") and (destroy_bush() or has("emberseeds"))) or

	(has("hard") and
		kill_poe() and has("bracelet") and 
		torches_long() and (destroy_bush() or has("emberseeds")))
end

function kill_2nd_poe_alt()
	return has ("hard") and kill_poe() and has("bracelet") and 
	has("satchel1") and has("pegasusseeds") and has("bombs") and (destroy_bush() or has("emberseeds"))
end

function kill_wizzrobe_cart()
	return kill_normal() or 
	has("shield1") or
	has_rod() or
	has("bracelet")
end

function kill_gohma()
	return shoot_seeds() or

	has("hard") and
		has("ring_energy") and (max_jump() >= 3 or (max_jump() >= 2 and has("bombs")))
end

function kill_hardhat_magnet()
	return has("glove") or gale_kill()
end

function kill_manhandla()
	return has("magicboomerang") and
	(sword_kill() or
	shoot_seeds_combat())
end

function kill_syger()
	return has("casual") and
		((shoot_seeds_combat() and has("scentseeds")) or
		sword_kill()) or

	(has("medium") or ("hard")) and
		((has("satchel2") and has("scentseeds")) or
		sword_kill())
end

function kill_stalfos_pit()
	return kill_normal() or 
	has("shield1") or
	has("shield2") or
	(use_seeds() and has("scentseeds")) or
	has_rod() or
	get_bombs()
end

function kill_gleeok()
	return sword_kill_punch()
end

function kill_hardhat_magnet_d8()
	return (has("glove") and has("bombs")) or gale_kill()
end

function kill_polsvoice_pit()
	return sword_kill() or
	has_rod() or
	any_flute() or
	gale_kill() or
	(has("satchel2") and has("scentseeds")) or
	has("shield1") or
	has("boomerang")
end

function kill_medusahead()
	return sword_kill()
end

function kill_onox()
	return has("sword1") and
	max_jump() >= 1
end

function kill_lynel()
	return has("sword1") or
	has("foolsore") or
	has("biggoron_sword") or
	(shoot_seeds() and has("scentseeds"))
end

-- HORON VILLAGE

function member_shop()
	return has("memberscard")
end

function farm_rupees()
	return has("shovel") or
	
	(((has"medium") or has("hard")) and
		sword_kill_punch() or
		has("satchel2") and contact_seeds() or
		has("bracelet") or
		has("boomerang") or
		has("flute_generic"))
end

function farm_maple()
	return sword_kill_punch() or
		shoot_seeds_combat() and contact_seeds() or
		has("bracelet") or
		has("boomerang") or
		has("flute_generic") or
	
	(((has"medium") or has("hard")) and
		has("satchel2") and contact_seeds())
end
-- NORTH HORON

function north_stump()
	return destroy_bush_flute() or
	furnace_exit() and has("flippers") and max_jump() >= 1 and wet_lake()
end

function enter_d1()
	return has("d1key") and north_stump()
end

function wet_lake()
	return  has("north_winter") or has("north_spring") or has("north_fall") or
	has("winter") or has("spring") or has("fall")
end

function d5_stump()
	return (north_stump() and (max_jump() >= 1 or ricky() or moosh())) and
	(has("winter") or has("north_winter"))  or
	wet_lake() and (has("flippers") or (dimitri() and has("bracelet"))) or
	furnace_exit() and has("flippers") and wet_lake()
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
	return has("polishedbell") and (pirates() or
		village() and max_jump() >= 1)
end

function western_coast_stump()
	return pirate_ship() and has("bombs") and max_jump() >= 1
end

function graveyard()
	return pirate_ship() and
	(jump2() or
	has("coast_summer") or
	has("bombs") and max_jump() >= 1 and has("summer"))
end

function coast_to_D7()
	return has("coast_summer") or
		has("bombs") and max_jump() >= 1 and has("summer") or
		(jump2() and
		((has("coast_winter") and has("shovel")) or 
		has("coast_spring") or has("coast_fall")))
end

-- SUBURBS + WOODS OF WINTER

function suburbs_stump_south()
	return burn_tree() or
	scent_tree() and cross_natzu() and cross_water_suburbs() or
	suburbs_exit() and destroy_bush()
end

function suburbs_stump_north()
    return ((burn_tree() or (suburbs_exit() and destroy_bush())) and cross_water_suburbs()) or
	scent_tree() and cross_natzu()
end

function cross_water_suburbs()
	return max_jump() >= 1 or ricky() or dimitri() or has("flippers") or has("suburbs_winter") or has("winter")
end

function mystery_tree()
	return suburbs_stump_north() and 
	((max_jump() >= 1 or ricky()) or --feather gives access no matter the season
	((has("suburbs_winter") or has("winter")) and (has("shovel") or any_flute())) or
	(has("suburbs_spring") or has("spring")) or
	(has("suburbs_summer") or has("summer")) or
	(has("suburbs_fall") or has("fall")))
end

function wow_stump()
	return suburbs_stump_north() and (has("suburbs_winter") or has("winter")) or
	gale_tree() and has("flippers")
end

function enter_d2()
	return mystery_tree() and open_d2()
end

function open_d2()
	return 
	
	d2_A() or d2_B()
end

function d2_A()
	return destroy_bush_flute()
end

function d2_B()
	return has("bracelet") and has("shuffledungeonoff")
end
-- HOLODRUM PLAIN

function scent_tree()
	return north_stump() and (has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) or
	torches() and cross_water_suburbs() and (has("spring") or has("suburbs_spring")) and cross_natzu()
end

function plain_stump()
	return scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()
end

-- SPOOL SWAMP

function pegasus_tree()
	return plain_stump() and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())
end

function swamp_stump()
	return pegasus_tree() and hit_lever() and has("bracelet") and has("d3key") and 
	((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)
	
end

function dry_swamp()
	return has("swamp_summer") or has("swamp_winter") or has("swamp_fall") or
	(swamp_stump() and (has("summer") or has("winter") or has("fall")))
end

function drained_swamp()
	return swamp_stump() and (dry_swamp() and (ricky() or dimitri() or jump2() or has("flippers"))) or
	(has("swamp_spring") or has("spring")) and has("flippers")
end

function south_swamp()
	return drained_swamp() or 
	plain_stump() and (dimitri() or has("flippers")) or
	swamp_exit() and has("bracelet")
end

function enter_d3()
	return swamp_stump() and (has("summer") or has("swamp_summer"))
end

-- NATZU

function cross_natzu()
	return ricky() or
	has("natzu_dimitri") and max_jump() >= 1 and (dimitri() or has("flippers")) or
	has("natzu_moosh") and (moosh() or (destroy_bush() and jump2()))
end

function natzu_to_moblin()
	return (has("flippers") or jump_liquid4()) and
	(ricky() or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or jump4())))
end

function sunken_to_moblin()
	return has("natzu_ricky") or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or jump2())) and
	(has("flippers") or jump_liquid4())
end

-- SUNKEN CITY
function gale_tree()
	return (scent_tree() and cross_natzu() and (has("flippers") or max_jump() >= 1)) or
	       (suburbs_stump_north() and (has("spring") or has("suburbs_spring")) and (has("flippers") or has("sunken_winter") or max_jump() >= 1)) or
	       (mount_cucco_stump() and has("flippers"))
end

function waterfalls()
	return dimitri() or 
	gale_tree() and has("bombs")
end

-- MOUNT CUCCO

function mount_cucco_stump()
	return (((scent_tree() and cross_natzu()) or (torches() and cross_water_suburbs() and (has("spring") or has("suburbs_spring"))) and 
	(has("flippers") or has("sunken_winter") or max_jump() >= 1)) and has("flippers") and (has("sunken_summer") or has("summer"))) or
	scent_tree() and (has("flippers") or jump_liquid4()) and has("bracelet") and (has("shovel") or moosh()) or
	mt_cucco_exit() --or
	--reenter_village()
end

function mount_cucco_spring()
	return mount_cucco_stump() and (has("sunken_spring") or has("spring"))
	
end

function enter_d4()
	return mount_cucco_spring() and has("winter") and
	max_jump() >= 1 and has("bracelet") and
	has("d4key") and has("summer")
end

-- GORON MOUNTAIN

function goron_mountain()
	return scent_tree() and (has("flippers") or jump_liquid4()) or
	mt_cucco_exit() and has("bracelet") and (has("shovel") or has("banana") or moosh())
end

-- TARM RUINS

function jewel_check()
	return

		has("jewelreq1") and (has("squarejewel") or has("roundjewel") or has("pyramidjewel") or has("xjewel")) or

		has("jewelreq2") and (has("squarejewel") and (has("roundjewel") or has("pyramidjewel") or has("xjewel")) or
			has("roundjewel") and (has("pyramidjewel") or has("xjewel")) or has("pyramidjewel") and has("xjewel")) or

		has("jewelreq3") and (has("squarejewel") and has("roundjewel") and (has("pyramidjewel") or has("xjewel")) or
			((has("squarejewel") or has("roundjewel")) and has("pyramidjewel") and has("xjewel"))) or

		has("jewelreq4") and has("squarejewel") and has("roundjewel") and has("pyramidjewel") and has("xjewel")
end

function tarm_ruins()
	return pegasus_tree() and jewel_check()
end

function tarm_tree()
	return tarm_ruins() and destroy_mushroom() and
	has("winter") and has("spring") and has("summer") and has("fall")
end

function enter_d6()
	return tarm_tree() and destroy_flower() and (has("shovel") or (use_seeds() and has("emberseeds")))
end


-- SAMASA DESERT

function desert()
	return suburbs_stump_south() and 
	pirate_ship() 
end


function enter_d7()
	return graveyard()
end

-- TEMPLE REMAINS

function temple_remains()
	return scent_tree() and jump2() or
		goron_mountain() and jump2() and (jump_liquid4() or has("flippers"))
end

function destroyed_remains()
	return (portal_remains_enter() --[[or reenter_volcano()]]) and
		volcano() and has("bombs")
end

function enter_d8()
	return destroyed_remains() and portal_d8_enter() and has("portalshuffleoff") or
		(d8() --[[or reenter_d8()]]) and has("portalshuffleon")

end

-- FULL CLEAR CHECKS --

function d1clear()
	return use_seeds() and has("emberseeds") and 
	has("bombs") and kill_goriyabros() and kill_aquamentus()
end

function d2clear()
	return use_seeds() and has("emberseeds") and 
	has("bracelet") and has("bombs")
end

function d3clear()
	return kill_beetle() and max_jump() >= 1 and 
	has("bombs") and has("bracelet") and 
	kill_omuai() and kill_mothula()
end

function d4clear()
	return has("flippers") and destroy_pot() and 
	has("bombs") and max_jump() >= 1 and 
	shoot_seeds() and has("emberseeds") and 
	kill_agunima() and kill_gohma()
end

function d5clear()
	return has("magnet") and kill_syger() and 
	max_jump() >= 1 and (max_jump() >= 4 or has("flippers"))
end

function d6clear()
	return has("magnet") and max_jump() >= 1 and
	has("bombs") and has("magicboomerang") and
	shoot_seeds() and has("emberseeds") and destroy_crystal() and
	sword_kill_punch() and kill_manhandla()
end

function d7clear()
	return jump3() and has("bombs") and has("bracelet") and
	has("satchel1") and has("pegasusseeds") and
	shoot_seeds() and has("emberseeds") and has("magnet") and
	has("flippers") and kill_magunesu() and
	kill_poe() and kill_gleeok()
end

function d8clear()
	return has("slingshot2") and max_jump() >= 3 and
	has("magnet") and has("bombs") and
	has("emberseeds") and has("bracelet") and kill_magunesu() and
	(has("magicboomerang") or max_jump() >= 4) and kill_polsvoice_pit() and 
	torches_d8() and kill_medusahead() 
end

-- SUBROSIA NAVIGATION

function portal_suburbs_enter()
	return torches() or
	destroy_bush_flute() and (has("flippers") or (has("bracelet") or max_jump() >= 1)) and 
	cross_natzu() and cross_water_suburbs()
end

function portal_swamp_enter()
	return ((((scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())) and hit_lever() and has("bracelet") and has("d3key") and 
	((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) and ((has("swamp_summer") or has("swamp_winter") or has("swamp_fall") or
	((((scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())) and hit_lever() and has("bracelet") and has("d3key") and 
	((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) and (has("summer") or has("winter") or has("fall")))) and (ricky() or dimitri() or jump2() or has("flippers"))) or
	(has("swamp_spring") or has("spring")) and has("flippers")or 
	(scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (dimitri() or has("flippers"))) and has("bracelet") and
		(any_flute() or has("swamp_summer") or has("swamp_fall") or
		((((scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
		north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())) and hit_lever() and has("bracelet") and has("d3key") and 
		((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) and (has("summer") or has("fall"))) or
		(has("shovel") and (has("swamp_winter") or ((((scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
		north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())) and hit_lever() and has("bracelet") and has("d3key") and 
		((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) and has("winter")))) or
		(destroy_flower() and (has("swamp_spring") or ((((scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
		north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump3() or ricky() or moosh())) and hit_lever() and has("bracelet") and has("d3key") and 
		((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) and has("spring")))))
end

function portal_lake_enter()
	return north_stump() and
		(((has("north_winter") or has("north_spring") or has("north_fall") or
		has("winter") or has("spring") or has("fall")) and (max_jump() >= 1 or ricky() or moosh()) and
		(has("flippers") or (dimitri() and has("bracelet")))) or
		(jump_liquid4() and (has("north_winter") or has("winter"))))
end

function portal_mtcucco_enter()
	return max_jump() >= 1 and (((scent_tree() and cross_natzu()) or (torches() and cross_water_suburbs() and (has("spring") or has("suburbs_spring"))) and 
	(has("flippers") or has("sunken_winter") or max_jump() >= 1)) and has("flippers") and (has("sunken_summer") or has("summer")) or
	scent_tree() and (has("flippers") or jump_liquid4()) and has("bracelet") and (has("shovel") or moosh()))
end
	
function portal_village_enter()
	return has("magicboomerang") or
		jump4()
end

function portal_remains_enter()
	return scent_tree() and jump2() and
	
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or --what to do in spring
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or --what to do in summer
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) --what to do in autumn
end

function portal_d8_enter()
	return scent_tree() and jump2() and
	
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or --what to do in spring
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or --what to do in summer
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and --what to do in autumn(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mountain()
	return portal_suburbs_enter() and (has("suburbs_mountainsub") or has("portalshuffleoff")) or
		portal_swamp_enter() and has("swamp_mountainsub") or
		portal_lake_enter() and has("lake_mountainsub") or
		portal_mtcucco_enter() and has("mtcucco_mountainsub") or
		portal_village_enter() and has("village_mountainsub") or
		portal_remains_enter() and has("remains_mountainsub") or
		portal_d8_enter() and has("d8_mountainsub")
end

function market()
	return portal_suburbs_enter() and has("suburbs_marketsub") or
		portal_swamp_enter() and (has("swamp_marketsub") or has("portalshuffleoff")) or
		portal_lake_enter() and has("lake_marketsub") or
		portal_mtcucco_enter() and has("mtcucco_marketsub") or
		portal_village_enter() and has("village_marketsub") or
		portal_remains_enter() and has("remains_marketsub") or
		portal_d8_enter() and has("d8_marketsub")
end

function furnace()
	return portal_suburbs_enter() and has("suburbs_furnacesub") or
		portal_swamp_enter() and has("swamp_furnacesub") or
		portal_lake_enter() and (has("lake_furnacesub") or has("portalshuffleoff")) or
		portal_mtcucco_enter() and has("mtcucco_furnacesub") or
		portal_village_enter() and has("village_furnacesub") or
		portal_remains_enter() and has("remains_furnacesub") or
		portal_d8_enter() and has("d8_furnacesub")
end

function village()
	return portal_suburbs_enter() and has("suburbs_mtcuccosub") or
		portal_swamp_enter() and has("swamp_mtcuccosub") or
		portal_lake_enter() and has("lake_mtcuccosub") or
		portal_mtcucco_enter() and (has("mtcucco_mtcuccosub") or has("portalshuffleoff")) or
		portal_village_enter() and has("village_mtcuccosub") or
		portal_remains_enter() and has("remains_mtcuccosub") or
		portal_d8_enter() and has("d8_mtcuccosub")
end

function pirates()
	return portal_suburbs_enter() and has("suburbs_piratessub") or
		portal_swamp_enter() and has("swamp_piratessub") or
		portal_lake_enter() and has("lake_piratessub") or
		portal_mtcucco_enter() and has("mtcucco_piratessub") or
		portal_village_enter() and (has("village_piratessub") or has("portalshuffleoff")) or
		portal_remains_enter() and has("remains_piratessub") or
		portal_d8_enter() and has("d8_piratessub")
end

function volcano()
	return portal_suburbs_enter() and has("suburbs_volcanosub") or
		portal_swamp_enter() and has("swamp_volcanosub") or
		portal_lake_enter() and has("lake_volcanosub") or
		portal_mtcucco_enter() and has("mtcucco_volcanosub") or
		portal_village_enter() and has("village_volcanosub") or
		portal_remains_enter() and (has("remains_volcanosub") or has("portalshuffleoff")) or
		portal_d8_enter() and has("d8_volcanosub")
end

function d8()
	return portal_suburbs_enter() and has("suburbs_d8sub") or
		portal_swamp_enter() and has("swamp_d8sub") or
		portal_lake_enter() and has("lake_d8sub") or
		portal_mtcucco_enter() and has("mtcucco_d8sub") or
		portal_village_enter() and has("village_d8sub") or
		portal_remains_enter() and has("remains_d8sub") or
		portal_d8_enter() and (has("d8_d8sub") or has("portalshuffleoff"))
end

function mountain_to_market()
	return max_jump() >= 1
end

function mountain_to_furnace()
	return jump4() or
	(max_jump() >= 1 and has("magnet"))
end

function mountain_to_village()
	return jump_liquid4()
end

function mountain_to_pirates()
	return jump_liquid4()
end

function market_to_mountain()
	return max_jump() >= 1 or
		has("ribbon")
end

function market_to_furnace()
	return jump4() or
	(max_jump() >= 1 and has("magnet"))
end

function market_to_village()
	return jump_liquid4()
end

function market_to_pirates()
	return jump_liquid4()
end

function furnace_to_mountain()
	return max_jump() >= 1 and
	 (jump4() or
	 (jump2() and has("bracelet") or
	 has("magnet")))
end

function furnace_to_market()
	return max_jump() >= 1 and
	 (jump4() or
	 ((jump2() and has("bracelet")) or
	 has("magnet")))
end

function furnace_to_village()
	return jump_liquid4()
end

function furnace_to_pirates()
	return jump_liquid4()
end

function village_to_mountain()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function village_to_market()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function village_to_furnace()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function village_to_pirates()
	return max_jump() >= 1
end

function pirates_to_mountain()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function pirates_to_market()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function pirates_to_furnace()
	return jump_liquid4() or
		(has("bracelet") and (jump_liquid2() or has("magnet")))
end

function pirates_to_village()
	return max_jump() >= 1
end

function volcano_to_mountain()
	return jump_liquid3() and has("bracelet")
end

function volcano_to_market()
	return jump_liquid3() and has("bracelet")
end

function volcano_to_furnace()
	return jump_liquid3() and has("bracelet")
end

function volcano_to_village()
	return jump_liquid4() and has("bracelet")
end

function volcano_to_pirates()
	return jump_liquid4() and has("bracelet")
end

function mountain_exit()
	return market() and market_to_mountain() or
	furnace() and furnace_to_mountain() or
	village() and village_to_mountain() or
	pirates() and pirates_to_mountain() or
	volcano() and volcano_to_mountain()
end

function market_exit()
	return mountain() and mountain_to_market() or
	furnace() and furnace_to_market() or
	village() and village_to_market() or
	pirates() and pirates_to_market() or
	volcano() and volcano_to_market()
end

function furnace_exit()
	return mountain() and mountain_to_furnace() or
	market() and market_to_furnace() or
	village() and village_to_furnace() or
	pirates() and pirates_to_furnace() or
	volcano() and volcano_to_furnace()
end

function village_exit()
	return mountain() and mountain_to_village() or
	market() and market_to_village() or
	furnace() and furnace_to_village() or
	pirates() and pirates_to_village() or
	volcano() and volcano_to_village()
end

function pirates_exit()
	return mountain() and mountain_to_pirates() or
	market() and market_to_pirates() or
	furnace() and furnace_to_pirates() or
	village() and village_to_pirates() or
	volcano() and volcano_to_pirates()
end

function suburbs_exit()
	return
		(mountain_exit() and (has("suburbs_mountainsub") or has("portalshuffleoff"))) or
		(market_exit() and (has("suburbs_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("suburbs_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("suburbs_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("suburbs_piratessub") and has("portalshuffleon")))
end

function swamp_exit()
	return
		(mountain_exit() and (has("swamp_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("swamp_marketsub") or has("portalshuffleoff"))) or
		(furnace_exit() and (has("swamp_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("swamp_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("swamp_piratessub") and has("portalshuffleon")))
end

function lake_exit()
	return
		(mountain_exit() and (has("lake_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("lake_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("lake_furnacesub") or has("portalshuffleoff"))) or
		(village_exit() and (has("lake_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("lake_piratessub") and has("portalshuffleon")))
end

function mt_cucco_exit()
	return
		(mountain_exit() and (has("mt_cucco_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("mt_cucco_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("mt_cucco_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("mt_cucco_villagesub") or has("portalshuffleoff"))) or
		(pirates_exit() and (has("mt_cucco_piratessub") and has("portalshuffleon")))
end

function horon_exit()
	return
		(mountain_exit() and (has("horon_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("horon_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("horon_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("horon_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("horon_piratessub") or has("portalshuffleoff")))
end

function remains_exit()
	return
		(mountain_exit() and (has("remains_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("remains_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("remains_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("remains_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("remains_piratessub") and has("portalshuffleon")))
end

function d8_exit()
	return
		(mountain_exit() and (has("d8_mountainsub") and has("portalshuffleon"))) or
		(market_exit() and (has("d8_marketsub") and has("portalshuffleon"))) or
		(furnace_exit() and (has("d8_furnacesub") and has("portalshuffleon"))) or
		(village_exit() and (has("d8_villagesub") and has("portalshuffleon"))) or
		(pirates_exit() and (has("d8_piratessub") and has("portalshuffleon")))
end


-- function remains_reenter_mt_cucco_mountain()
-- 	return mt_cucco_exit() and has("mt_cucco_mountainsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_market()
-- 	return mt_cucco_exit() and has("mt_cucco_marketsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_furnace()
-- 	return mt_cucco_exit() and has("mt_cucco_furnacesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_village()
-- 	return mt_cucco_exit() and has("mt_cucco_villagesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_pirates()
-- 	return mt_cucco_exit() and has("mt_cucco_piratessub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_volcano()
-- 	return mt_cucco_exit() and has("mt_cucco_volcanosub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end

-- function remains_reenter_mt_cucco_d8()
-- 	return mt_cucco_exit() and has("mt_cucco_d8sub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or moosh())
-- end


-- function mt_cucco_reenter_remains_mountain()
-- 	return remains_exit() and has("remains_mountainsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_market()
-- 	return remains_exit() and has("remains_marketsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_furnace()
-- 	return remains_exit() and has("remains_furnacesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_village()
-- 	return remains_exit() and has("remains_villagesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_pirates()
-- 	return remains_exit() and has("remains_piratessub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_volcano()
-- 	return remains_exit() and has("remains_volcanosub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_remains_d8()
-- 	return remains_exit() and has("remains_d8sub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
-- end

-- function mt_cucco_reenter_d8_mountain()
-- 	return mt_cucco_exit() and has("d8_mountainsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_market()
-- 	return mt_cucco_exit() and has("d8_marketsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_furnace()
-- 	return mt_cucco_exit() and has("d8_furnacesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_village()
-- 	return mt_cucco_exit() and has("d8_villagesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_pirates()
-- 	return mt_cucco_exit() and has("d8_piratessub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_volcano()
-- 	return mt_cucco_exit() and has("d8_volcanosub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function mt_cucco_reenter_d8_d8()
-- 	return mt_cucco_exit() and has("d8_d8sub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 	((has("temple_winter") or has("winter")) and
-- 		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
-- 		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
-- 		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
-- 		(has("temple_summer") or has("summer")) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_mountain()
-- 	return d8_exit() and has("mt_cucco_mountainsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_market()
-- 	return d8_exit() and has("mt_cucco_marketsub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_furnace()
-- 	return d8_exit() and has("mt_cucco_furnacesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_village()
-- 	return d8_exit() and has("mt_cucco_villagesub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_pirates()
-- 	return d8_exit() and has("mt_cucco_piratessub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_volcano()
-- 	return d8_exit() and has("mt_cucco_volcanosub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_mt_cucco_d8()
-- 	return d8_exit() and has("mt_cucco_d8sub") and has("bracelet") and jump2() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana") or moosh()) and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end


-- function remains_reenter_d8_mountain()
-- 	return d8_exit() and has("d8_mountainsub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_market()
-- 	return d8_exit() and has("d8_marketsub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_furnace()
-- 	return d8_exit() and has("d8_furnacesub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_village()
-- 	return d8_exit() and has("d8_villagesub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_pirates()
-- 	return d8_exit() and has("d8_piratessub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_volcano()
-- 	return d8_exit() and has("d8_volcanosub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function remains_reenter_d8_d8()
-- 	return d8_exit() and has("d8_d8sub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end


-- function d8_reenter_remains_mountain()
-- 	return d8_exit() and has("remains_mountainsub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_market()
-- 	return d8_exit() and has("remains_marketsub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_furnace()
-- 	return d8_exit() and has("remains_furnacesub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_village()
-- 	return d8_exit() and has("remains_villagesub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_pirates()
-- 	return d8_exit() and has("remains_piratessub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_volcano()
-- 	return d8_exit() and has("remains_volcanosub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function d8_reenter_remains_d8()
-- 	return d8_exit() and has("remains_d8sub") and
-- 		(jump_liquid4() or 
-- 		(jump_liquid2() and has("glove")))
-- end

-- function reenter_mountain()
-- 	return 
-- 	mt_cucco_reenter_remains_mountain() or
-- 	mt_cucco_reenter_d8_mountain() or
-- 	remains_reenter_mt_cucco_mountain() or
-- 	remains_reenter_d8_mountain() or
-- 	d8_reenter_mt_cucco_mountain() or
-- 	d8_reenter_remains_mountain()
-- end

-- function reenter_market()
-- 	return 
-- 	mt_cucco_reenter_remains_market() or
-- 	mt_cucco_reenter_d8_market() or
-- 	remains_reenter_mt_cucco_market() or
-- 	remains_reenter_d8_market() or
-- 	d8_reenter_mt_cucco_market() or
-- 	d8_reenter_remains_market()
-- end

-- function reenter_furnace()
-- 	return 
-- 	mt_cucco_reenter_remains_furnace() or
-- 	mt_cucco_reenter_d8_furnace() or
-- 	remains_reenter_mt_cucco_furnace() or
-- 	remains_reenter_d8_furnace() or
-- 	d8_reenter_mt_cucco_furnace() or
-- 	d8_reenter_remains_furnace()
-- end

-- function reenter_village()
-- 	return 
-- 	mt_cucco_reenter_remains_village() or
-- 	mt_cucco_reenter_d8_village() or
-- 	remains_reenter_mt_cucco_village() or
-- 	remains_reenter_d8_village() or
-- 	d8_reenter_mt_cucco_village() or
-- 	d8_reenter_remains_village()
-- end

-- function reenter_pirates()
-- 	return 
-- 	mt_cucco_reenter_remains_pirates() or
-- 	mt_cucco_reenter_d8_pirates() or
-- 	remains_reenter_mt_cucco_pirates() or
-- 	remains_reenter_d8_pirates() or
-- 	d8_reenter_mt_cucco_pirates() or
-- 	d8_reenter_remains_pirates()
-- end

-- function reenter_volcano()
-- 	return 
-- 	mt_cucco_reenter_remains_volcano() or
-- 	mt_cucco_reenter_d8_volcano() or
-- 	remains_reenter_mt_cucco_volcano() or
-- 	remains_reenter_d8_volcano() or
-- 	d8_reenter_mt_cucco_volcano() or
-- 	d8_reenter_remains_volcano()
-- end

-- function reenter_d8()
-- 	return 
-- 	mt_cucco_reenter_remains_d8() or
-- 	mt_cucco_reenter_d8_d8() or
-- 	remains_reenter_mt_cucco_d8() or
-- 	remains_reenter_d8_d8() or
-- 	d8_reenter_mt_cucco_d8() or
-- 	d8_reenter_remains_d8()
-- end

-- function mountain_sub()
-- 	return mountain() or
-- 	market() and market_to_mountain() or
-- 	furnace() and furnace_to_mountain() or
-- 	village() and village_to_mountain() or
-- 	pirates() and pirates_to_mountain() or
-- 	volcano() and volcano_to_mountain()
-- end

-- function market_sub()
-- 	return mountain() and mountain_to_market() or
-- 	market() or
-- 	furnace() and furnace_to_market() or
-- 	village() and village_to_market() or
-- 	pirates() and pirates_to_market() or
-- 	volcano() and volcano_to_market()
-- end

-- function furnace_sub()
-- 	return mountain() and mountain_to_furnace() or
-- 	market() and market_to_furnace() or
-- 	furnace() or
-- 	village() and village_to_furnace() or
-- 	pirates() and pirates_to_furnace() or
-- 	volcano() and volcano_to_furnace()
-- end

-- function village_sub()
-- 	return mountain() and mountain_to_village() or
-- 	market() and market_to_village() or
-- 	furnace() and furnace_to_village() or
-- 	village() or
-- 	pirates() and pirates_to_village() or
-- 	volcano() and volcano_to_village()
-- end

-- function pirates_sub()
-- 	return mountain() and mountain_to_pirates() or
-- 	market() and market_to_pirates() or
-- 	furnace() and furnace_to_pirates() or
-- 	village() and village_to_pirates() or
-- 	pirates() or
-- 	volcano() and volcano_to_pirates()
-- end

-- -- SPECIAL LOCATIONS THAT CAN BE SEQUENCE BROKEN INTO --

-- function moblin_road_chest()
-- 	return destroy_bush() and (ricky() or has("bombs")) and --open the cave and the chest
-- 	(has("wow_spring") or has("wow_summr") or has("wow_fall") or --the cave isn't blocked by winter blocks
-- 	has("spring") or has("summer") or has("fall")) --alternatively, the player can change to a season that isn't winter
-- end

-- function has(item, amount)
-- 	local count = Tracker:ProviderCountForCode(item)
-- 	amount = tonumber(amount)
-- 	if not amount then
-- 	  return count > 0
-- 	else
-- 	  return count == amount
-- 	end
-- end


-- DUNGEON CHECK RULES --

function entrance_not_assigned(prefix)
	return not(has(prefix .. "_d1") or has(prefix .. "_d2") or has(prefix .. "_d3") or has(prefix .. "_d4") or has(prefix .. "_d5") or has(prefix .. "_d6") or has(prefix .. "_d7") or has(prefix .. "_d8"))
end

function dungeon_not_assigned(suffix)
	return not(has("d1_" .. suffix) or has("d2_" .. suffix) or has("d3_" .. suffix) or has("d4_" .. suffix) or has("d5_" .. suffix) or has("d6_" .. suffix) or has("d7_" .. suffix) or has("d8_" .. suffix))
end

local dungeon_index = {
	["d1"] = 1,
	["d2"] = 2,
	["d3"] = 3,
	["d4"] = 4,
	["d5"] = 5,
	["d6"] = 6,
	["d7"] = 7,
	["d8"] = 8
}


function update_dungeon_check(dungeon, entrance)
	-- Tracker progessive dungeon entrance item
	local entrance_item = Tracker:FindObjectForCode(entrance .. "_ent")
	-- dummy item for blue checks
	local dummy_item = Tracker:FindObjectForCode(dungeon .. "_from_" .. entrance)
	-- disable the dummy items, so it won't trigger next time
	dummy_item.Active = false
	-- Set the entrance to the right dungeon
	entrance_item.CurrentStage = dungeon_index[dungeon]
end

function tracker_on_accessibility_updated(item_code)
	if (item_code == "bombs") then
		tracker_on_bomb_updated()
	else
		tracker_on_dungeon_entrance_updated()
	end
end

function tracker_on_dungeon_entrance_updated()
	for dungeon,_ in pairs(dungeon_index) do
		for entrance,_ in pairs(dungeon_index) do
			if has(dungeon .. "_from_" .. entrance) then
				update_dungeon_check(dungeon, entrance)
			end
		end
	end
end

function tracker_on_portal_entrance_updated()
	-- for portal,_ in pairs(portal_holodrum_index) do
	-- 	for access,_ in pairs(portal_subrosia_index) do
	-- 		if has(portal .. "_" .. access) then
	-- 			update_portal_check(portal, access)
	-- 		end
	-- 		if has(access .. "_" .. portal) then
	-- 			update_portal_check(portal, access)
	-- 		end
	-- 	end
	-- end
end

function tracker_on_bomb_updated()
	local bombs = Tracker:FindObjectForCode("bombs")
	if bombs then
		if bombs.AcquiredCount == 89 then
			bombs.AcquiredCount = 90
		end
	end
end