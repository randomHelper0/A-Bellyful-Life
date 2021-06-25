// Inherit the parent event
event_inherited();

if (room == rmAlley && !met_player){
	met_player = true;
	has_number = true;
	ctb_msg("[speaker:Bobbie][ex:talk]Pst! Pssst! Look here!", 
		"[speaker:Player] (You hear someone whisper at you from a random alley)",
		"(Out of curiousity, you walked towards them while keeping alert.)",
		"[speaker:Bobbie][ex:smile]You wanna smoke some weed? I got all kinds!",
		"[speaker:Player]Uhhhhh.... (You contemplated on what to say)",
		"[speaker:Bobbie][ex:smile2]Its fine, take your time. I'm here from 1-5pm everyday! Actually, here's my number(she gave you a small piece of paper with her number scribbled on)",
		"Call me whenever and we can hang out, smoke weed, and talk about life!",
		"[ex:smile]...")
}

if (met_player){
	notify_time(13, 0, 35, "Bobbie's secret shop", rmAlley, "Back Alley - 5pm");
}