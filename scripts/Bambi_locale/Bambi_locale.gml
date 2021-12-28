function msg_Bambi_intro_EN(){
	ctb_list(noone, rmBarn ,
		 "[speaker:Bambi][ex:ex_surprise]Oooh, Please stop Mr.Chicken!",
		"[speaker:noone][ex:ex_surprise]*Stepping off the bus you notice a girl chasing chickens around the area*",
		"[speaker:noone]*You leave the bus and run after the girl*",
		"[speaker:Player]Hey, you look like you need some help!",
		"[speakerBambi][ex:ex_blush]You don't look like a farm girl but I'll take anything at this point!",
		"[speaker:Player][ex:ex_talk]Well Let's get going we're losing time",
		"[speaker:noone][set_background:sprBambi_Intro2] *You and the girl chased down every last chicken*",
		"[ex:idle][speaker:Bambi]Thank you so much for all your help!",
	);
}

//////////////////

function msg_Bambi_intro2_EN(){
	ctb_list(noone, noone,
		"[speaker:Bambi][ex:ex_smile2]The name's Bambi",
		"[speaker:Player]Pleasure to meet you Bambi!",
		"[speaker:Player]If you ever lose any more chickens give me a call, haha.",
		"[speaker:Bambi][ex:ex_smile]I'll call you for more than that, there's plenty to do around the farm",
		"[speaker:Player][ex:ex_smile]Alright, It sounds like fun!",
		"[ex:idle][speaker:Player][c:blue]Ugh, How do I get myself into these situations..."
	)
}

//////////

function msg_Bambi_feedcows_EN(){
	ctb_list(room_restart, noone,
		"[speaker:noone][set_background:sprFeedCows]..."
	)
}

////////

function msg_Bambi_poultry_EN(){
	ctb_list(noone, rmBarn,
		"[speaker:noone][set_background:sprPoultry]..."
	)
}