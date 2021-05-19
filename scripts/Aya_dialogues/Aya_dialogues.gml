function aya_dialogue(){
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

/*function checkAyaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool);
}*/

function aya_study(){
	global.scene_name = "Study";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	scene_add_actors(Aya, noone, noone);
	background_set(sprAyaStudyBG);
	ctb_list(noone, noone , "stufffff");
}

function Aya_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Aya, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	ctb_list(noone, noone , "stufffff");
}