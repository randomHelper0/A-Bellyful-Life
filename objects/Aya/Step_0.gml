// Inherit the parent event
event_inherited();

if (ControlEnv.hours > 10 && !first_text && is_location() 
	&& !instance_exists(obj_textbox) && !instance_exists(dropdown_dialogue)){
	first_text = true;
	//var char = global.dialogue_char;
	global.dialogue_char = id;
	ctb_list(noone, noone, 
		"(You received a text from Aya, your high school best friend who's also going to the same uni with you after summer ends.)",
		"Hey Ayume! I heard that you moved into a fancy new house today. I hope that you didn't forget your promise to study together with me throughout the summer.",
		"The university we're going to isn't the slacker type, the first semester is the toughest so I really want to get you ready for it!",
		"Also I'd love to check out your new place! Just give me a text and I'll come right over :)",
		"(You glanced at your contact list to see Aya's number being the only entry. You really need to make more friends here)"
	);
	//global.dialogue_char = char;
	has_number = true;
}

if (visiting && !studied_today && room == rmLivingroom
	&& !arrived_notice && !instance_exists(obj_textbox)){  //check if the arrived message is playing (happens when she arrives in the same room the player is in
	global.scene_script = aya_study;
	scene_start();
	time_forward_minutes(59);
	studied_today = true;
}

//reset study flag on new day
if (!visited)
	studied_today = false;