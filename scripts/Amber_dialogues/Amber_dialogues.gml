function Amber_dialogues(){
	dialogue_init()
	if (Amber.met_player && in_house())
		dialogue_create(
		        "1",
		       strlan(EN, "Let's go jogging!", 
						RUS,  "Давай пробежимся!",
						CN,"我们一起去跑步吧！",
						JP,  "ジョギングに行こ！"
					),
		        true,
				amber_more_jog
		)
	
	eating_out_ask(Amber);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Amber_eating_out(){
	exelan("msg_Amber_eating_out");
}

function amber_more_jog(){
	var minutes = 40;
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, 
			strlan(EN, "You're too tired!", RUS, "Вы слишком устали!")
		);
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_jog_minutes = minutes;
	
	Amber.likability += 5;
	character_finish_visit(Amber);
	global.scene_script = amber_jog;
	time_forward_minutes(15);
	scene_start_from(rmPark);
	global.last_dest = rmPark;
}

function amber_jog(){
	//time_forward_minutes(60);
	//ControlEnv.hours = 7;
	//ControlEnv.minutes = 50;
	Amber.likability += 5;
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	scene_add_actors(Amber, noone, noone);
	background_set(sprPark);
	Amber.jogged_today = true;
	//global.player_jog_minutes = 60;
	if (!Amber.met_player){
		Amber.met_player = true;
		Amber.has_number = true;
		exelan("msg_Amber_jog");
	}else{
		ctb_list(player_jog_finish, noone, 
			strlan(EN, "You and Amber had a nice jogging routine together.", 
						RUS,  "Вы с Эмбер вместе отлично побегали трусцой.",
						CN, "你和Amber如往常一样在一起慢跑。",
						JP, "あなたとアンバーは一緒に日課のジョギングを楽しみました。"
					)
		);	
	}

}

function Amber_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	global.allow_stream = true;
	scene_add_actors(Amber, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}