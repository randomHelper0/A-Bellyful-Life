function player_TV(){
	global.scene_name = "TV";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprLivingroom);
	
	var msg 
	if (Player.TV_times == 0)
		msg = "You eagerly watched all of your favorite shows, catching up from yesterday, restoring your energy and mood.";
	else if (Player.TV_times == 1 || Player.TV_times == 2)
		msg = "You searched around other channels to see if there are anything interesting. Perhaps sitting around watching TV all day isn't good.";
	else
		msg = "(You don't think you should watch anymore TV today.)";
	
	if (Player.TV_times <= 2){
		change_energy(Player, (Player.energy_max/3) / ((Player.TV_times+1)/2) , true);
		change_mood(Player, 20, true)
	}
	
	Player.TV_times++;
	global.scene_sound_action = list_create(sndTV);
	ctb_list(player_TV_finish, noone , msg);
	with (Player) skew_common();
}

function player_TV_finish(){
	time_forward_minutes(45);		
}

function d_player_TV(){
	global.scene_script = player_TV;
	
	dialogue_init();
	dialogue_create(
	"1",
	"Watch TV (45 mins)",
	true,
	scene_start
	)
	
	dialogue_start(true);
	
}