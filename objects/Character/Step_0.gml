if (is_npc)
	exit;
	

skew_step();

stomach_content  = stomach_water + stomach_air + stomach_food;
bowels_content  = bowels_water + bowels_air + bowels_food;
total_content = stomach_content + bowels_content;
total_capacity = stomach_capacity + bowels_capacity;
total_food_water = stomach_food+stomach_water+bowels_food+bowels_water;
encumbered =  (total_food_water/total_capacity > 0.5);

//no divide by 0
stomach_content = max(0.1, stomach_content);
bowels_content = max(0.1, bowels_content);
total_content = max(0.1, total_content);
//digest_step(0.01);

/*calories_unabsorbed = 0;
    
for (i = 0; i < instance_number(Item); i++){
    item = instance_find(Item,i);
    if (item.character == id){
        if (item.in_stomach){
            stomach_content += item.volume;
            calories_unabsorbed += item.calories;
        }else{
            bowels_content += item.volume;
        }
    }
}*/

//belly_size = round(stomach_content/stomach_capacity*2)
belly_size = (stomach_content/stomach_capacity)*55
    + (bowels_content/bowels_capacity)*55;
	
belly_size *= (stomach_capacity + bowels_capacity)/final_capacity;

//clip to 100%
belly_size = min(100, belly_size);

 var spr_name = "spr" + object_get_name(object_index) + "_" + string(fat_level);
 sprite_index = asset_get_index(spr_name);
 belly_index = min((belly_size/100)*image_number, image_number-1);
 
/*if (belly_size > 3)
    belly_size = 3;*/

weight = base_weight + fat_calories/5000;

//reset arrived notice flag on new day
if (!visited){
	arrived_notice = false;	
}

if (arrived_notice && !in_dialogue() && is_location()){
	var msg = "";
	if (visit_location != room){
		msg = " They sent you a text:";
	}
	
	ctb_list(noone, noone, name + " has arrived at your place." + msg,
		cmd_speaker(object_index) + arrive_msg);	
		
	arrived_notice = false;
}

if (!in_dialogue() && (stomach_food+stomach_water) > stomach_capacity*1.1*character_capacity_modifier(id) && is_location()){
	sndVomit = get_random_asset("sndVomit", 1, 5);
	if (global.settings[? "vomit sound"])
		audio_play_sound(sndVomit, 0, 0);
	
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	stomach_air *= 0.5;
	stomach_water *= 0.5;
	stomach_food *= 0.5;
	stomach_pressure *=0.5;
}

if (!in_dialogue() && (bowels_food+bowels_water) > bowels_capacity*1.1*character_capacity_modifier(id) && is_location()){
	//sndVomit = get_random_asset("sndVomit", 1, 5);
	audio_play_sound(sndFlush, 0, 0);
	if (object_index == Player){
		time_forward_minutes(15);
		ctb_msg("You ran to the bathroom and returned.");
	}else{
		ctb_msg(name + " clutched her stomach and ran away to the nearest bathroom in a hurry!");
		in_bathroom = 15;
		refresh_location();
	}
	//Player.stomach_content -= min(Player.stomach_capacity/5,Player.stomach_content);
	bowels_air *= 0.5;
	bowels_water *= 0.5;
	bowels_food *= 0.5;
	bowels_pressure *=0.5;
}

if (visiting && visit_minutes <= 0 && !in_dialogue() && (is_location() || ControlEnv.hours >= 22)){
				//visiting = false;
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
				character_finish_visit(id);
				time_forward_minutes(1);
				//following = false;
				
	}