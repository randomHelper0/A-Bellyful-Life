function player_sleep(){
	global.scene_name = "Sleep";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprBedroomCorner);
	
	ctb_list(sleep_finish, noone , "z.. z.. z..");
	//sleep_finish();
	with (Player) skew_common();
}

function d_player_sleep(){
	warn_sleep1 = false;
	warn_sleep2 = false;
	
	global.scene_script = player_sleep
	scene_start();
}

function d_player_bed(){
	if !(ControlEnv.hours >= 21 || ControlEnv.hours < 6)
		return;
	
	dialogue_init();
	if (ControlEnv.hours >= 21 || ControlEnv.hours < 6)
		dialogue_create(
		"1",
		"Sleep until 6 am",
		true,
		d_player_sleep
		)
		
	dialogue_create(
		"2",
		"Massage belly",
		false,
		"Incomplete Scene"
		//d_player_massage
		)
	
	dialogue_start(true);
}

function sleep_finish(){
//var temp = Player.hours_without_eating;
	if (ControlEnv.hours > 21){
    //show_message(string(24 - ControlEnv.hours + 6));
	    time_forward_hour(24 - ControlEnv.hours + 6);
	}
	else
	    time_forward_hour(6 - ControlEnv.hours);
	
	with (Character){
	var mult = 250;
	if (object_index != Player)
		mult = 600;
		
	inc_stomach = (daily_stomach_content/daily_minutes)*mult;
	inc_bowels = (daily_bowels_content/daily_minutes)*mult;
		//ctb_list(noone, noone, string(inc_stomach) + ", " + string(inc_bowels));
	stomach_capacity += inc_stomach;
	bowels_capacity += inc_bowels;
	
	daily_stomach_content = 0;
	daily_bowels_content = 0
	daily_minutes = 0;
	}
	
	if (Player.pool_pass > 0)
		Player.pool_pass --;
    
	//Player.hours_without_eating  = temp;
	Player.energy = Player.energy_max;
	with (Character){
			jittery = 0;
			alcohol = 0;
			visited = false;
			if (object_index != Player){
					
			}
	}
	Player.mood = 100;
	Player.shower_times = 0;
	Player.TV_times = 0;
	
	//if (daily_calories < 0)
	var last_fat = Player.fat_calories,
		msg_weight = "", msg_capacity = "";
	Player.fat_calories += Player.daily_calories;
	
	if (Player.daily_calories> 0)
		msg_weight = "You gained some weight.";
	else if (Player.daily_calories < 0)
		msg_weight = "You lost some weight.";
		
	msg_capacity = "Your stomach capacity increased by " + string(Player.inc_stomach) 
		+"cc. Your bowels capacity increased by" + string(Player.inc_bowels) + "cc.";
	
	ctb_list(noone, noone,
		msg_weight, msg_capacity	
	)
	
	with (FatbucksCashier){
		last_cancelled --;	
	}
	
	//room_goto(rmBedroom);
}

function d_player_massage(){
	
}