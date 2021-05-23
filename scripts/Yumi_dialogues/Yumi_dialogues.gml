function Yumi_dialogues(){
	dialogue_init()
	if (!Yumi.interested){
		dialogue_create(
		        "e",
		        "General Examination (-$50)",
		        true,
		        Yumi_exam
		)
	}else if (!Yumi.gave_exam_today){
		dialogue_create(
		        "e",
		        "Show her your belly",
		        true,
		        Yumi_exam2
		)
	}else{
		dialogue_create(
		        "e",
		        "Show her your belly",
		        false,
		        "Didn't you already got your exam today? Come back tomorrow."
		)
	}
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "Welcome to my clinic, are you here for a check up?");
}

function Yumi_exam(){
	if (ControlEnv.money < 50){
		ctb_list(noone, noone, "I'm terribly sorry, but the clinic will go bankrupt if I give free examinations.");
		return;
	}
	Yumi.gave_exam_today = true;
	if (Player.total_content/Player.total_capacity >= 0.7){
		ctb_list(noone, noone, "[set_speaker:Yumi]Hmm.. She immediately placed her focus on your bloated belly. Are you currently pregnant?",
			"[set_speaker:Player]No. (You then begrudgingly explains to her what you did to make your belly so big).",
			"[set_speaker:Yumi]I see, as a medical professional I will have to warn you that going over your own limit will have deadly consequences.",
			"Though it doesn't look like you're willing to stop just because I said so.",
			"[set_speaker:Player] (You shook your head)",
			"[set_speaker:Yumi]Fine, just know that you could end up in the hospital if you don't know your own limits.",
			"(She seriously contemplated for a while before making a determined look)",
			"I shouldn't be saying this, but I'm very interested in how you would progress. How about this,",
			"Come back here often when you inflate, I want to observe your body's changes and also warn you if something seems wrong.",
			"I'll even pay you $25 for each interesting visit (once per day).",
			"[set_speaker:Player] Alright",
			"[set_speaker:Yumi]Actually, here's my number. I'm off my shift at 4pm everyday. Give me a text any time after and I will drop by your place to make observations.",
			"Also, I've refunded your money and here is your first $25 for today. Come back often.",
			"[set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a little bit."
			);
		Yumi.interested = true;
		Yumi.has_number = true;
		ControlEnv.money += 25;
		Yumi.interest_inflate += 10;
		Yumi.interest_stuffing += 10;
	}else{
		ctb_list(noone, noone, "You're as healthy as you can be, no health problems whatsoever.");
		ControlEnv.money -= 50;
	}
}

function Yumi_exam2(){
	Yumi.gave_exam_today = true;
	ControlEnv.money += 25;
	if (Player.total_content/Player.total_capacity >= 0.9){
		ControlEnv.money += 10;
		Yumi.interest_inflate += 15;
		Yumi.interest_stuffing += 15;
		ctb_list(noone, noone, "[set_speaker:Yumi](She widened her eyes)I'm astonished at how much you're stretched right now. How is this even possible?",
				"[set_speaker:Player](You tried your best not to blush)",
				"[set_speaker:Yumi](She  took various measurements and rapidly took notes while mumbling to herself.) I see, I see",
				"Anyway, that was some good data. Remeber, don't push yourself too hard or else I'll see you here in stretchers. Here's your $25, comeback tomorrow",
				"[set_speaker:Player](You noticed in her excitement, she handed you an extra $10 bill, but you didn't have to correct her)",
				"[set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a large margin."
				)
	}else if (Player.total_content/Player.total_capacity >= 0.6){
		Yumi.interest_inflate += 5;
		Yumi.interest_stuffing += 5;
		ctb_list(noone, noone, 
				"[set_speaker:Yumi](She  took various measurements and rapidly took notes while mumbling to herself.) I see, I see",
				"Anyway, that was some good data. Remeber, don't push yourself too hard or else I'll see you here in stretchers. Here's your $25, comeback tomorrow",
				"[set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a little bit."
				)
	}else{
		ctb_list(noone, noone, 
			"[set_speaker:Yumi](She took your measurements, but didn't seem very interested. Then she handed you your $25)"
		)
	}
}