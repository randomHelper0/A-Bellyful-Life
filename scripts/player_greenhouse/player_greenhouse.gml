function player_greenhouse(){
	global.scene_name = "Greenhouse";
	global.scene_inflate_rate = 2;
	scene_add_actors(Player, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprGreenhouseScene);
	global.scene_sound_action = list_create(sndFlowWater);
	global.scene_do_breath = true;
	with (Player) skew_common();
	repulsed_message();
}

function d_greenhouse(){
	global.scene_script = player_greenhouse;
	
	dialogue_init();
	dialogue_create(
	"1",
	"Use hose",
	true,
	scene_start
	)
	dialogue_start(true);
}