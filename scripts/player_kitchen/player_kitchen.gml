function player_kitchen(){
	global.scene_name = "SinkKitchen";
	global.scene_inflate_rate = 2;
	scene_add_actors(Player, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	with (Player) skew_common();
}

function d_kitchen_sink(){
	global.scene_script = player_kitchen;
	
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
	
	with (Character){
		if (following){
			dialogue_create(
			name,
			"Ask " + name + " to drink.",
			true,
			character_drink_kitchensink
			)
		}
	}
	
	dialogue_start(true);
}