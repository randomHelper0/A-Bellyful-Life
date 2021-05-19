/// @description time_forward(minutes)
/// @param minutes
function time_forward_minutes(argument0) {
	var minutes = ceil(argument0);
	if (Player.alcohol >= 30 && floor(random(100) <= Player.alcohol)) {
		minutes *= Player.alcohol/100 + 1;
		minutes = ceil(minutes);
		ControlEnv.blur = random_range(Player.alcohol/2, Player.alcohol);
	}

	Player.daily_calories -= Player.min_calories_uptake * minutes;
	
	ControlEnv.raining -= min(ControlEnv.raining,minutes);

	global.temp = minutes;
	
	with (Item){
		if (!is_template && do_expire){
				if (!in_fridge)
					expire_in -= global.temp;
				else
					expire_in -= global.temp/5;
		}
	}
	
	tick_all(minutes/60);
	
	var temp = ControlEnv.hours;
	while (minutes >= 60){
	    ControlEnv.hours ++;
	    minutes -= 60;
	}

	ControlEnv.minutes += minutes;
	if (ControlEnv.minutes >= 60){
	    ControlEnv.hours ++;
	    ControlEnv.minutes -= 60;
	}

	if (ControlEnv.hours >= 24){
	    ControlEnv.hours = 0;
	    ControlEnv.day ++;
	}
	
	global.temp = minutes;
	
	with (Character){
		character_tick(global.temp);
	}
	if (ControlEnv.hours != temp)
		Player.hours_without_eating ++;

	refresh_location();

	var rain_chance = (minutes/60)/10;
	if (random(1) <= rain_chance){
		ControlEnv.raining += random_range(30, 240);	
	}

}
