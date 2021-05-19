function schedule_get_location() {
	var char = global.dialogue_char;
	for (var i = 0; i < argument_count; i +=3){
	    var time_start = argument[i];
	    var time_end = argument[i+1];
	    if (ControlEnv.hours < time_end &&
	        ControlEnv.hours >= time_start){
	        return argument[i+2];   
	    }
	}
	
	if (char.following && in_house() && is_location()){
		return room;	
	}
	
	if (char.visiting){
		return char.visit_location;	
	}

	return noone;
}
