
-- SUBROSIA NAVIGATION

function portal_suburbs_enter()
	return use_seeds() and has("emberseeds") or
	destroy_bush_flute() and (has("flippers") or (has("bracelet") and max_jump() >= 1)) and cross_natzu() and cross_water_suburbs() or
	destroy_bush_flute() and (has("bracelet") or has("flippers") or dimitri()) and (has("flippers") or jump_liquid4()) and has("bracelet") and has("shovel") or
	
	(has("shuffledungeonon") and
		(has("d0_d2") or

		has("d1_d2") and has("d1key") and destroy_bush_flute() or

		(has("d3_d2") and (destroy_bush_flute() and (has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) and 
		((max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or 
		(destroy_bush_flute() and (has("flippers") or dimitri()) and destroy_bush_flute()))
		
		and (has("plain_summer") or has("summer") or jump4() or ricky() or moosh())) 
		and hit_lever() and has("bracelet") and has("d3key") and 
		((has("satchel1") and has("pegasusseeds")) or has("flippers") or max_jump() >= 1)) or

		(has("d4_d2") and (destroy_bush_flute() and (has("flippers") or jump_liquid4()) and has("shovel"))


		and (has("spring") or has("sunken_spring")) and (has("winter") or has("sunken_winter")) and (has("summer") or has("sunken_summer")) and has("d4key"))
		  or

		has("d5_d2") and ((max_jump() >= 1 or ricky() or moosh()) and
		 ((has("winter") or has("north_winter"))  or
		 wet_lake() and (has("flippers") or (dimitri() and has("bracelet")))) and
		(destroy_mushroom() or dimitri()) and (has("fall") or (has("north_fall") and (has("flippers") or (dimitri() and has("bracelet")) or (has("winter") and dimitri())) or 
		(has("winter") and has("fall") and (max_jump() >= 1 or ricky() or moosh())))) or

		has("d6_d2")
		 and (((has("bracelet") and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
		 destroy_bush_flute() and (has("flippers") or dimitri()) and destroy_bush_flute()) and (has("plain_summer") or has("summer") or jump4() or ricky() or moosh())) and jewel_check())
		  and destroy_mushroom() and
		has("winter") and has("spring") and has("summer") and has("fall") and destroy_flower() and (has("shovel") or ((has("satchel1") or
		has("slingshot1")) and has("emberseeds"))) or

		has("d7_d2")
		 and (pirate_ship() and (has("coast_summer") or (has("bombs") and jump3() and has("summer"))))
		) 
		or has("d8_d2") and d8_no_suburbs()
	) and 
			torches() and kill_normal() and has("bracelet"))

end

function portal_swamp_enter()
	return has("bracelet") and 
	(drained_swamp() or 
	((destroy_bush_flute() and (has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) or
	use_seeds() and has("emberseeds") and cross_water_suburbs() and (has("spring") or has("suburbs_spring")) and cross_natzu() or
	(d8_exit() or remains_exit()) and jump3()) and (max_jump() >= 1 or has("plain_winter") or ricky() or moosh()) or
	destroy_bush_flute() and (has("flippers") or dimitri()) and destroy_bush_flute() or
	(d8_exit() or remains_exit()) and jump3()) and (dimitri() or has("flippers")))
end

function portal_lake_enter()
	return destroy_bush_flute() and
		((((has("north_winter") or has("north_spring") or has("north_fall") or
		has("winter") or has("spring") or has("fall")) and (max_jump() >= 1 or ricky() or moosh()) and
		(has("flippers") or (dimitri() and has("bracelet")))) or
		(jump_liquid4() and (has("north_winter") or has("winter")))) or
		dimitri() and  max_jump() >= 1 and (has("winter") or has("north_winter")))
end

function portal_mtcucco_enter()
	return  ((((has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) and cross_natzu()) or
	(use_seeds() and has("emberseeds") and cross_water_suburbs() and (has("spring") or has("suburbs_spring"))))

		and (has("flippers") or has("sunken_winter") or max_jump() >= 1) and has("flippers") and (has("sunken_summer") or has("summer"))) or

		destroy_bush_flute() and (has("bracelet") or has("flippers") or dimitri()) and (has("flippers") or jump_liquid4()) and has("bracelet") and has("shovel") or
		((exit_front_d2_b() and has("d2_d4")) or (exit_front_d0() and has("d0_d4"))) and (has("sunken_summer") or has("sunken_winter"))
end
	
function portal_village_enter()
	return has("magicboomerang") or
		jump6()
end

function portal_remains_enter()
	return (((has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) or
		(use_seeds() and has("emberseeds") and cross_water_suburbs() and (has("spring") or has("suburbs_spring")) and cross_natzu())) and jump3()) and 
		((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))
		)
	)
end

function portal_d8_enter()
	return ((has("bracelet") or (has("flippers") and destroy_bush_flute()) or dimitri()) or
	use_seeds() and has("emberseeds") and cross_water_suburbs() and (has("spring") or has("suburbs_spring")) and cross_natzu()) and jump3() and
	
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or --what to do in spring
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or --what to do in summer
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and --what to do in autumn
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mountain()
		if has("portalshuffleoff") then
			return
				portal_suburbs_enter()
		elseif has("portalshuffleon") then
			return
				portal_suburbs_enter() and has("suburbs_mountainsub") or
				portal_swamp_enter() and has("swamp_mountainsub") or
				portal_lake_enter() and has("lake_mountainsub") or
				portal_mtcucco_enter() and has("mtcucco_mountainsub") or
				portal_village_enter() and has("horon_mountainsub") or
				portal_remains_enter() and has("remains_mountainsub") or
				portal_d8_enter() and has("d8_mountainsub")
		end
end

function market()
		if has("portalshuffleoff") then
			return 
				portal_swamp_enter()
		elseif has("portalshuffleon") then
			return
				portal_suburbs_enter() and has("suburbs_marketsub") or
				portal_swamp_enter() and has("swamp_marketsub") or
				portal_lake_enter() and has("lake_marketsub") or
				portal_mtcucco_enter() and has("mtcucco_marketsub") or
				portal_village_enter() and has("horon_marketsub") or
				portal_remains_enter() and has("remains_marketsub") or
				portal_d8_enter() and has("d8_marketsub")
	end
end

function furnace()
		if has("portalshuffleoff") then
			return 
				portal_lake_enter()
		elseif has("portalshuffleon") then
			return
				portal_suburbs_enter() and has("suburbs_furnacesub") or
				portal_swamp_enter() and has("swamp_furnacesub") or
				portal_lake_enter() and has("lake_furnacesub") or
				portal_mtcucco_enter() and has("mtcucco_furnacesub") or
				portal_village_enter() and has("horon_furnacesub") or
				portal_remains_enter() and has("remains_furnacesub") or
				portal_d8_enter() and has("d8_furnacesub")
	end
end

function village()
		if has("portalshuffleoff") then
			return 
				portal_mtcucco_enter()
		elseif has("portalshuffleon") then
			return 
				portal_suburbs_enter() and has("suburbs_villagesub") or
				portal_swamp_enter() and has("swamp_villagesub") or
				portal_lake_enter() and has("lake_villagesub") or
				portal_mtcucco_enter() and has("mtcucco_villagesub") or
				portal_village_enter() and has("horon_villagesub") or
				portal_remains_enter() and has("remains_villagesub") or
				portal_d8_enter() and has("d8_villagesub")
		end
end

function pirates()
		if has("portalshuffleoff") then
			return 
				portal_village_enter()
		elseif has("portalshuffleon") then
			return  
				portal_suburbs_enter() and has("suburbs_piratessub") or
				portal_swamp_enter() and has("swamp_piratessub") or
				portal_lake_enter() and has("lake_piratessub") or
				portal_mtcucco_enter() and has("mtcucco_piratessub") or
				portal_village_enter() and has("horon_piratessub") or
				portal_remains_enter() and has("remains_piratessub") or
				portal_d8_enter() and has("d8_piratessub")
	end
end

function volcano()
		if has("portalshuffleoff") then
			return 
				portal_remains_enter()
		elseif has("portalshuffleon") then
			return  
				portal_suburbs_enter() and has("suburbs_volcanosub") or
				portal_swamp_enter() and has("swamp_volcanosub") or
				portal_lake_enter() and has("lake_volcanosub") or
				portal_mtcucco_enter() and has("mtcucco_volcanosub") or
				portal_village_enter() and has("horon_volcanosub") or
				portal_remains_enter() and has("remains_volcanosub") or
				portal_d8_enter() and has("d8_volcanosub")
	end
end

function d8()
		if has("portalshuffleoff") then
			return 
				portal_d8_enter()
		elseif has("portalshuffleon") then
			return   
				portal_suburbs_enter() and has("suburbs_d8sub") or
				portal_swamp_enter() and has("swamp_d8sub") or
				portal_lake_enter() and has("lake_d8sub") or
				portal_mtcucco_enter() and has("mtcucco_d8sub") or
				portal_village_enter() and has("horon_d8sub") or
				portal_remains_enter() and has("remains_d8sub") or
				portal_d8_enter() and has("d8_d8sub") or
				exit_front_d2_b() and has("d8_d2")
	end
end


function mountain_no_suburbs()
	if has("portalshuffleoff") then
		return
			portal_suburbs_enter()
	elseif has("portalshuffleon") then
		return
			portal_swamp_enter() and has("swamp_mountainsub") or
			portal_lake_enter() and has("lake_mountainsub") or
			portal_mtcucco_enter() and has("mtcucco_mountainsub") or
			portal_village_enter() and has("horon_mountainsub") or
			portal_remains_enter() and has("remains_mountainsub") or
			portal_d8_enter() and has("d8_mountainsub")
	end
end

function market_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_swamp_enter()
	elseif has("portalshuffleon") then
		return
			portal_swamp_enter() and has("swamp_marketsub") or
			portal_lake_enter() and has("lake_marketsub") or
			portal_mtcucco_enter() and has("mtcucco_marketsub") or
			portal_village_enter() and has("horon_marketsub") or
			portal_remains_enter() and has("remains_marketsub") or
			portal_d8_enter() and has("d8_marketsub")
end
end

function furnace_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_lake_enter()
	elseif has("portalshuffleon") then
		return
			portal_swamp_enter() and has("swamp_furnacesub") or
			portal_lake_enter() and has("lake_furnacesub") or
			portal_mtcucco_enter() and has("mtcucco_furnacesub") or
			portal_village_enter() and has("horon_furnacesub") or
			portal_remains_enter() and has("remains_furnacesub") or
			portal_d8_enter() and has("d8_furnacesub")
end
end

function village_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_mtcucco_enter()
	elseif has("portalshuffleon") then
		return 
			portal_swamp_enter() and has("swamp_villagesub") or
			portal_lake_enter() and has("lake_villagesub") or
			portal_mtcucco_enter() and has("mtcucco_villagesub") or
			portal_village_enter() and has("horon_villagesub") or
			portal_remains_enter() and has("remains_villagesub") or
			portal_d8_enter() and has("d8_villagesub")
	end
end

function pirates_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_village_enter()
	elseif has("portalshuffleon") then
		return  
			portal_swamp_enter() and has("swamp_piratessub") or
			portal_lake_enter() and has("lake_piratessub") or
			portal_mtcucco_enter() and has("mtcucco_piratessub") or
			portal_village_enter() and has("horon_piratessub") or
			portal_remains_enter() and has("remains_piratessub") or
			portal_d8_enter() and has("d8_piratessub")
end
end

function volcano_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_remains_enter()
	elseif has("portalshuffleon") then
		return  
			portal_swamp_enter() and has("swamp_volcanosub") or
			portal_lake_enter() and has("lake_volcanosub") or
			portal_mtcucco_enter() and has("mtcucco_volcanosub") or
			portal_village_enter() and has("horon_volcanosub") or
			portal_remains_enter() and has("remains_volcanosub") or
			portal_d8_enter() and has("d8_volcanosub")
end
end

function d8_no_suburbs()
	if has("portalshuffleoff") then
		return 
			portal_d8_enter()
	elseif has("portalshuffleon") then
		return   
			portal_swamp_enter() and has("swamp_d8sub") or
			portal_lake_enter() and has("lake_d8sub") or
			portal_mtcucco_enter() and has("mtcucco_d8sub") or
			portal_village_enter() and has("horon_d8sub") or
			portal_remains_enter() and has("remains_d8sub") or
			portal_d8_enter() and has("d8_d8sub")
end
end

function mountain_exit()
	return
		mountain() or
		market() and
			max_jump() >= 1 or
		furnace() and
			max_jump() >= 1 and (jump4() or (jump2() and has("bracelet") or has("magnet"))) or
		village() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		volcano() and
			jump_liquid3() and has("bracelet")
end

function market_exit()
	return
		mountain() and
			max_jump() >= 1 or
		market() or
		furnace() and
			max_jump() >= 1 and (jump4() or ((jump2() and has("bracelet")) or has("magnet"))) or
		village() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		volcano() and
			jump_liquid3() and has("bracelet")
end

function furnace_exit()
	return 
		mountain() and
			(jump4() or (max_jump() >= 1 and has("magnet"))) or
		market() and
			(jump4() or (max_jump() >= 1 and has("magnet"))) or
		furnace() or
		village() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		volcano() and
			jump_liquid3() and has("bracelet")
end

function village_exit()
	return
		mountain() and
			jump_liquid4() or
		market() and
			jump_liquid4() or
		furnace() and
			jump_liquid4() or
		village() or
		pirates() and
			has("feather") or
		volcano() and
			jump_liquid4() and has("bracelet")
end

function pirates_exit()
	return 
		mountain() and
			jump_liquid4() or
		market() and
			jump_liquid4() or
		furnace() and
			jump_liquid4() or
		village() and
			max_jump() >= 1 or
		volcano() and
			jump_liquid4() and has("bracelet") or
		pirates()
end



function mountain_exit_no_suburbs()
	return
		mountain_no_suburbs() or
		market_no_suburbs() and
			max_jump() >= 1 or
		furnace_no_suburbs() and
			max_jump() >= 1 and (jump4() or (jump_no_suburbs() and has("bracelet") or has("magnet"))) or
		village_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3s() or has("magnet")))) or
		volcano_no_suburbs() and
			jump_liquid3() and has("bracelet")
end

function market_exit_no_suburbs()
	return
		mountain_no_suburbs() and
			max_jump() >= 1 or
		market_no_suburbs() or
		furnace_no_suburbs() and
			max_jump() >= 1 and (jump4() or ((jump_no_suburbs() and has("bracelet")) or has("magnet"))) or
		village_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		volcano_no_suburbs() and
			jump_liquid3() and has("bracelet")
end

function furnace_exit_no_suburbs()
	return 
		mountain_no_suburbs() and
			(jump4() or (max_jump() >= 1 and has("magnet"))) or
		market_no_suburbs() and
			(jump4() or (max_jump() >= 1 and has("magnet"))) or
		furnace_no_suburbs() or
		village_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		pirates_no_suburbs() and
			(jump_liquid4() or (has("bracelet") and max_jump() >= 1 and (jump3() or has("magnet")))) or
		volcano_no_suburbs() and
			jump_liquid3() and has("bracelet")
end

function village_exit_no_suburbs()
	return
		mountain_no_suburbs() and
			jump_liquid4() or
		market_no_suburbs() and
			jump_liquid4() or
		furnace_no_suburbs() and
			jump_liquid4() or
		village_no_suburbs() or
		pirates_no_suburbs() and
			has("feather") or
		volcano_no_suburbs() and
			jump_liquid4() and has("bracelet")
end

function pirates_exit_no_suburbs()
	return 
		mountain_no_suburbs() and
			jump_liquid4() or
		market_no_suburbs() and
			jump_liquid4() or
		furnace_no_suburbs() and
			jump_liquid4() or
		village_no_suburbs() and
			max_jump() >= 1 or
		volcano_no_suburbs() and
			jump_liquid4() and has("bracelet") or
		pirates_no_suburbs()
end



function suburbs_exit()
    if has("portalshuffleoff") then
        return mountain_exit()
    elseif has("portalshuffleon") then
        return has("suburbs_mountainsub") and mountain_exit() or
               has("suburbs_marketsub") and market_exit() or
               has("suburbs_furnacesub") and furnace_exit() or
               has("suburbs_villagesub") and village_exit() or
               has("suburbs_piratessub") and pirates_exit()
    end
end

function swamp_exit()
    if has("portalshuffleoff") then
        return market_exit()
    elseif has("portalshuffleon") then
        return has("swamp_mountainsub") and mountain_exit() or
               has("swamp_marketsub") and market_exit() or
               has("swamp_furnacesub") and furnace_exit() or
               has("swamp_villagesub") and village_exit() or
               has("swamp_piratessub") and pirates_exit()
    end
end

function lake_exit()
    if has("portalshuffleoff") then
        return furnace_exit()
    elseif has("portalshuffleon") then
        return has("lake_mountainsub") and mountain_exit() or
               has("lake_marketsub") and market_exit() or
               has("lake_furnacesub") and furnace_exit() or
               has("lake_villagesub") and village_exit() or
               has("lake_piratessub") and pirates_exit()
    end
end

function mt_cucco_exit()
    if has("portalshuffleoff") then
        return village_exit()
    elseif has("portalshuffleon") then
        return has("mtcucco_mountainsub") and mountain_exit() or
               has("mtcucco_marketsub") and market_exit() or
               has("mtcucco_furnacesub") and furnace_exit() or
               has("mtcucco_villagesub") and village_exit() or
               has("mtcucco_piratessub") and pirates_exit()
    end
end

function horon_exit()
    if has("portalshuffleoff") then
        return pirates_exit()
    elseif has("portalshuffleon") then
        return has("horon_mountainsub") and mountain_exit() or
               has("horon_marketsub") and market_exit() or
               has("horon_furnacesub") and furnace_exit() or
               has("horon_villagesub") and village_exit() or
               has("horon_piratessub") and pirates_exit()
    end
end

function remains_exit()
    if has("portalshuffleoff") then
        return false
    elseif has("portalshuffleon") then
        return has("remains_mountainsub") and mountain_exit() or
               has("remains_marketsub") and market_exit() or
               has("remains_furnacesub") and furnace_exit() or
               has("remains_villagesub") and village_exit() or
               has("remains_piratessub") and pirates_exit()
    end
end

function d8_exit()
    if has("portalshuffleoff") then
        return false
    elseif has("portalshuffleon") then
        return has("d8_mountainsub") and mountain_exit() or
               has("d8_marketsub") and market_exit() or
               has("d8_furnacesub") and furnace_exit() or
               has("d8_villagesub") and village_exit() or
               has("d8_piratessub") and pirates_exit()
    end
end

function swamp_exit_no_suburbs()
    if has("portalshuffleoff") then
        return market_exit_no_suburbs()
    elseif has("portalshuffleon") then
        return has("swamp_mountainsub") and mountain_exit_no_suburbs() or
               has("swamp_marketsub") and market_exit_no_suburbs() or
               has("swamp_furnacesub") and furnace_exit_no_suburbs() or
               has("swamp_villagesub") and village_exit_no_suburbs() or
               has("swamp_piratessub") and pirates_exit_no_suburbs()
    end
end

function lake_exit_no_suburbs()
    if has("portalshuffleoff") then
        return furnace_exit_no_suburbs()
    elseif has("portalshuffleon") then
        return has("lake_mountainsub") and mountain_exit_no_suburbs() or
               has("lake_marketsub") and market_exit_no_suburbs() or
               has("lake_furnacesub") and furnace_exit_no_suburbs() or
               has("lake_villagesub") and village_exit_no_suburbs() or
               has("lake_piratessub") and pirates_exit_no_suburbs()
    end
end

function mt_cucco_exit_no_suburbs()
    if has("portalshuffleoff") then
        return village_exit_no_suburbs()
    elseif has("portalshuffleon") then
        return has("mtcucco_mountainsub") and mountain_exit_no_suburbs() or
               has("mtcucco_marketsub") and market_exit_no_suburbs() or
               has("mtcucco_furnacesub") and furnace_exit_no_suburbs() or
               has("mtcucco_villagesub") and village_exit_no_suburbs() or
               has("mtcucco_piratessub") and pirates_exit_no_suburbs()
    end
end

function horon_exit_no_suburbs()
    if has("portalshuffleoff") then
        return pirates_exit_no_suburbs()
    elseif has("portalshuffleon") then
        return has("horon_mountainsub") and mountain_exit_no_suburbs() or
               has("horon_marketsub") and market_exit_no_suburbs() or
               has("horon_furnacesub") and furnace_exit_no_suburbs() or
               has("horon_villagesub") and village_exit_no_suburbs() or
               has("horon_piratessub") and pirates_exit_no_suburbs()
    end
end

function remains_exit_no_suburbs()
    if has("portalshuffleoff") then
        return false
    elseif has("portalshuffleon") then
        return has("remains_mountainsub") and mountain_exit_no_suburbs() or
               has("remains_marketsub") and market_exit_no_suburbs() or
               has("remains_furnacesub") and furnace_exit_no_suburbs() or
               has("remains_villagesub") and village_exit_no_suburbs() or
               has("remains_piratessub") and pirates_exit_no_suburbs()
    end
end

function d8_exit_no_suburbs()
    if has("portalshuffleoff") then
        return false
    elseif has("portalshuffleon") then
        return has("d8_mountainsub") and mountain_exit_no_suburbs() or
               has("d8_marketsub") and market_exit_no_suburbs() or
               has("d8_furnacesub") and furnace_exit_no_suburbs() or
               has("d8_villagesub") and village_exit_no_suburbs() or
               has("d8_piratessub") and pirates_exit_no_suburbs()
    end
end

function remains_portals_to_city()
	return (remains_exit() or d8_exit()) and jump3() and 
	cross_natzu() or
	has("flippers") and has("shovel") and has("bracelet")

end

function remains_portals_to_cucco()
	return (remains_exit() or d8_exit()) and jump3() and 
	(jump_liquid4() or has("flippers")) and has("shovel") and has("bracelet")

end

function remains_portals_to_goron()
	return (remains_exit() or d8_exit()) and jump3() and 
	(jump_liquid4() or has("flippers"))

end

function remains_reenter_mt_cucco_mountain()
	return remains_portals_to_cucco() and has("mtcucco_mountainsub")
end

function remains_reenter_mt_cucco_market()
	return remains_portals_to_cucco() and has("mtcucco_marketsub")
end
	
function remains_reenter_mt_cucco_furnace()
	return remains_portals_to_cucco() and has("mtcucco_furnacesub")
end
	

function remains_reenter_mt_cucco_village()
	return remains_portals_to_cucco() and has("mtcucco_villagesub")
end	

function remains_reenter_mt_cucco_pirates()
	return remains_portals_to_cucco() and has("mtcucco_piratessub")
end
		

function remains_reenter_mt_cucco_volcano()
	return remains_portals_to_cucco() and has("mtcucco_volcanosub")
end
		
	
function remains_reenter_mt_cucco_d8()
	return remains_portals_to_cucco() and has("mtcucco_d8sub")
end

function mt_cucco_reenter_remains_mountain()
	return mt_cucco_exit() and has("remains_mountainsub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump5()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump5() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump5() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_market()
	return mt_cucco_exit() and has("remains_marketsub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_furnace()
	return mt_cucco_exit() and has("remains_furnacesub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_village()
	return mt_cucco_exit() and has("remains_villagesub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_pirates()
	return mt_cucco_exit() and has("remains_piratessub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_volcano()
	return mt_cucco_exit() and has("remains_volcanosub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_remains_d8()
	return mt_cucco_exit() and has("remains_d8sub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter"))))
end

function mt_cucco_reenter_d8_mountain()
	return mt_cucco_exit() and has("d8_mountainsub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_market()
	return mt_cucco_exit() and has("d8_marketsub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_furnace()
	return mt_cucco_exit() and has("d8_furnacesub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_village()
	return mt_cucco_exit() and has("d8_villagesub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_pirates()
	return mt_cucco_exit() and has("d8_piratessub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_volcano()
	return mt_cucco_exit() and has("d8_volcanosub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function mt_cucco_reenter_d8_d8()
	return mt_cucco_exit() and has("d8_d8sub") and has("bracelet") and jump3() and (jump_liquid4() or has("flippers")) and (has("shovel") or has("banana")) and
	((has("temple_winter") or has("winter")) and
		((has("shovel") and destroy_bush() and jump4()) or --what to do in winter
		((has("temple_spring") or has("spring")) and destroy_flower() and destroy_bush() and jump4() and has("winter")) or
		((has("temple_summer") or has("summer")) and destroy_bush() and jump4() and has("winter")) or
		((has("temple_fall") or has("fall")) and destroy_bush() and max_jump() >= 1 and has("winter")))) and
		(has("temple_summer") or has("summer")) and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_mountain()
	return d8_exit() and has("d8_mountainsub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_market()
	return d8_exit() and has("d8_marketsub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_furnace()
	return d8_exit() and has("d8_furnacesub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_village()
	return d8_exit() and has("d8_villagesub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_pirates()
	return d8_exit() and has("d8_piratessub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_volcano()
	return d8_exit() and has("d8_volcanosub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end

function remains_reenter_d8_d8()
	return d8_exit() and has("d8_d8sub") and
		(jump_liquid4() or 
		(jump_liquid2() and has("glove")))
end


function d8_reenter_remains_mountain()
	return d8_exit() and has("remains_mountainsub") and
		max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_market()
	return d8_exit() and has("remains_marketsub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_furnace()
	return d8_exit() and has("remains_furnacesub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_village()
	return d8_exit() and has("remains_villagesub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_pirates()
	return d8_exit() and has("remains_piratessub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_volcano()
	return d8_exit() and has("remains_volcanosub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function d8_reenter_remains_d8()
	return d8_exit() and has("remains_d8sub") and
	max_jump() >= 1 and (has("winter") or has("temple_winter"))
end

function reenter_mountain()
	return 
	mt_cucco_reenter_remains_mountain() or
	mt_cucco_reenter_d8_mountain() or
	remains_reenter_mt_cucco_mountain() or
	remains_reenter_d8_mountain() or
	d8_reenter_remains_mountain()
end

function reenter_market()
	return 
	mt_cucco_reenter_remains_market() or
	mt_cucco_reenter_d8_market() or
	remains_reenter_mt_cucco_market() or
	remains_reenter_d8_market() or
	d8_reenter_remains_market()
end

function reenter_furnace()
	return 
	mt_cucco_reenter_remains_furnace() or
	mt_cucco_reenter_d8_furnace() or
	remains_reenter_mt_cucco_furnace() or
	remains_reenter_d8_furnace() or
	d8_reenter_remains_furnace()
end

function reenter_village()
	return 
	mt_cucco_reenter_remains_village() or
	mt_cucco_reenter_d8_village() or
	remains_reenter_mt_cucco_village() or
	remains_reenter_d8_village() or
	d8_reenter_remains_village()
end

function reenter_pirates()
	return 
	mt_cucco_reenter_remains_pirates() or
	mt_cucco_reenter_d8_pirates() or
	remains_reenter_mt_cucco_pirates() or
	remains_reenter_d8_pirates() or
	d8_reenter_remains_pirates()
end

function reenter_volcano()
	return 
	mt_cucco_reenter_remains_volcano() or
	mt_cucco_reenter_d8_volcano() or
	remains_reenter_mt_cucco_volcano() or
	remains_reenter_d8_volcano() or
	d8_reenter_remains_volcano()
end

function reenter_d8()
	return 
	mt_cucco_reenter_remains_d8() or
	mt_cucco_reenter_d8_d8() or
	remains_reenter_mt_cucco_d8() or
	remains_reenter_d8_d8() or
	d8_reenter_remains_d8()
end

function d2_suburbs_mountain()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_mountainsub")
end

function d2_suburbs_market()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_marketsub")
end

function d2_suburbs_furnace()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_furnacesub")
end

function d2_suburbs_village()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_villagesub")
end

function d2_suburbs_pirates()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_piratessub")
end

function d2_suburbs_volcano()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_volcanosub")
end

function d2_suburbs_d8()
	return (exit_front_d2_b() or exit_d2_b()) and has("suburbs_d8sub")
end

function mountain_sub()
	return mountain_exit() or reenter_mountain() or d2_suburbs_mountain()
end

function market_sub()
	return market_exit() or reenter_market() or d2_suburbs_market()
end

function furnace_sub()
	return furnace_exit() or reenter_furnace() or d2_suburbs_furnace()
end

function village_sub()
	return village_exit() or reenter_village() or d2_suburbs_village()
end

function pirates_sub()
	return pirates_exit() or reenter_pirates() or d2_suburbs_pirates()
end

function volcano_sub()
	return (volcano() or reenter_volcano() or d2_suburbs_volcano()) and has("bracelet") and jump_liquid3()
end
