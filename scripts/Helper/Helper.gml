#macro str string

function background_set(bg){
	 //__background_set( e__BG.Index, 0, bg );	
	 var lid =  layer_background_get_id("Background");
	  layer_background_sprite(lid, bg);
}

function background_get(){
	 var lid =  layer_background_get_id("Background");
	 return layer_background_get_sprite(lid);
	// return __background_get( e__BG.Index,0);
}


function get_random_asset(name, idx_min, idx_max){
	asset_name = name + string(round(random_range(idx_min, idx_max)));
	idx = asset_get_index(asset_name);	
	//show_message(asset_name + ", " + string(idx));
	return idx;
}

function draw_cached(){
	prev_font = draw_get_font();
	prev_halign = draw_get_halign();
	prev_color = draw_get_color();	
}

function draw_load_cache(){
	draw_set_font(prev_font);
	draw_set_halign(prev_halign);
	draw_set_color(prev_color);
}

function set_all_map_entries_to_value(map, value){
	var key = ds_map_find_first(map);
	for (var i=0; i < ds_map_size(map); i++){
		map[? key] = value;
		key = ds_map_find_next(map, key);
	}
}

function sound_get_volume(snd){
	switch(snd){
		case sndFlowWater:
			return 0.4;
	}

	return 1;
}

function audio_is_playing_all(){
	for (var i=0; i<argument_count; i++)
		if (audio_is_playing(argument[i]))
			return true;
	return false;
}

function in_dialogue(){
	return (instance_exists(obj_textbox) || instance_exists(dropdown_dialogue));	
}

function audio_stop_sound_later(){
	audio_stop_sound(global.stop_sound);	
}

function file_read_all(fname){
	var file = file_text_open_read(fname);
	var content = "";

	while !file_text_eof(file)
	{
	    content += file_text_read_string(file);
	    file_text_readln(file);
	}	
	file_text_close(file);
	/*var buffer = buffer_load(working_directory + fname);
	var content = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);*/
	return content;
}

function map_to_string(map){
	var content = "";
	for (var k = ds_map_find_first(map); !is_undefined(k); k = ds_map_find_next(map, k)) {
	  var v = map[? k];
	  content += k+": " + str(v) + "#";
	}
	return content;
}