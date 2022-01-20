function aya_dialogue(){
	dialogue_init()
	
	if (in_house())
	dialogue_create(
	        "1",
	        "Let's study some more! (1hr)",
	        true,
			aya_more_study
	)
	
	eating_out_ask(Aya);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "...");
}

function Aya_eating_out(){
	ctb_msg(
		cmd_speaker(Aya) + cmd_ex(ex_talk) +cmd_sound(get_random_asset("chewsoft", 1,4))
			+ "...",
		+ cmd_ex(ex_smile)+cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_speaker(noone) + "You noticed that  Aya is reading her book even while eating but didnt bother to say anything",
		"It seems that Aya was so absorbed in her reading that she didnt notice how much food she was taking in",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "Curiously, you wondered how many hamburgers can she fit insider her small figure and took care to replace any of the food that was eaten.",
		cmd_sound(get_random_asset("drink", 1,4)) + "Alas, Aya finally snapped out of her eating daze. But by then there was a noticeable bulge on her tummy.",
		cmd_speaker(Aya) + cmd_ex(ex_idle)+ "..."
		);
}

function aya_more_study(){
	time_forward_minutes(45);
	if (Player.mood <= 10){
		ctb_list(noone, noone, "You're too bored to suggest that!");
	}else{
		Aya.likability += 5;
		time_forward_minutes(59);
		if (Aya.first_visit){
			Aya.first_visit = false;
			aya_study_first();
		}else
			global.scene_script = aya_study;
		scene_start_from(rmLivingroom);
	}
}

/*function checkAyaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool);
}*/

function aya_study_first(){
	ctb_list(noone, noone, 
		speaker(Aya) + "Good to see you, [Player]. Are you going to show me around?"
	)
}

function aya_study(){
	global.scene_name = "Study";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.show_follower = false;
	Aya.likability += 5;
	time_forward_minutes(59);
	change_mood(Player, -45, true);
	scene_add_actors(Aya, noone, noone);
	background_set(sprAyaStudyBG);
	var msgStudy = "You and Aria studied together for the next hour. It was quite boring, but you made it through.";
	if (Player.total_content/Player.total_capacity >= 0.7){
		ctb_list(aya_choice, noone , 
		msgStudy,
		"[speaker:Aya](She noticed your inflated belly.)",
		"Why is your stomach so huge? Did you have three buffets this morning?",
		"[speaker:Player](You contemplated on what to say.)");
	}else{
		ctb_list(noone, noone , msgStudy);
	}
}

function Aya_drink_kitchensink(){
	global.allow_stream = true;
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Aya, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
	//ctb_list(noone, noone , "stufffff");
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
	Aya.desire_inflate += 10;
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in inflation)")
}

function aya_choice_stuffing(){
	Aya.desire_stuffing += 10;
	ctb_list(noone, noone, "[set_speaker:Aya]I see. (She seems much more interested in stuffing)")
}