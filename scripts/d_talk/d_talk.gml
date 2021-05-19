function d_talk() {
	dialogue_init()
	if (global.dialogue_char == Player){
	    ctb_list(noone, noone, "You shouldn't talk to yourself :(");
	    exit;
	}

	//script_execute(d_topics_common);

	script_execute(global.dialogue_char.script_dialogue);

	dialogue_create(
	        "1Casual",
	        "Casual Chat",
	        true,
	        d_topics_common
	)

	dialogue_start(true);



}
