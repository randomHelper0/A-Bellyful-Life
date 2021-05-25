function Amber_dialogues(){
	/*dialogue_init()
	dialogue_create(
	        "1Talk",
	        "Talk",
	        true,
	        d_talk
	)
	
	dialogue_start(true);*/
	
	ctb_list(noone, noone, "...");
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