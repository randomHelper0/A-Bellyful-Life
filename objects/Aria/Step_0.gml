// Inherit the parent event
event_inherited();

if (just_rescued && room == rmPool){
	ctb_list(noone, noone, 
		"[set_speaker:Aria]Thank you so so much for saving me! I don't even know I can thank you.",
		"[set_speaker:Player] Please don't worry about it. (Dev note: add more dialogue lol)",
		"[set_speaker:Aria] Do you come here often?",
		"[set_speaker:Player] Uhh yes!",
		"[set_speaker:Aria] Then please, would you mind giving me swim lessons? My previous swim teacher had to leave. I'll pay you $50 per session!",
		"[set_speaker:Player](You shook your head saying you don't need payment for this.)",
		"[set_speaker:Aria] Please! I can't ask you to do this for free.",
		"[set_speaker:Player](Realizing the distress behind her plea, you nod your head for now, hoping to find out the reason behind her desperation in the future.)",
		"[set_speaker:Aria] Thank you so much! I will be here from 7 to 9 am every monring. Come whever you can!", 
		"Also here is my number, lets hang out when you're free.",
		"[set_speaker:Aria] (You updated your journal schedule and added her number to your phone)");
		just_rescued = false;
		has_number = true;
}

if (!finished_intro && Player.pool_pass > 0){
		finished_intro = true;
		global.scene_script = aria_intro_scene;
		scene_start();
}

if (!finished_intro || Player.pool_pass <= 0)
	return;

notify_time(7, 0, 35, "Aria's swim practice", rmPool, "Pool");

if (checkAriaEvent()){
	if (practice  < 2){
		practice ++;	
		global.scene_script = aria_practice_scene;
		scene_start();
	}else if (!finished_intro_pump){
		practice =  3;
		/*if  (has_item(IPump)){
			finished_intro_pump = true;
			global.scene_script = aria_intro_pump;
		}else
			global.scene_script = aria_practice_scene;
		scene_start();*/
		if (!has_item(IPump)){
			//prevent message lock
			if (!instance_exists(obj_textbox)){
				global.scene_script = aria_practice_scene;
				msg = "(You'll need a hand pump to execute your idea, come back next time with a hand pump!)";	
				ctb_list(scene_start, noone, msg);
			}
		}else{
			
			finished_intro_pump = true;
			global.scene_script = aria_intro_pump;
			scene_start();
		}
		
	}else{
		if (!finished_pump){
			global.scene_script = aria_pump;
			finished_pump = true;
			scene_start();
		}else{
			finished_pump = false;
			global.scene_script = aria_practice_scene;
			scene_start();
		}
	
	}
}