function Bobbie_dialogues(){
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

function Bobbie_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Bobbie, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}