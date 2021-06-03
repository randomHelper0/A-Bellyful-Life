function save_action(){
	with (SaveSticker) {
		if (image_alpha == 1){
			global.save_index = index;	
		}
	}
	
	room_goto(rmBedroom);
}

function load_action(){
	with (SaveSticker) {
		if (image_alpha == 1){
			global.load_index = index;	
		}
	}
	room_goto(rmBedroom);
}

function delete_action(){
	with (SaveSticker) {
		if (image_alpha == 1){
			global.delete_index = index;	
		}
	}
	
	ds_map_delete(global.metadata, str(global.delete_index));
	file_delete(working_directory + "save" +str(global.delete_index) +".json");
	save_map_to_file(global.metadata, "metadata.json");
}