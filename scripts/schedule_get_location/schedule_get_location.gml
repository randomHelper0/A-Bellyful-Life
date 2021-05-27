function schedule_get_location() {
	for (var i = 0; i < argument_count; i +=3){
	    var time_start = argument[i];
	    var time_end = argument[i+1];
	    if (ControlEnv.hours < time_end &&
	        ControlEnv.hours >= time_start){
	        return argument[i+2];   
	    }
	}
	
	var char = global.dialogue_char;
	if (!instance_exists(char))
		return noone;
		
	if (char.eating_out)
		return char.eating_out_location;
	
	if (char.following && in_house() && is_location()){
		return room;	
	}
	
	if (char.visiting){
		return char.visit_location;	
	}

	return noone;
}
