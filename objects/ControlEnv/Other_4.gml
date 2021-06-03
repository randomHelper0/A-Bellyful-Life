room_counter = 0;
if (global.save_index != noone){
	var notes = get_string("Notes:", "");
	save_all("save" + str(global.save_index)+ ".json");
	var save_metadata = ds_map_create();
	save_metadata[? "Day"] = day;
	save_metadata[? "$"] = money;
	save_metadata[? "Notes"] = notes;
	if (ds_map_exists(global.metadata, str(global.save_index)))
		ds_map_delete(global.metadata, str(global.save_index));
	
	ds_map_add_map(global.metadata, str(global.save_index), save_metadata);
	save_map_to_file(global.metadata, "metadata.json");
	
	global.save_index = noone;
	exit;
}

if (global.load_index != noone){
	load_all("save" + str(global.load_index)+ ".json");
	global.load_index = noone;
	exit;
}


if (is_location())
    refresh_location();

if (global.scene_from != noone && room == global.scene_from){
	global.scene_from = noone;	
	scene_start();
}