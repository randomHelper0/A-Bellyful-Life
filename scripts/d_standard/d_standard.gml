function d_standard() {
	var char = global.dialogue_char;
	if (char.is_npc){
	    script_execute(char.script_dialogue);
	    ctb_list(noone, noone, "...");
	    exit;
	}

	//var d = global.dialogues;
	dialogue_init()

	if (char.id != Player.id)
	    dialogue_create(
	            "1Talk",
	            "Talk",
	            true,
	            d_talk
	    )
	    else
	    dialogue_create(
	            "1Talk",
	            "Talk",
	            false,
	            "You can't talk to yourself!"
	    )

	dialogue_create(
	        "2Status",
	        "Status",
	        true,
	        d_status
	)
	
	if (char.visiting){
		if (!char.following)
			dialogue_create(
		        "3",
		        "Come with me for a bit",
		        true,
		        d_follow
			)
		else
			dialogue_create(
		        "3",
		        "Lets get back to what we were doing.",
		        true,
		        d_unfollow
			)
	}

	/*dialogue_create(
	        "3Observe",
	        "Observe",
	        true,
	        d_observe
	)*/

	dialogue_start(true);



}

function d_follow(){
	with (Character) following = false;
	
	ctb_list(noone, noone, "Ok");
	global.dialogue_char.following = true;
}

function d_unfollow(){
	var char = global.dialogue_char;
	ctb_list(noone, noone, "Ok");
	global.dialogue_char.following = false;
	refresh_location();
	global.dialogue_char = char;
}