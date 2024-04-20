function get_bombs()
	return sword_kill() or
	
	has ("casual") and has("shovel") or

	has ((("medium") or has("hard")) and 
		has("shovel") or 
		(use_seeds() and has("emberseeds")) or
		(use_seeds() and has("scentseeds")))
end

function destroy_signs()
	return has("sword2") or 
	has("biggoron_sword") or
	use_seeds() and has("emberseeds")
end

function bombs()
	return ricky() or has("bombs")
end

function ore_chunks()
	return has("shovel") or 
	has("sword1") or 
	has("bracelet") or
	has("magicboomerang") or
	has("biggoron_sword")
end

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

function has_rod()
	return has("winter") or
	has("spring") or
	has("summer") or
	has("fall")
end

function punch()
	return has("ring_fist") or has("ring_expert")
end

function harvest_seeds()
	return use_seeds() and (sword_kill_punch() or has_rod())
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
	has("slingshot1")
end

function use_seeds_combat()
	return has("satchel2") or
	has("slingshot")
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

	(has(("medium") or has("hard")) and 
		((has("satchel1") or has("slingshot1")) and has("emberseeds")) or
		(has("slingshot1") and has("galeseeds")) or
		has("bombs"))
end

function destroy_bush_flute()
	return has("sword1") or
	has("magicboomerang") or
	has("bracelet") or
	has("biggoron_sword") or
	any_flute() or

(has(("medium") or has("hard")) and 
	((has("satchel1") or has("slingshot1")) and has("emberseeds")) or
	(has("slingshot1") and has("galeseeds")) or
	has("bombs"))
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

function jump5()
	return (has("casual") or has("medium")) and max_jump() >= 4 or
	has("hard") and (max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))
end

function jump6()
	return has("medium") and max_jump() >= 4 or
	has("hard") and (max_jump() >= 4 or (max_jump() >= 3 and has("bombs")))
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

-- KILL RULES

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
	((has ("medium") or has("hard")) and
		use_seeds() and has("emberseeds") or has("bombs30"))
end

function kill_keese()
	return kill_normal() or
	has("boomerang") or
	(has("medium") or has("hard")) and has("bombs30")
end

function kill_stalfos()
	return kill_normal() or has_rod() or
	(has("medium") or has("hard")) and has("bombs30")
end

function kill_goriyabros()
	return sword_kill_punch() or

	(has ("casual") and 
		shoot_seeds_combat() and has("scentseeds")) or
	
	(has (("medium") or ("hard")) and
		has("satchel2") and (has ("scentseeds") or has ("mysteryseeds"))) or
		(has("medium") or has("hard")) and has("bombs30")
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
	
	((has("medium") or has("hard")) and
		sword_kill() or
		has("bombs30"))
end

function kill_facade()
	return has("bombs")
end

function kill_dodongo()
	return get_bombs() and
	has("bracelet")
end

function kill_beetle()
	return ((has("shield1") or has("shovel")) and (use_seeds_combat() and (has("emberseeds") or has("scentseeds"))) or
		sword_kill_punch()) or
		gale_kill() or
	
	(has("medium") or has("hard")) and
		((has("shield1") or has("shovel")) and (use_seeds_combat() and contact_seeds()) or sword_kill_punch() or has("bombs30"))
end

function kill_moldorm()
	return shoot_seeds() and has("scentseeds") or
		sword_kill_punch() or

	(has("medium") or has("hard")) and
		((has("satchel2") and has("scentseeds")) or has("bombs30"))
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
	return kill_normal() or
	(has("medium") or has("hard")) and has("bombs30")
end

function kill_ironmask()
	return shoot_seeds_combat() and has("emberseeds") or
		shoot_seeds_combat() and has("scentseeds") or
		sword_kill() or

	(has(("medium") or has("hard")) and
		(has("satchel2") and (has("emberseeds") or has("scentseeds"))) or has("bombs30"))
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
	return has("d1key") and north_stump() or
	exit_front_d2_b() and has("d2_d1") or
	exit_front_d0() and has("d0_d1")
end

function wet_lake()
	return  has("north_winter") or has("north_spring") or has("north_fall") or
	has("winter") or has("spring") or has("fall")
end

function d5_stump()
	return (north_stump() and (max_jump() >= 1 or ricky() or moosh())) and
	((has("winter") or has("north_winter"))  or
	wet_lake() and (has("flippers") or (dimitri() and has("bracelet"))) or
	furnace_exit() and has("flippers") and wet_lake()) or
	((exit_front_d2_b() and has("d2_d5")) or (exit_front_d0() and has("d0_d5") and has("bracelet"))) and (has("north_fall") or max_jump() >= 1)
end

function enter_d5()
	return d5_stump() and
	(destroy_mushroom() or dimitri()) and
	(has("fall") or 
	(has("north_fall") and (has("flippers") or (dimitri() and has("bracelet")) or (has("winter") and dimitri())) or 
	(has("winter") and has("fall") and (max_jump() >= 1 or ricky() or moosh())))) or
	exit_front_d2_b() and has("d2_d5")
end

-- WESTERN COAST

function exit_front_d0()
	return has("shuffledungeonon") and destroy_bush_flute() and has("d0_alt_entrance_vanilla")
end

function pirate_ship()
	return has("polishedbell") and (pirates() or
		village() and max_jump() >= 1)
end

function western_coast_stump()
	return pirate_ship() and has("bombs") and max_jump() >= 1
end

function graveyard()
	return pirate_ship() and
	(jump3() or
	has("coast_summer") or
	has("bombs") and max_jump() >= 1 and has("summer")) or
	exit_front_d2_b() and has("d2_d7") or
	exit_front_d0() and has("d0_d7")
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
	return use_seeds() and has("emberseeds") or
	scent_tree() and cross_natzu() and cross_water_suburbs() or
	has("bracelet") and has("shovel") and has("flippers") or
	suburbs_exit() and destroy_bush() or
	scent_tree() and has("bracelet") and has("shovel") and has("flippers") and cross_water_suburbs() or
	exit_d2_b() and destroy_bush_flute() and cross_water_suburbs() or
	exit_front_d0() and has("d0_d2") and cross_water_suburbs() and
	(has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or(has("suburbs_winter") and(has("shovel") or ricky() or moosh() or dimitri()))) or
	exit_front_d0() and has("d0_d2") and 
	((has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") and cross_water_suburbs()) or(has("suburbs_winter") and(has("shovel") or ricky() or moosh() or dimitri())))
end

function suburbs_stump_north()
    return (((use_seeds() and has("emberseeds")) or (suburbs_exit() and destroy_bush())) and cross_water_suburbs()) or
	scent_tree() and cross_natzu() or
	exit_d2_b() and destroy_bush_flute() or
	has("bracelet") and has("shovel") and has("flippers") or
	scent_tree() and has("bracelet") and has("shovel") and has("flippers") or
	exit_front_d0() and has("d0_d2") and 
	(has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or(has("suburbs_winter") and(has("shovel") or ricky() or moosh() or dimitri())))
end

function cross_water_suburbs()
	return max_jump() >= 1 or ricky() or dimitri() or has("flippers") or has("suburbs_winter") or has("winter")
end

function mystery_tree()
	return suburbs_stump_north() and (has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or
	(has("suburbs_winter") and (has("shovel") or has("spring") or has("summer") or has("fall") or ricky() or moosh() or dimitri()))) or
	has("bracelet") and has("shovel") and has("flippers") or
	exit_d2_b() and destroy_bush_flute() or
	exit_front_d0() and has("d0_d2") or
	mountain_sub() and destroy_bush_flute() and cross_water_suburbs()
end

function wow_stump()
	return suburbs_stump_north() and (has("suburbs_winter") or has("winter")) or
	gale_tree() and has("flippers")
end

function enter_d2()
	return mystery_tree() and open_d2() or
	exit_front_d0() and has("d0_d2")
end

function open_d2()
	return 
	
	d2_A() or d2_B()
end

function d2_A()
	return destroy_bush_flute()
end

function d2_B()
	return (((((use_seeds() and has("emberseeds")) or (suburbs_exit() and destroy_bush_flute())) and cross_water_suburbs()) or
	scent_tree() and cross_natzu()) and (has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or
	(has("suburbs_winter") and (has("shovel") or has("spring") or has("summer") or has("fall") or ricky() or dimitri() or moosh())))) and has("bracelet") and has("d2_alt_entrance_vanilla")
end

function d2_C()
	return (((((use_seeds() and has("emberseeds"))) and cross_water_suburbs()) or
	destroy_bush_flute() and has("bracelet") and cross_natzu()) and (has("suburbs_spring") or has("suburbs_summer") or has("suburbs_fall") or
	(has("suburbs_winter") and (has("shovel") or has("spring") or has("summer") or has("fall") or ricky() or dimitri() or moosh())))) and has("bracelet") and has("d2_alt_entrance_vanilla")
end

function exit_d2_b()
	return (has("shuffledungeonon") and
		(has("d2_d0") or

		has("d2_d1") and has("d1key") and destroy_bush_flute() or

		(has("d2_d3")
		 and ((((destroy_bush_flute() and (has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri())) and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
		 north_stump() and (has("flippers") or dimitri()) and destroy_bush_flute() or
		 exit_front_d2_b() and has("flippers") and has("d3_d2")) and (has("plain_summer") or has("summer") or jump4() or ricky() or moosh()) or
		 exit_front_d2_b() and has("d3_d2") and has("flippers")) and hit_lever() and has("bracelet") and has("d3key") and 
		 ((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1))
		  and (has("summer") or has("swamp_summer"))) or

		(has("d2_d4") and ((destroy_bush_flute() and (has("flippers") or jump_liquid4()) and has("shovel")) or
		mt_cucco_exit_no_suburbs()
		) and has("winter") and max_jump() >= 1 and has("bracelet") and has("d4key") and has("summer")) or

		has("d2_d5") and d5_stump() and
		(destroy_mushroom() or dimitri()) and (has("fall") or (has("north_fall") and (has("flippers") or (dimitri() and has("bracelet")) or (has("winter") and dimitri())) or 
		(has("winter") and has("fall") and (max_jump() >= 1 or ricky() or moosh())))) or

		has("d2_d6") and jewel_check() and destroy_mushroom() and
		has("winter") and has("spring") and has("summer") and has("fall") and destroy_flower() and (has("shovel") or ((has("satchel1") or
		has("slingshot1")) and has("emberseeds"))) or

		has("d2_d7") and graveyard()) or

		has("d2_d8") and d8_no_suburbs()) and 
			torches() and kill_normal() and has("bracelet")
end

function exit_front_d2_b()
	return has("shuffledungeonon") and d2_C() and has("d2_alt_entrance_vanilla")
end

-- HOLODRUM PLAIN

function scent_tree()
	return north_stump() and (has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) or
	use_seeds() and has("emberseeds") and cross_water_suburbs() and (has("spring") or has("suburbs_spring")) and cross_natzu()
end

function plain_stump()
	return scent_tree() and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	destroy_bush_flute() and has("flippers") or
	exit_front_d2_b() and has("d2_d3") and has("flippers") or
	exit_front_d0() and has("d0_d3") and has("flippers")
end

-- SPOOL SWAMP

function pegasus_tree()
	return plain_stump() and (has("plain_summer") or has("summer") or jump4() or ricky() or moosh()) or
		exit_front_d2_b() and has("d2_d3") and has("flippers") or
		exit_front_d0() and has("d0_d3") and has("flippers")
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
	return swamp_stump() and (has("summer") or has("swamp_summer")) or
	exit_front_d2_b() and has("d2_d3") or
	exit_front_d0() and has("d0_d3")
end

function swamp_heart_piece()
	return ((pegasus_tree() or ((remains_exit() or d8_exit()) and jump3())) and 
	((swamp_stump() and has("spring")) or has("swamp_spring")) and (has("flippers") or dimitri())) or
	swamp_exit() and has("bracelet") and has("swamp_spring") and (jump_liquid4() or dimitri() or has("flippers")) or
	destroy_bush_flute() and has("swamp_spring") and (has("flippers") or dimitri())

end

-- NATZU

function cross_natzu()
	return ricky() or
	has("natzu_dimitri") and max_jump() >= 1 and (dimitri() or has("flippers")) or
	has("natzu_moosh") and (moosh() or (destroy_bush() and jump3()))
end

function natzu_to_moblin()
	return ((has("flippers") or jump_liquid4()) and
	(ricky() or
	(has("natzu_dimitri") and (dimitri() or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or jump4()))))
end

function sunken_to_moblin()
	return (has("flippers") or jump_liquid4()) and
	(has("natzu_ricky") or
	(has("natzu_dimitri") and max_jump() >= 1 and ((dimitri() and has("bracelet")) or (has("flippers") and has("ring_swimmer")))) or
	(has("natzu_moosh") and (moosh() or jump4())))
end

-- SUNKEN CITY

function gale_tree()
	return (scent_tree() and cross_natzu() and (has("flippers") or max_jump() >= 1)) or
	       (suburbs_stump_north() and (has("spring") or has("suburbs_spring")) and (has("flippers") or has("sunken_winter") or max_jump() >= 1)) or
	       (mount_cucco_stump() and has("flippers")) or
		   exit_front_d2_b() and has("d2_d4") and has("flippers") or
		   exit_front_d0() and has("d0_d4") and has("flippers")
end

function waterfalls()
	return dimitri() or 
	gale_tree() and has("bombs")
end

-- MOUNT CUCCO

function mount_cucco_stump()
	return 
		(((suburbs_exit() and cross_water_suburbs()) or suburbs_stump_north()) and (has("spring") or has("suburbs_spring")) and has("flippers") and (has("sunken_summer") or has("summer")))
	
	or
	(scent_tree() and (has("bracelet") and has("shovel") and (has("flippers") or jump_liquid4())) or (cross_natzu() and has("flippers") and (has("sunken_summer") or has("summer")))) or
	mt_cucco_exit() or
	exit_front_d2_b() and has("d2_d4") and (has("sunken_summer")or has("sunken_winter") or has("flippers")) or
	exit_front_d0() and has("d0_d4") and (has("sunken_summer")or has("sunken_winter") or has("flippers"))
end

function mount_cucco_spring()
	return mount_cucco_stump() and (has("sunken_spring") or has("spring")) or
	exit_front_d2_b() and has("d2_d4") and (has("sunken_summer") or has("sunken_winter") or has("flippers")) or
	exit_front_d0() and has("d0_d4") and (has("sunken_summer") or has("sunken_winter") or has("flippers"))
	
end

function mount_cucco_exit_alt()
	return exit_front_d2_b() and has("d2_d4") and (has("sunken_summer") or has("sunken_winter") or has("flippers")) or
	exit_front_d0() and has("d0_d4") and (has("sunken_summer") or has("sunken_winter") or has("flippers"))
end

function enter_d4()
	return mount_cucco_spring() and has("winter") and
	max_jump() >= 1 and has("bracelet") and
	has("d4key") and has("summer") or
	exit_front_d2_b() and has("d2_d4") or
	exit_front_d0() and has("d0_d4")
end

-- GORON MOUNTAIN

function goron_mountain()
	return (scent_tree() and (has("flippers") or jump_liquid4())) or
	(mount_cucco_stump() and has("bracelet") and (has("shovel") or has("banana")))
end

-- TARM RUINS

function jewel_check()
	return
		has("jewelreq0") or

		has("jewelreq1") and (has("squarejewel") or has("roundjewel") or has("pyramidjewel") or has("xjewel")) or

		has("jewelreq2") and (has("squarejewel") and (has("roundjewel") or has("pyramidjewel") or has("xjewel")) or
			has("roundjewel") and (has("pyramidjewel") or has("xjewel")) or has("pyramidjewel") and has("xjewel")) or

		has("jewelreq3") and (has("squarejewel") and has("roundjewel") and (has("pyramidjewel") or has("xjewel")) or
			((has("squarejewel") or has("roundjewel")) and has("pyramidjewel") and has("xjewel"))) or

		has("jewelreq4") and has("squarejewel") and has("roundjewel") and has("pyramidjewel") and has("xjewel")
end

function tarm_ruins()
	return pegasus_tree() and jewel_check() or
	exit_front_d2_b() and has("d2_d6") and (has("temple_fall") or has("fall")) and (has("bracelet") or has("boomerang2")) and (has("flippers") or has("temple_winter")) or
	exit_front_d0() and has("d0_d6") and (has("temple_fall") or has("fall")) and (has("bracelet") or has("boomerang2")) and (has("flippers") or has("temple_winter"))
end

function tarm_lynel()
	return tarm_ruins() and (has("winter") and (has("spring") or has("summer") or has("fall")) and ((has("summer") or has("temple_summer")) or ((has("fall") or has("temple_fall")) and max_jump() >= 1 and has("boomerang2"))))
end

function tarm_tree()
	return tarm_ruins() and (has("boomerang2") or has("bracelet")) and
	has("winter") and has("spring") and has("summer") and has("fall") or
	exit_front_d2_b() and has("d2_d6") or
	exit_front_d0() and has("d0_d6")
end

function enter_d6()
	return tarm_ruins() and (has("boomerang2") or has("bracelet")) and
	has("winter") and has("spring") and has("summer") and has("fall") and destroy_flower() and (has("shovel") or ((has("satchel1") or
	has("slingshot1")) and has("emberseeds"))) or
	exit_front_d2_b() and has("d2_d6") or
	exit_front_d0() and has("d0_d6")
end

-- SAMASA DESERT

function desert()
	return suburbs_stump_south() and 
	pirates_exit() 
end

function enter_d7()
	return graveyard()
end

-- TEMPLE REMAINS

function temple_remains()
	return scent_tree() and jump3() or
		mount_cucco_stump() and has("bracelet") and (has("shovel") or has("banana")) and jump3() and (jump_liquid4() or has("flippers"))
end

function destroyed_remains()
	return (volcano() or reenter_volcano() or d2_suburbs_volcano()) and has("bombs")
end

function enter_d8()
	return destroyed_remains() and portal_d8_enter() and has("portalshuffleoff") or
		has("portalshuffleon") and (d8() or reenter_d8()) or
		exit_front_d2_b() and has("d2_d8") or
		exit_front_d0() and has("d0_d8")
end

-- DUNGEON CHECKS --

function enter_d0()
	return true
end

function d0()
	return has("shuffledungeonoff") and enter_d0() or
	has("shuffledungeonon") and
		(has("d0_d0") and enter_d0() or
		has("d0_d1") and enter_d1() or
		has("d0_d2") and enter_d2() or
		has("d0_d3") and enter_d3() or
		has("d0_d4") and enter_d4() or
		has("d0_d5") and enter_d5() or
		has("d0_d6") and enter_d6() or
		has("d0_d7") and enter_d7() or
		has("d0_d8") and enter_d8())
end

function d1()
	return has("shuffledungeonoff") and enter_d1() or
	has("shuffledungeonon") and
		(has("d0_d1") and enter_d0() or
		has("d1_d1") and enter_d1() or
		has("d1_d2") and enter_d2() or
		has("d1_d3") and enter_d3() or
		has("d1_d4") and enter_d4() or
		has("d1_d5") and enter_d5() or
		has("d1_d6") and enter_d6() or
		has("d1_d7") and enter_d7() or
		has("d1_d8") and enter_d8())
end

function d2()
	return has("shuffledungeonoff") and enter_d2() or
	has("shuffledungeonon") and
		(has("d0_d2") and enter_d0() or
		has("d2_d1") and enter_d1() or
		has("d2_d2") and enter_d2() or
		has("d2_d3") and enter_d3() or
		has("d2_d4") and enter_d4() or
		has("d2_d5") and enter_d5() or
		has("d2_d6") and enter_d6() or
		has("d2_d7") and enter_d7() or
		has("d2_d8") and enter_d8())
end

function d3()
	return has("shuffledungeonoff") and enter_d3() or
	has("shuffledungeonon") and
		(has("d3_d0") and enter_d0() or
		has("d3_d1") and enter_d1() or
		has("d3_d2") and enter_d2() or
		has("d3_d3") and enter_d3() or
		has("d3_d4") and enter_d4() or
		has("d3_d5") and enter_d5() or
		has("d3_d6") and enter_d6() or
		has("d3_d7") and enter_d7() or
		has("d3_d8") and enter_d8())
end

function d4()
	return has("shuffledungeonoff") and enter_d4() or
	has("shuffledungeonon") and
		(has("d4_d0") and enter_d0() or
		has("d4_d1") and enter_d1() or
		has("d4_d2") and enter_d2() or
		has("d4_d3") and enter_d3() or
		has("d4_d4") and enter_d4() or
		has("d4_d5") and enter_d5() or
		has("d4_d6") and enter_d6() or
		has("d4_d7") and enter_d7() or
		has("d4_d8") and enter_d8())
end

function d5()
	return has("shuffledungeonoff") and enter_d5() or
	has("shuffledungeonon") and
		(has("d5_d0") and enter_d0() or
		has("d5_d1") and enter_d1() or
		has("d5_d2") and enter_d2() or
		has("d5_d3") and enter_d3() or
		has("d5_d4") and enter_d4() or
		has("d5_d5") and enter_d5() or
		has("d5_d6") and enter_d6() or
		has("d5_d7") and enter_d7() or
		has("d5_d8") and enter_d8())
end

function d6()
	return has("shuffledungeonoff") and enter_d6() or
	has("shuffledungeonon") and
		(has("d6_d0") and enter_d0() or
		has("d6_d1") and enter_d1() or
		has("d6_d2") and enter_d2() or
		has("d6_d3") and enter_d3() or
		has("d6_d4") and enter_d4() or
		has("d6_d5") and enter_d5() or
		has("d6_d6") and enter_d6() or
		has("d6_d7") and enter_d7() or
		has("d6_d8") and enter_d8())
end

function d7()
	return has("shuffledungeonoff") and enter_d7() or
	has("shuffledungeonon") and
		(has("d7_d0") and enter_d0() or
		has("d7_d1") and enter_d1() or
		has("d7_d2") and enter_d2() or
		has("d7_d3") and enter_d3() or
		has("d7_d4") and enter_d4() or
		has("d7_d5") and enter_d5() or
		has("d7_d6") and enter_d6() or
		has("d7_d7") and enter_d7() or
		has("d7_d8") and enter_d8())
end

function d8_dungeon()
	return has("shuffledungeonoff") and enter_d8() or
	has("shuffledungeonon") and
		(has("d8_d0") and enter_d0() or
		has("d8_d1") and enter_d1() or
		has("d8_d2") and enter_d2() or
		has("d8_d3") and enter_d3() or
		has("d8_d4") and enter_d4() or
		has("d8_d5") and enter_d5() or
		has("d8_d6") and enter_d6() or
		has("d8_d7") and enter_d7() or
		has("d8_d8") and enter_d8())
end

function d1keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d1sk") >= 2 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d2keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d2sk") >= 3 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d3keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d3sk") >= 2 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d4keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d4sk") >= 5 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d5keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d5sk") >= 5 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d6keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d6sk") >= 3 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d7keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d7sk") >= 5 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d8keys()
    if Tracker:FindObjectForCode("small_keysanity").CurrentStage == 1 then
		if Tracker:ProviderCountForCode("d8sk") >= 7 then  
            return true
        else
            return false
        end
    else
        return true
    end
end

function d1clear()
	return (has("small_keysanity_off") or (has("small_keysanity_on") and (d1keys() or has("d1_master_key")))) and 
	(has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d1bk") or (has("d1_master_key") and has("master_keys_both")))))
	and use_seeds() and has("emberseeds") and 
	has("bombs") and kill_goriyabros() and kill_aquamentus()
end

function d2clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d2keys() or has("d2_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d2bk") or (has("d2_master_key") and has("master_keys_both"))))))  
	and use_seeds() and has("emberseeds") and 
	has("bracelet") and has("bombs")
end

function d3clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d3keys() or has("d3_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d3bk") or (has("d3_master_key") and has("master_keys_both"))))))  
	and kill_beetle() and max_jump() >= 1 and 
	has("bombs") and has("bracelet") and 
	kill_omuai() and kill_mothula()
end

function d4clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d4keys() or has("d4_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d4bk") or (has("d4_master_key") and has("master_keys_both"))))))  
	and has("flippers") and has("bracelet") and 
	has("bombs") and max_jump() >= 1 and 
	shoot_seeds() and has("emberseeds") and 
	kill_agunima() and kill_gohma()
end

function d5clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d5keys() or has("d5_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d5bk") or (has("d5_master_key") and has("master_keys_both"))))))  
	and has("magnet") and kill_syger() and 
	max_jump() >= 1 and (max_jump() >= 4 or has("flippers"))
end

function d6clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d6keys() or has("d6_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d6bk") or (has("d6_master_key") and has("master_keys_both"))))))  
	and has("magnet") and max_jump() >= 1 and
	has("bombs") and has("magicboomerang") and
	shoot_seeds() and has("emberseeds") and destroy_crystal() and
	sword_kill_punch() and kill_manhandla()
end

function d7clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d7keys() or has("d7_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d7bk") or (has("d7_master_key") and has("master_keys_both"))))))  
	and jump4() and has("bombs") and has("bracelet") and
	has("satchel1") and has("pegasusseeds") and
	shoot_seeds() and has("emberseeds") and has("magnet") and
	has("flippers") and kill_magunesu() and
	kill_poe() and kill_gleeok()
end

function d8clear()
	return ((has("small_keysanity_off") or (has("small_keysanity_on") and (d8keys() or has("d8_master_key")))) and (has("boss_keysanity_off") or (has("boss_keysanity_on") and (has("d8bk") or (has("d8_master_key") and has("master_keys_both"))))))  
	and has("slingshot2") and max_jump() >= 3 and
	has("magnet") and has("bombs") and
	has("emberseeds") and has("bracelet") and kill_magunesu() and
	(has("magicboomerang") or max_jump() >= 4) and kill_polsvoice_pit() and 
	torches_d8() and kill_medusahead() 
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
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

function has(item)
    return Tracker:ProviderCountForCode(item) == 1
  end
  
function checkRequirements(reference, check_count)
    local reqCount = Tracker:ProviderCountForCode(reference)
    local count = Tracker:ProviderCountForCode(check_count)
  
    if count >= reqCount then
        return true
    else
        return false
    end
end

function dungeon_settings()
    local dungeon_list = {"d0","d1","d2","d3","d4","d5","d6","d7","d8"}
	if Tracker:FindObjectForCode("dungeonshuffle").CurrentStage == 0 then
        for index, dungeon in pairs(dungeon_list) do
            Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = index
        end
	else
        for index, dungeon in pairs(dungeon_list) do
            Tracker:FindObjectForCode(dungeon.."_ent_selector").CurrentStage = 0
        end
	end
end

function display_dungeons()
	if Tracker:FindObjectForCode("dungeonshuffle").CurrentStage == 1 then
		if Tracker:FindObjectForCode("fill_dungeons").CurrentStage == 1 then
			Tracker:FindObjectForCode("d0_ent_selector").CurrentStage = Tracker:FindObjectForCode("d0_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d1_ent_selector").CurrentStage = Tracker:FindObjectForCode("d1_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d2_ent_selector").CurrentStage = Tracker:FindObjectForCode("d2_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d3_ent_selector").CurrentStage = Tracker:FindObjectForCode("d3_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d4_ent_selector").CurrentStage = Tracker:FindObjectForCode("d4_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d5_ent_selector").CurrentStage = Tracker:FindObjectForCode("d5_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d6_ent_selector").CurrentStage = Tracker:FindObjectForCode("d6_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d7_ent_selector").CurrentStage = Tracker:FindObjectForCode("d7_ent_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d8_ent_selector").CurrentStage = Tracker:FindObjectForCode("d8_ent_selector_hidden").CurrentStage
		end
	end
end

function seasons_settings()
    local region_list = {"north_horon","suburbs","wow","plain","swamp","sunken", "coast", "remains"}
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 0 then
		Tracker:FindObjectForCode("north_horon_season").CurrentStage = 3
		Tracker:FindObjectForCode("suburbs_season").CurrentStage = 2
		Tracker:FindObjectForCode("wow_season").CurrentStage = 1
		Tracker:FindObjectForCode("plain_season").CurrentStage = 0
		Tracker:FindObjectForCode("swamp_season").CurrentStage = 2
		Tracker:FindObjectForCode("sunken_season").CurrentStage = 1
		Tracker:FindObjectForCode("coast_season").CurrentStage = 3
		Tracker:FindObjectForCode("remains_season").CurrentStage = 3
		Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
	end
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 then
        for index, region in pairs(region_list) do
            Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
            Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
		end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
			for index, region in pairs(region_list) do
				Tracker:FindObjectForCode(region.."_season").CurrentStage = 4
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 4
			end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 3 then
        for index, region in pairs(region_list) do
            Tracker:FindObjectForCode(region.."_season").CurrentStage = 0
				if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
					Tracker:FindObjectForCode("horon_village_season").CurrentStage = 0
				end
			end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 4 then
        for index, region in pairs(region_list) do
            Tracker:FindObjectForCode(region.."_season").CurrentStage = 1
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 1
			end
        end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 5 then
        for index, region in pairs(region_list) do
            Tracker:FindObjectForCode(region.."_season").CurrentStage = 2
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 2
			end
        end
	elseif Tracker:FindObjectForCode("default_seasons").CurrentStage == 6 then
        for index, region in pairs(region_list) do
            Tracker:FindObjectForCode(region.."_season").CurrentStage = 3
			if Tracker:FindObjectForCode("horon_village_season_shuffle").CurrentStage == 1 then
				Tracker:FindObjectForCode("horon_village_season").CurrentStage = 3
			end
        end
	end
end

function display_seasons()
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 1 then
		if Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
		
			Tracker:FindObjectForCode("north_horon_season").CurrentStage = Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage
			Tracker:FindObjectForCode("suburbs_season").CurrentStage = Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage
			Tracker:FindObjectForCode("wow_season").CurrentStage = Tracker:FindObjectForCode("wow_season_hidden").CurrentStage
			Tracker:FindObjectForCode("plain_season").CurrentStage = Tracker:FindObjectForCode("plain_season_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_season").CurrentStage = Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage
			Tracker:FindObjectForCode("sunken_season").CurrentStage = Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage
			Tracker:FindObjectForCode("coast_season").CurrentStage = Tracker:FindObjectForCode("coast_season_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_season").CurrentStage = Tracker:FindObjectForCode("remains_season_hidden").CurrentStage
    	end
	end
	if Tracker:FindObjectForCode("default_seasons").CurrentStage == 2 then
		if Tracker:FindObjectForCode("fill_seasons").CurrentStage == 1 then
		
			Tracker:FindObjectForCode("north_horon_season").CurrentStage = Tracker:FindObjectForCode("north_horon_season_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_village_season").CurrentStage = Tracker:FindObjectForCode("horon_village_season_hidden").CurrentStage
			Tracker:FindObjectForCode("suburbs_season").CurrentStage = Tracker:FindObjectForCode("suburbs_season_hidden").CurrentStage
			Tracker:FindObjectForCode("wow_season").CurrentStage = Tracker:FindObjectForCode("wow_season_hidden").CurrentStage
			Tracker:FindObjectForCode("plain_season").CurrentStage = Tracker:FindObjectForCode("plain_season_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_season").CurrentStage = Tracker:FindObjectForCode("swamp_season_hidden").CurrentStage
			Tracker:FindObjectForCode("sunken_season").CurrentStage = Tracker:FindObjectForCode("sunken_season_hidden").CurrentStage
			Tracker:FindObjectForCode("coast_season").CurrentStage = Tracker:FindObjectForCode("coast_season_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_season").CurrentStage = Tracker:FindObjectForCode("remains_season_hidden").CurrentStage
		end
	end
end

function vanilla_portals()
    local portal_list = {"suburbs","swamp","lake","mtcucco","horon","remains","d8"}
	if Tracker:FindObjectForCode("portalshuffle").CurrentStage == 0 then
        for index, portal in pairs(portal_list) do
            Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = index
        end
	else
        for index, portal in pairs(portal_list) do
            Tracker:FindObjectForCode(portal.."_portal_selector").CurrentStage = 0
        end
	end
end

function display_portals()
	if Tracker:FindObjectForCode("fill_portals").CurrentStage == 1 then
		if Tracker:FindObjectForCode("portalshuffle").CurrentStage == 1 then
			Tracker:FindObjectForCode("suburbs_portal_selector").CurrentStage = Tracker:FindObjectForCode("suburbs_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("swamp_portal_selector").CurrentStage = Tracker:FindObjectForCode("swamp_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("lake_portal_selector").CurrentStage = Tracker:FindObjectForCode("lake_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("mtcucco_portal_selector").CurrentStage = Tracker:FindObjectForCode("mtcucco_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("horon_portal_selector").CurrentStage = Tracker:FindObjectForCode("horon_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("remains_portal_selector").CurrentStage = Tracker:FindObjectForCode("remains_portal_selector_hidden").CurrentStage
			Tracker:FindObjectForCode("d8_portal_selector").CurrentStage = Tracker:FindObjectForCode("d8_portal_selector_hidden").CurrentStage
        end
	end
end

ScriptHost:AddWatchForCode("dungeon settings handler", "dungeonshuffle", dungeon_settings)
ScriptHost:AddWatchForCode("dungeons handler", "fill_dungeons", display_dungeons)
ScriptHost:AddWatchForCode("seasons settings handler", "default_seasons", seasons_settings)
ScriptHost:AddWatchForCode("seasons handler", "fill_seasons", display_seasons)
ScriptHost:AddWatchForCode("portal settings handler", "portalshuffle", vanilla_portals)
ScriptHost:AddWatchForCode("portal handler", "fill_portals", display_portals)