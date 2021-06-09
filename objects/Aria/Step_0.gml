// Inherit the parent event
event_inherited();

if (just_rescued && room == rmPool){
	/*ctb_list(noone, noone, 
		"[speaker:Aria]"+cmd_ex(ex_smile)+"Thank you so so much for saving me! I don't even know I can thank you.",
		cmd_ex(ex_idle)+"[speaker:Player] Please don't worry about it. (Dev note: add more dialogue lol)",
		"[speaker:Aria]"+cmd_ex(ex_talk)+" Do you come here often?",
		"[speaker:Player] Uhh yes!",
		"[speaker:Aria]"+cmd_ex(ex_blush)+" Then please, would you mind giving me swim lessons? My previous swim teacher had to leave. I'll pay you $30 per session!",
		"[speaker:Player](You shook your head saying you don't need payment for this.)",
		"[speaker:Aria]"+cmd_ex(ex_surprise)+" Please! I can't ask you to do this for free.",
		"[speaker:Player](Realizing the distress behind her plea, you nod your head for now, hoping to find out the reason behind her desperation in the future.)",
		"[speaker:Aria]"+cmd_ex(ex_smile2)+" Thank you so much! I will be here from 7 to 9 am every monring. Come whever you can!", 
		"Also here is my number, lets hang out when you're free.",
		cmd_ex(ex_idle)+"[speaker:noone] (You updated your journal schedule and added her number to your phone)");*/
		
		ctb_msg("[speaker:Aria][ex_smile]Thank you so so much for saving me! I don't even know I can thank you.",
       "[ex:idle][speaker:Player] [c:blue]I can think of a few things... [c:default]",
        "[speaker:Aria][ex:ex_talk]So uh, do you come here often?",
        "[speaker:Player] Uhh yeah! [font:tiny] This is totally not my first time. [font: normal]",
        "[speaker:Aria][ex:ex_blush] Then please, would you mind giving me swim lessons? My previous swim teacher had to leave. I'll pay you $30 per session!",
        "[speaker:Player] Cmon, If I save your life for free it's only fair I teach you how to swim for free.",
        "[speaker:Aria][ex:ex_surprise] Please! I can't ask you to do this for free.",
        "[speaker:Player][c:blue] Odd, I wonder why she's so adament about paying me?",
        "[speaker:Player][c:blue] I should probably find out why she's so desperate later [c:default]",
        "[speaker:Aria][ex:ex_smile]Thank you so much! I will be here from 7 to 9 am every monring. Come whever you can!", 
        "Also here is my number, lets hang out when you're free.",
	"[speaker:Player] Of course! I could even help you with your swimming if you'd like [font: tiny] I have a few pump related ideas...[font:normal]",
	"[speaker:Aria][ex:ex_smile2] that sounds amazing![font:tiny]What was that last part though?[font:default]",
        "[ex:ex_idle][speaker:noone] (You updated your journal schedule and added her number to your phone)");
		just_rescued = false;
		has_number = true;
		likability = 5;
}

if (!finished_intro && Player.pool_pass > 0){
		finished_intro = true;
		global.scene_script = aria_intro_scene;
		scene_start();
}

if (!finished_intro || Player.pool_pass <= 0)
	return;

notify_time(7, 0, 35, "Aria's swim practice", rmPool, "Pool");

if (checkAriaEvent() && finished_intro){
	if (practice  < 2){
		
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
			global.scene_script = aria_intro_pump;
			scene_start();
		}
		
	}else{
		if (!finished_pump){
			global.scene_script = aria_pump;
			scene_start();
		}else{
			global.scene_script = aria_practice_scene;
			scene_start();
		}
	
	}
}