function aya_dialogue(){
	dialogue_init()
	dialogue_create(
	        "1",
	        "Let's study some more!",
	        true,
			aya_more_study
	)
	
	eating_out_ask(Aya);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Aya_eating_out(){
	ctb_list(noone, noone, "thanks!");
}

function aya_more_study(){
	if (Player.mood <= 10){
		ctb_list(noone, noone, "You're too bored to suggest that!");
	}else{
		global.scene_script = aya_study;
		scene_start_from(rmLivingroom);
	}
}

/*function checkAyaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool);
}*/

function aya_study(){
	global.scene_name = "Study";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	change_mood(Player, -45, true);
	scene_add_actors(Aya, noone, noone);
	background_set(sprAyaStudyBG);
	var msgStudy = "You and Aria studied together for the next hour. It was quite boring, but you made it through.";
	if (Player.total_content/Player.total_capacity >= 0.7){
		ctb_list(aya_choice, noone , 
		msgStudy,
		"[set_speaker:Aya](She noticed your inflated belly.)",
		"Why is your stomach so huge? Did you have three buffets this morning?",
		"[set_speaker:Player](You contemplated on what to say.)");
	}else{
		ctb_list(noone, noone , msgStudy);
	}
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

function aya_choice(){
	dialogue_init()
	dialogue_create(
	        "1",
	        "Being inflated helps my focus.",
	        true,
	        aya_choice_inflate
	)
	dialogue_create(
	        "2",
	        "Being stuffed with food helps my focus",
	        true,
	        aya_choice_stuffing
	)
	
	dialogue_start(false);
}

function aya_choice_inflate(){
	Aya.interest_inflate += 20;
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in inflation)")
}

function aya_choice_stuffing(){
	Aya.interest_stuffing += 20;
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in stuffing)")
}