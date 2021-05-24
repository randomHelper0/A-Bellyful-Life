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

function make_set_speaker_cmd(speaker){
	return ("[set_speaker:"+object_get_name(speaker)+"]");
}

function make_expression_cmd(expression){
	var cmd = "[set_ex:"+str(expression)+"]";
	if (argument_count > 1)	
		cmd = make_set_speaker_cmd(argument[1]) + cmd;
	return (cmd);
}

function ctb_cmd_set_expression(expression){
	//var char = asset_get_index(speaker);
	var char = global.dialogue_char;
	if (char == noone)
		return;
		
	char.expression = real(expression);
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