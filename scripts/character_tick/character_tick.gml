function character_tick(minutes){
	character_status_step(minutes);
	pressure_step(minutes);
		digest_step(minutes);	
		if (visit_arrival > 0){
			visit_arrival -= minutes;
			if (visit_arrival <= 0){
					visiting = true;
					visit_minutes = 120;
					visited = true;
					arrived_notice = true;
			}
		}
		
		if (visit_minutes > 0){
			visit_minutes -= minutes;
			if (visit_minutes <= 0){
				visiting = false;
				if (!instance_exists(obj_textbox)){
					global.dialogue_char = id;
					var msgText = "";
				  if (!following){
						msgText =  "You received a text from " + name + ": ";
					}
					
					ctb_list(noone, noone,msgText +  choose(
						"I'm going home now. It was nice hanging out with you!",
						"Looks like I have to go, I'll see you later!",
						"Ah, time flies so quickly, I have to return now. It was fun!"
					));
				}
				following = false;
			}
		}
}