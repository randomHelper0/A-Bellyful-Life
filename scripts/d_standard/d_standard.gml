function d_standard() {
	var char = global.dialogue_char;
	if (char.is_npc){
	    char.script_dialogue();
	    ctb_list(noone, noone, "...");
	    exit;
	}

	//var d = global.dialogues;
	dialogue_init()

	if (char.id != Player.id)
	    dialogue_create(
	            "1Actions",
	            "Actions",
	            true,
	            //d_talk
				function(){global.dialogue_char.script_dialogue();}
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
		dialogue_create(
		        "4",
		        "Ask them to leave",
		        true,
		        function(){
					var char = global.dialogue_char;
					ctb_list(
						function(){
							character_finish_visit(global.dialogue_char);
							refresh_location();
						}
						, noone, cmd_speaker(Player)+choose(
						"I'm sorry but something came up, could you return for today?",
						"Sorry but I had an unexpected errand that will take a while. Do you want to hang out on another day?",
						"I apologize but it seems I have to go"
					), cmd_speaker(char.object_index)+"Sure, no problem. Let's hang out next time!")
				}
			)
			
		if (!char.following)
			dialogue_create(
		        "3",
		        "Come with me for a bit",
		        true,
		        function(){
					with (Character) following = false;
					ctb_list(noone, noone, make_expression_cmd(ex_talk) +"Ok", make_expression_cmd(ex_idle) + "...");
					global.dialogue_char.following = true;
				}
			)
		else
			dialogue_create(
		        "3",
		        "Lets get back to what we were doing.",
		        true,
		        function(){
					var char = global.dialogue_char;
					ctb_list(noone, noone,make_expression_cmd(ex_talk) + "Ok", make_expression_cmd(ex_idle) + "...");
					global.dialogue_char.following = false;
					refresh_location();
					global.dialogue_char = char;	
				}
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

/*function d_follow(){
	with (Character) following = false;
	
	ctb_list(noone, noone, make_expression_cmd(ex_talk) +"Ok", make_expression_cmd(ex_idle) + "...");
	global.dialogue_char.following = true;
}*/

/*function d_unfollow(){
	var char = global.dialogue_char;
	ctb_list(noone, noone,make_expression_cmd(ex_talk) + "Ok", make_expression_cmd(ex_idle) + "...");
	global.dialogue_char.following = false;
	refresh_location();
	global.dialogue_char = char;
}*/

/*function d_ask_leave(){
	var char = global.dialogue_char;
	ctb_list(action_leave, noone, cmd_speaker(Player)+choose(
		"I'm sorry but something came up, could you return for today?",
		"Sorry but I had an unexpected errand that will take a while. Do you want to hang out on another day?",
		"I apologize but it seems I have to go"
	), cmd_speaker(char.object_index)+"Sure, no problem. Let's hang out next time!")
	
}*/

/*function action_leave(){
	character_finish_visit(global.dialogue_char);
	refresh_location();
}*/