room_counter = 0;
if (global.upload_content != noone){
	if (global.upload_content == ""){
		show_message("Error reading file, got blank!");
		exit;
	}
	//TODO FIX PLS
	//global.upload_content = string_replace_all(global.upload_content, "true", 1);
	//global.upload_content = string_replace_all(global.upload_content, "false", 0);
	
	load_all_text(global.upload_content);
	global.upload_content = noone;
	game_start = false;
	alarm[0] = -1;
	exit;
}

if (global.save_index != noone){
	prevNotes = "";
	if (ds_map_exists(global.metadata, str(global.save_index))){
		var prevData = global.metadata[? str(global.save_index)];
		prevNotes = prevData[? "Notes"];
	}
	
	var notes = get_string("Notes:", prevNotes);
	save_all("save" + str(global.save_index)+ ".json");
	var save_metadata = ds_map_create();
	save_metadata[? "Day"] = day;
	save_metadata[? "$"] = money;
	save_metadata[? "Notes"] = notes;
	save_metadata[? "Version"] = global.version;
	if (ds_map_exists(global.metadata, str(global.save_index)))
		ds_map_delete(global.metadata, str(global.save_index));
	
	ds_map_add_map(global.metadata, str(global.save_index), save_metadata);
	save_map_to_file(global.metadata, "metadata.json");
	
	global.save_index = noone;
	exit;
}

if (global.load_index != noone){
	resort_days = 0;
	go_resort = false;
	load_all("save" + str(global.load_index)+ ".json");
	global.load_index = noone;
	game_start = false;
	exit;
}else if (game_start){
	game_start = false;
	//var new_name = undefined;
	//while (is_undefined(new_name))	
//		new_name = get_string("Enter your name:", "Ayume");

	Player.name = str(get_string("Enter your name:", "Ayume"));
}


if (is_location()){
	if (!global.skip_refresh_location)
		refresh_location();
	else{
		global.skip_refresh_location = false;	
		room_persistent = false;
	}
}

if (global.scene_from != noone && room == global.scene_from){
	global.scene_from = noone;	
	scene_start();
}