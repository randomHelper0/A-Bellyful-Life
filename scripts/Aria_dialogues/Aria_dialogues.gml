function aria_dialogue(){
	dialogue_init()
	
	if (Aria.practice > 2 && in_house())
	dialogue_create(
	        "1",
	        strlan(
				EN, "Let's do more swim practice! (1hr)",
				RUS, "RUS NOT ADDED :<",
				CN, "我们一起来做更多的游泳练习!(1hr)",
				JP, "もっと水泳のレッスンをしよう！(1時間)"
			),
	        true,
			aria_more_practice
	)
	
	eating_out_ask(Aria);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Aria_eating_out(){
	exelan("msg_Aria_eating_out");
}

function aria_more_practice(){
	character_finish_visit(Aria);
	Aria.likability += 5;
	global.scene_script = aria_practice_scene;
	time_forward_minutes(15);
	scene_start_from(rmPool);
}

function aria_intro_scene(){
	global.scene_name = "Aria Intro";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	global.show_follower = false;
	//scene_add_actors(Player, noone, noone);
	background_set(sprAriaIntro1);
	time_forward_minutes(30);
	if (ControlEnv.hours < 9)
		ControlEnv.hours = 9;
	exelan("msg_Aria_rescue_start");
	Aria.just_rescued = true;
	Aria.finished_intro = true;
}

function aria_practice_scene(){
	Aria.practice ++;	
	Aria.finished_pump = false;
	global.scene_name = "PracticeAfterPump";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	global.scene_exit = false;
	Aria.likability += 5;
	//scene_add_actors(Player, noone, noone);
	
	if (Aria.bowels_pressure <= 0)
		background_set(asset_get_index("sprAriaPractice" + string(Aria.practice)));
	else{
		//var frac = Aria.total_content/Aria.total_capacity;
		//Aria.total_content*=1.5;
		with (Aria) skew_none();
		scene_add_actors(Aria, noone, noone);
	}
	//time_forward_minutes(60);
	ControlEnv.hours ++;
	
	if (ControlEnv.hours < 9){
		ControlEnv.hours = 9;
		ControlEnv.minutes = 0;
	}
	
	exelan("msg_Aria_practice");
		
	//Aria.stomach_capacity += Aria.stomach_pressure * 50;
	ControlEnv.money += 30;
}

function aria_intro_pump(){
	Aria.finished_intro_pump = true;
	global.scene_name = "Aria Intro Pump";
	global.scene_inflate_rate = 0;
	global.scene_pressure_match = 1.1;
	global.scene_interface = false;
	global.scene_exit = false;
	//scene_add_actors(Player, noone, noone);
	background_set(sprAria_Pump_intro);
	
	exelan("msg_Aria_first_pump");
}

function aria_pump(){
	Aria.finished_pump = true;
	global.scene_name = "Pump";
	global.scene_inflate_rate = 2;
	scene_add_actors(Aria, ANAL, AIR);
	global.scene_sound_action = list_create(sndAirpump);
	background_set(sprLockerroom);
	//ctb_list(noone, rmPool , "stufffff");
}

function checkAriaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool && !in_dialogue() && is_location());
}

function aria_after_first_pump(){
	exelan("msg_Aria_after_first_pump");
}