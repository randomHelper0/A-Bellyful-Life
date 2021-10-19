function player_sleep(){
	global.scene_name = "Sleep";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	
	if (global.last_room == rmBedroom){
		background_set(sprBedroomCorner);
	}else
		background_set(sprBedroomResort);
	
	ctb_list(sleep_finish, noone , "z.. z.. z..");
	//sleep_finish();
	with (Player) skew_common();
}

function d_player_sleep(){
	var has_visitor = check_all_for_var(Character, "visiting", true);
	if (has_visitor){
		if (ControlEnv.hours < 23){
			ctb_msg("You have a visitor, please accompany them until the end of their stay first!");
			return;
		}
	}
	
	warn_sleep1 = false;
	warn_sleep2 = false;
	
	global.scene_script = player_sleep
	scene_start();
}

function d_player_bed(){
	dialogue_init();
	
	var sleep = strlan(EN, "Sleep until 6 am",
		RUS, "Спи до 6 утра", JP, "午前6時まで寝る", CN, "睡到早上六点");

	if !(ControlEnv.hours >= 21 || ControlEnv.hours < 6)
		dialogue_create(
		"1",
		sleep,
		false,
		strlan(EN, "It's still too early. You usually go to bed at around 9pm",
					CN, "现在太早了。你一般晚上9点才去睡觉。",
					JP, "（まだ、眠くない。ベッドで寝たい場合は21時以降になる必要がある）",
					RUS, "Слишком рано. Обычно ты ложишься в кровать около 9 вечера"
				)
		)
	else //if (ControlEnv.hours >= 21 || ControlEnv.hours < 6)
		dialogue_create(
		"1",
		sleep,
		true,
		d_player_sleep
		)
		
	/*dialogue_create(
		"2",
		"Massage belly",
		false,
		"Incomplete Scene"
		//d_player_massage
		)*/
	
	dialogue_start(true);
}

function sleep_finish(){
//var temp = Player.hours_without_eating;
	/*if (ControlEnv.hours > 21){
    //show_message(string(24 - ControlEnv.hours + 6));
	    time_forward_hour(24 - ControlEnv.hours + 6);
	}
	else
	    time_forward_hour(6 - ControlEnv.hours);*/
	
	time_forward_minutes(6*60);
	ControlEnv.hours = 6;
	ControlEnv.minutes = 10;
	
	with (Character){
	var mult = 300;
	if (object_index != Player)
		mult = 200;
	
	////////////////////////////////
	inc_stomach = (daily_stomach_content/daily_minutes)*mult;
	inc_bowels = (daily_bowels_content/daily_minutes)*mult;
	
	//show_message(str(inc_stomach) + " =( " + str(daily_stomach_content) + "/" + str(daily_minutes)+")*" + str(mult));
	//show_message(str(inc_bowels) + " =( " + str(daily_bowels_content) + "/" + str(daily_minutes)+")*" + str(mult));
	//inc_stomach = 0;
	//inc_bowels = 0;
	
		//ctb_list(noone, noone, string(inc_stomach) + ", " + string(inc_bowels));
	stomach_capacity += inc_stomach;
	bowels_capacity += inc_bowels;
	
	////////////////////////////////
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
	Player.warn_sleep1 = false;
	Player.warn_sleep2 = false;
	
	//if (daily_calories < 0)
	var last_fat = Player.fat_calories,
		msg_weight = "", msg_capacity = "";
	Player.fat_calories += Player.daily_calories;
	
	if (Player.daily_calories> 0)
		msg_weight = strlan(
										EN,"You gained some weight.",
										CN, "你增加了一些体重",
										JP, "体重が増えました。",
										RUS, "Ты набрала немного вес."
									);
	else if (Player.daily_calories < 0)
		msg_weight = strlan(
										EN, "You lost some weight.",
										CN, "你体重掉了一些",
										JP, "体重が減りました。",
										RUS, "Ты сбросила немного вес."
									);
		
	msg_capacity = strlan(
										EN, "Your stomach capacity increased by ",
										CN, "你的腹部容量增加了",
										JP, "胃の容量が増えました。",
										RUS, "Вместимость твоего желудка увеличилась на"
									) + string(Player.inc_stomach) 
									+ "cc. " + 
									strlan(
										EN, "Your bowels capacity increased by ",
										CN, "你的肠内容量增加了",
										JP, "腸内の容量が増えました。",
										RUS, "Вместимость твоего кишечника увеличилась на"
									) + string(Player.inc_bowels) + "cc.";
	var script = noone;
	//if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom)
	if (ControlEnv.go_resort)
		script = resort_trigger;
	ctb_list(script, noone,
		msg_weight, msg_capacity	
	)
	
	/*if (ControlEnv.resort_days <= 0 && global.last_room == rmBedroomResort)
		script = resort_return_trigger;
	ctb_list(script, noone,
		msg_weight, msg_capacity	
	)*/
	
	FatbucksCashier.last_cancelled --;	
	FataurantCashier.last_cancelled --;	
	FatdonaldsCashier.last_cancelled --;	
	
	Yumi.gave_exam_today = false;
	Amber.jogged_today = false;
	Bambi.player_helped = false;
	
	ControlEnv.battery = 30*60*3;
	with(Character){
		status_notify[? "pill_diet" ] = 15;
		status_notify[? "pill_digest" ] = 15;
		status_notify[? "pill_gas" ] = 15;
		status_notify[? "pill_noise" ] = 15;
		status_notify[? "pill_laxative" ] = 15;
	}
	

	
	//if (ControlEnv.resort_days  > 0)
		//ControlEnv.resort_days--;
	//custom_goto(rmBedroom);
}

function d_player_massage(){
	
}

function resort_trigger(){
		if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom){
			ds_list_clear(global.scene_actors);
		global.last_room = rmBedroomResort;	
		ButtonMap.last_map = rmMapResort;
		//global.scene_name = "Back";
		ctb_list(noone, noone, "[speaker:noone][set_background:sprPacking]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for the resort.")
	}else if (ControlEnv.resort_days <= 0 && global.last_room != rmBedroom){
		ds_list_clear(global.scene_actors);
		ctb_list(noone, noone, "[speaker:noone]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for home.")
		global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}
	ControlEnv.resort_days--;
	btArrowNavi.target_room = global.last_room;
}

/*function resort_return_trigger(){
		if (ControlEnv.resort_days > 0 && global.last_room == rmBedroom){
			ds_list_clear(global.scene_actors);
		global.last_room = rmBedroomResort;	
		ButtonMap.last_map = rmMapUni;
		//global.scene_name = "Back";
		ctb_list(noone, noone, "[speaker:noone][set_background:sprPacking]You woke up early at 4am to finalize your luggage.",
				"[set_background:sprAirport]You arrived just in time before your flight leaves for home.")
			global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}else if (ControlEnv.resort_days <= 0 && global.last_room != rmBedroom){
		global.last_room = rmBedroom;	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
		ButtonMap.last_map = rmMapUni;
	}
	
	btArrowNavi.target_room = global.last_room;
}*/