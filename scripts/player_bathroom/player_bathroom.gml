function d_bathroom_toilet(){
	global.scene_script = player_bathroom_sink;
	dialogue_init();
	dialogue_create(
	"1",
	"Do your business",
	true,
	player_expel
	)
	
	dialogue_start(true);
}

function player_bathtub(){
	global.scene_name = "Bathtub";
	global.scene_inflate_rate = 2;
	scene_add_actors(Player, ANAL, WATER);
	scene_auto_sound(ANAL, WATER);
	background_set(sprBathtubHose);
	global.scene_do_breath = true;
	global.scene_sound_action = list_create(sndFlowWater);
	with (Player) skew_common();
	
	repulsed_message();
}

function d_bathtub(){
	global.scene_script = player_bathtub;
	
	dialogue_init();
	dialogue_create(
	"1",
	"Take a Shower (45 mins)",
	true,
	//scene_start
	d_player_shower
	)
	
	dialogue_create(
	"2",
	"unhook shower head",
	true,
	scene_start
	)
	
	dialogue_start(true);
}

function player_bathroom_sink(){
	global.scene_name = "BathroomSink";
	global.scene_inflate_rate = 2;
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	scene_add_actors(Player, ORAL, WATER);
	scene_auto_sound(ORAL, WATER);
	background_set(sprBathroomSink);
	
	with (Player) skew_common();
}

function d_bathroom_sink(){
	global.scene_script = player_bathroom_sink;
	
	dialogue_init();
	dialogue_create(
	"Drink",
	"Drink",
	true,
	scene_start
	)
	
	dialogue_create(
	"Throw up",
	"Throw up",
	true,
	player_throw_up
	)
	
	dialogue_start(true);
}