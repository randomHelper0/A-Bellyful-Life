function character_tick(minutes){
	character_status_step(minutes);
	pressure_step(minutes);
	
	if (!visiting && following){
		show_message("Error: " + name +" following without visiting! Force fixed.")
		following = false;	
	}
	
	if (in_bathroom > 0){
		in_bathroom-= minutes;	
	}
	
		digest_step(minutes);	
		if (visit_arrival > 0){
			visit_arrival -= minutes;
			if (visit_arrival <= 0){
					visiting = true;
					visit_minutes = 180;
					visited = true;
					arrived_notice = true;
			}
		}
		
		//if (visit_minutes > 0){
		visit_minutes -= minutes;
		//}
}

function character_finish_visit(char){
	if (is_undefined(char))
		char = global.dialogue_char;
		
	with (char){
		visit_minutes = 0;
		visiting = false;
		following = false;
	}
}