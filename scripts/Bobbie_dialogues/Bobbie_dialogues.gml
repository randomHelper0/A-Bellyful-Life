function Bobbie_dialogues(){
	dialogue_init()
	dialogue_create(
	        "1",
	        "Let's smoke more weed!",
	        false,
	        ""
	)
	eating_out_ask(Bobbie);
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Bobbie_eating_out(){
	ctb_list(noone, noone, "thanks!");
}

function Bobbie_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Bobbie, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}