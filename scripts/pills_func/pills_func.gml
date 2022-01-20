function pill_digest(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_digest", 60*24);
	item_consume(item,target);
}

function pill_diet(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_diet", 60*24);
	item_consume(item,target);
	target.fat_calories -= 300;
}

function pill_gas(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_gas", 60*4);
	target.desire_inflate ++;
	item_consume(item,target);
}

function pill_noise(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_noise", 60*3);
	item_consume(item,target);
}

function pill_laxative(target){
	if (is_undefined(target))
		target = global.dialogue_char;
	character_add_status(target, "pill_laxative", 60);
	item_consume(item,target);
}

function pill_notify(status_name, d_script, minutes){
	var char = global.dialogue_char;
	if (object_index == Player)
		return;
	
	global.dialogue_char  = object_index;
	//show_message("1." + str(minutes) +", "+ status_name + ", " +str(status_notify[? status_name]) + ", "
		//+ str(in_dialogue()) + ", " +str(is_character_in_room(id)) + str(room_get_name(script_location())));
	if (status_notify[? status_name] > 0 && !in_dialogue() && is_character_in_room(id)){
			status_notify[? status_name] -= minutes;
			//show_message(str(minutes) +", "+ status_name + ", " +str(status_notify[? status_name]) + ", "
		//+ str(in_dialogue()) + ", " +str(is_character_in_room(id)));
			if (status_notify[? status_name] <= 0){
					d_script();
					return;
			}//else
				//show_message(str(status_notify[? status_name]) )
		}	
	global.dialogue_char  = char;
}

function character_add_status(target, status, duration){
	//show_message(target)
	ds_list_insert(target.statuses[? status], 0, duration); 
	with (target)character_status_step(0);
}

function character_status_step(minutes){
	var target = id;
	set_all_map_entries_to_value(target.statuses_count, 0);
		
	var key = ds_map_find_first(target.statuses);
	for (var i=0; i < ds_map_size(target.statuses); i++){
		var list = target.statuses[? key];
		for (var j=0; j < ds_list_size(list); j++){
			list[| j] -= minutes;
			if (list[| j] > 0){
				target.statuses_count[? key] ++;
			}else{
				ds_list_delete(list, j);
				j--;
			}
		}
		key = ds_map_find_next(target.statuses, key);
	}
}