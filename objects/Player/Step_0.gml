// Inherit the parent event
event_inherited();

//if (!is_location() || instance_exists(obj_textbox) || instance_exists(dropdown_dialogue))
if (ControlEnv.hours >= 21 && ControlEnv.hours < 23 && !warn_sleep1){
	warn_sleep1 = true;
	instance_create_depth(0,0,-1000, Eyelid);
}

if (ControlEnv.hours >= 23 && !warn_sleep2){
	warn_sleep2 = true;
	instance_create_depth(0,0,-1000, Eyelid);
}

if (ControlEnv.hours > 23 &&ControlEnv.minutes > 30 || ControlEnv.hours < 6){
		ctb_list(d_player_sleep, noone, "Begrudgingly, you returned to your bed because you're too tired to stay awake any longer.");
}

hunger = 0;
hours_without_eating = -((undigested_calories + daily_calories)/hourly_calories_uptake);
if (hours_without_eating >= 4){	
	hunger = 1;	
}
if (hours_without_eating >=7){	
	hunger = 2;	
}
if (hours_without_eating >=12){
	/*show_debug_message("hourly_calories_uptake" + string(hourly_calories_uptake))
	show_debug_message("daily_calories" + string(daily_calories))
	show_debug_message("undigested_calories" + string(undigested_calories))
	show_debug_message("hours_without_eating" + string(hours_without_eating))*/
	if (room != rmClinic)
		room_goto(rmClinic);
	else{
		daily_calories = 0;
		global.last_dest = rmClinic;
		time_forward_minutes(30);
		Nurse.bills += 100;
		ctb_list(noone, noone, "You collapsed from hunger and was taken to the clinic. Please pay the medical bill before you leave. ");
	}
}

if (last_hours_without_eating>=4 && last_hours_without_eating < floor(hours_without_eating)){
		play_stomach_sound();
}

last_hours_without_eating = floor(hours_without_eating);