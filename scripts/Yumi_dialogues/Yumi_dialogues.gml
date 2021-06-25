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
	
	eating_out_ask(Yumi);
	
	dialogue_start(true);
	
	ctb_list(noone, noone, "Welcome to my clinic, are you here for a check up?");
}

function Yumi_eating_out(){
	
	ctb_msg(
		cmd_speaker(Yumi) + cmd_ex(ex_smile) +cmd_sound(get_random_asset("chewsoft", 1,4))  + "...",
		cmd_ex(ex_talk) + cmd_speaker(noone) + cmd_sound(get_random_asset("chewsoft", 1,4))  +
		"Yumi's eating posture was very refined and graceful, as if she is an aristocratic lady from one of the visual novels you recently played.",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "Still, despite such graceful gestures and calm demeanor, Yumi never stiopped taking in more food",
		cmd_sound(get_random_asset("chewsoft", 1,4)) +"You wonder if her stomach would billow out at any moment.",
		cmd_speaker(Yumi) +  cmd_ex(ex_smile2) + "Are you wondering why I'm eating so much?",
		cmd_ex(ex_idle) + cmd_speaker(noone) + "You nodded",
		cmd_speaker(Yumi) +  cmd_ex(ex_smile) + "Me too. I'm actually trying to put myself in your shoes. How would it feel to have your stomach stretched out like that. (She pats her slightly bulging belly). I don't think its so bad at all. This feeling is quite strange yet comfortable. I'm going to have to eat with you more often it seems.",
		cmd_ex(ex_idle) + "..."
	);
}

function Yumi_exam(){
	if (ControlEnv.money < 50){
		ctb_list(noone, noone, "I'm terribly sorry, but the clinic will go bankrupt if I give free examinations.");
		return;
	}
	Yumi.gave_exam_today = true;
	if (Player.total_content/Player.total_capacity >= 0.5){
		ctb_list(noone, noone, "[set_speaker:Yumi][ex:surprise]Hmm.. She immediately placed her focus on your bloated belly. Are you currently pregnant?",
			"[set_speaker:Player]No. (You then begrudgingly explains to her what you did to make your belly so big).",
			"[set_speaker:Yumi][ex:talk]I see, as a medical professional I will have to warn you that going over your own limit will have deadly consequences.",
			"Though it doesn't look like you're willing to stop just because I said so.",
			"[set_speaker:Player] (You shook your head)",
			 "[set_speaker:Yumi][ex:sad]Fine, just know that you could end up in the hospital if you don't know your own limits.",
			 "[ex:idle](She seriously contemplated for a while before making a determined look)",
			"[ex:talk]I shouldn't be saying this, but I'm very interested in how you would progress. How about this,",
			"Come back here often when you inflate, I want to observe your body's changes and also warn you if something seems wrong.",
			"I'll even pay you $25 for each interesting visit (once per day).",
			"[set_speaker:Player] Alright",
			"[set_speaker:Yumi]Actually, here's my number. I'm off my shift at 4pm everyday. Give me a text any time after and I will drop by your place to make observations.",
			"Also, I've refunded your money and here is your first $25 for today. Come back often.",
			"[ex:idle][set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a little bit."
			);
		Yumi.interested = true;
		Yumi.has_number = true;
		ControlEnv.money += 25;
		Yumi.desire_inflate += 10;
		Yumi.desire_stuffing += 10;
		Yumi.likability += 5;
	}else{
		ctb_list(noone, noone, "You're as healthy as you can be, no health problems whatsoever.");
		ControlEnv.money -= 50;
	}
}

function Yumi_exam2(){
	Yumi.gave_exam_today = true;
	ControlEnv.money += 25;
	var ratio = Player.total_content/(clamp(Player.total_capacity, 3000, 6500));
	if (ratio >= 0.8){
		Yumi.likability += 9;
		ControlEnv.money += 10;
		Yumi.desire_inflate += 9;
		Yumi.desire_stuffing += 9;
		ctb_list(noone, noone, "[set_speaker:Yumi][ex:surprise](She widened her eyes)I'm astonished at how much you're stretched right now. How is this even possible?",
				"[ex:idle][set_speaker:Player](You tried your best not to blush)",
				"[set_speaker:Yumi][ex:smile2]She  took various measurements and rapidly took notes while mumbling to herself.) I see, I see",
				"[speaker:Player]Kya! (You let out a cute moan as she pressed hard on a particular spot)",
				"[speaker:Yumi]Anyway, that was some good data. Remeber, don't push yourself too hard or else I'll see you here in stretchers. Here's your $25, comeback tomorrow",
				"[ex:idle][set_speaker:Player](You noticed in her excitement, she handed you an extra $10 bill, but you didn't have to correct her)",
				"[set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a large margin."
				)
	}else if (ratio >= 0.5){
		Yumi.likability += 5;
		Yumi.desire_inflate += 5;
		Yumi.desire_stuffing += 5;
		ctb_list(noone, noone, 
				"[set_speaker:Yumi][ex:smile](She  took various measurements and rapidly took notes while mumbling to herself.) I see, I see",
				 "[speaker:Player]Kya! (You let out a cute moan as she pressed hard on a particular spot)",
				"[speaker:Yumi][ex:talk]Anyway, that was some good data. Remeber, don't push yourself too hard or else I'll see you here in stretchers. Here's your $25, comeback tomorrow",
				"[set_speaker:system] You have raised Yumi's interest in inflation and stuffing by a little bit.",
				"[speaker:Yumi][ex:idle]..."
				)
	}else{
		ctb_list(noone, noone, 
			"[set_speaker:Yumi](She took your measurements, but didn't seem very interested. Then she handed you your $25)"
		)
	}
}