function ctb_cmd_set_speaker(speaker){
	if (speaker == "noone" || speaker == "system"){
		global.dialogue_char = noone;
		return;	
	}
	
	//show_message(asset_get_index(speaker));
	global.temp = asset_get_index(speaker);
	with (CharacterHolder){
		if (character.id ==global.temp.id){
			focus_holder(id);
		}
	}
	global.dialogue_char = global.temp;
}

function ctb_cmd_set_expression(expression){
	//var char = asset_get_index(speaker);
	char.expression = expression;
}

function ctb_cmd_animate_speaker(speaker,animation){
	var char = asset_get_index(speaker);
}

function ctb_cmd_set_background(bg){
	background_set(asset_get_index(bg));
}

function ctb_cmd_next_background(speaker,animation){
	var char = asset_get_index(speaker);
}