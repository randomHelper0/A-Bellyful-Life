function aria_dialogue(){
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



function aria_intro_scene(){
	global.scene_name = "Aria Intro";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	//scene_add_actors(Player, noone, noone);
	background_set(sprAriaIntro1);
	time_forward_minutes(30);
	if (ControlEnv.hours < 9)
		ControlEnv.hours = 9;
	ctb_list(noone, rmPool , "Immediately after entering, you noticed a small girl strugglling underneath the waters",
		"the life guard was too occupied looking at his phone to notice. It would be faster to jump into the pool yourself.",
		"[set_background:sprAriaIntro2]Without wasting a hearbeat, you jumped in and gently pulled her out.");
	Aria.just_rescued = true;
}

function aria_practice_scene(){
	global.scene_name = "PracticeAfterPump";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	//scene_add_actors(Player, noone, noone);
	
	if (Aria.stomach_pressure <= 0)
		background_set(asset_get_index("sprAriaPractice" + string(Aria.practice)));
	else{
		//var frac = Aria.total_content/Aria.total_capacity;
		Aria.total_content*=1.5;
		with (Aria) skew_none();
		scene_add_actors(Aria, noone, noone);
	}
	time_forward_minutes(60);
	ControlEnv.hours = 9;
	ControlEnv.minutes = 0;
	
	var msg = "", msg2 = "", msg3 = "";
	if (Aria.practice == 1){
		msg = "Your first swim practice with Aria went well. Aria is doing her best. Her movements and form is correct, but somehow she is still having great difficulty at keeping herself afloat.";	
	}else if (Aria.practice == 2){
		msg = "Aria followed your instructions carefully, her swim movements are almost perfect. Yet somehow she can't stay afloat. As if gravity itself wants to pull her down!";	
		msg2 = "It looks like Aria might need to use a swim float at all times, which frustrates you both. Then you had an idea, why not make Aria herself a float? You wonder if she would go along with your plan.";
		msg3 = "(You'll need a hand pump to execute your idea, come back next time with a hand pump!)"
	}/*else if (Aria.practice == 3 &&  !Aria.finished_intro_pump){
		if (!has_item(IPump))
			msg = "(You'll need a hand pump to execute your idea, come back next time with a hand pump!)";	
		else{
			msg = "[set_speaker:Player] I have an idea on how to keep you floating without using a float, so you can swim as much as you want without sinking! Although you might find it a little ... strange";
			msg2 = "[set_speaker:Aria] Please! I don't mind it as long as I am able to swim on my own. Please tell me your idea!"
			msg3 = "[set_speaker:Player] You began explaining to Aria on how to use the hand pump to turn herself into a large float, while ignoring her major blushing episode."
		}
	}*/else if (Aria.stomach_pressure < 30){
		msg = "Swiming on an empty stomach, the results were not as desired. Aria was able to practice her swim form, but she'll sink quickly when left alone.";	
	}else  if (Aria.stomach_pressure < 70){
		msg = "Both you and Aria could visibly observe major improvements. Aria doesn't seem to immediately sink when you elt go anymore";	
		msg2 = "Although she would eventually get pulled to the bottom of the pool when left swiming in a straight line for a while."
		msg3 = "You can't help but imagine the better results if Aria is inflated even more."
	}else {
		msg = "The swim practice went great! There wasn't a moment when Aria wasn't afloat. She could do whatever she wanted, swim in whatever form she likes"
		msg2 = "Aria doesn't even seem to mind her large bloated belly at all and happily swimed everywhere. You can see a happy smile plastered on her face the entire time.";	
	}
	if (msg2 == "")
		ctb_list(noone, rmPool , msg);
	else
		ctb_list(noone, rmPool , msg, msg2, msg3);
		
	Aria.stomach_capacity += Aria.stomach_pressure * 50;
	ControlEnv.money += 50;
}

function aria_intro_pump(){
	global.scene_name = "Aria Intro Pump";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	//scene_add_actors(Player, noone, noone);
	background_set(sprAria_Pump_intro);
	
	msg = "[set_speaker:Player] I have an idea on how to keep you floating without using a float, so you can swim as much as you want without sinking! Although you might find it a little ... strange";
	msg2 = "[set_speaker:Aria] Please! I don't mind it as long as I am able to swim on my own. Please tell me your idea!"
	msg3 = "[set_speaker:Player] You began explaining to Aria on how to use the hand pump to turn herself into a large float, while ignoring her major blushing episode."
	ctb_list(noone, rmPool , msg, msg2, msg3);
}

function aria_pump(){
	global.scene_name = "Pump";
	global.scene_inflate_rate = 2;
	scene_add_actors(Aria, ORAL, AIR);
	background_set(sprLockerroom);
	//ctb_list(noone, rmPool , "stufffff");
}

function checkAriaEvent(){
	return (ControlEnv.hours == 7 && ControlEnv.minutes <= 35 && room == rmPool);
}