function Amber_dialogues(){
	dialogue_init()
	if (Amber.met_player)
		dialogue_create(
		        "1",
		        "Let's go jogging!",
		        true,
				amber_more_jog
		)
	
	eating_out_ask(Amber);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Amber_eating_out(){
	ctb_list(noone, noone, "thanks!");
}

function amber_more_jog(){
	character_finish_visit(Amber);
	global.scene_script = amber_jog;
	time_forward_minutes(15);
	scene_start_from(rmPark);
}

function amber_jog(){
	//time_forward_minutes(60);
	//ControlEnv.hours = 7;
	//ControlEnv.minutes = 50;
	
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
		ctb_list(player_jog_finish, noone, "After a round of jogging, both of you stopped to take a small break",
			make_set_speaker_cmd(Amber)+ "Good morning! I'm Amber. It's nice to have someone to jog with.",
			make_set_speaker_cmd(Player)+"Yup! I'm <Player name>, nice to meet you. Do you jog here often?",
			make_set_speaker_cmd(Amber)+"Every morning from 6 to 8.");
	}else{
		ctb_list(player_jog_finish, noone, "You and Amber had a nice jogging routine together.");	
	}

}

function Amber_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Amber, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}