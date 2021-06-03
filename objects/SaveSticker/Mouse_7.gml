//json_decode(file_read_all(working_directory + "metadata.json"));

if !ready || in_dialogue() || (!instance_exists(ControlEnv) && !ds_map_exists(metadata, str(index)))
	exit;
	
dialogue_init()
	
	if (instance_exists(ControlEnv))
		dialogue_create(
		        "1",
		        "Save",
		        true,
		        save_action
		)
	
	if (ds_map_exists(metadata, str(index))){
		dialogue_create(
			        "2",
			        "Load",
			        true,
			       load_action
		)
	
		dialogue_create(
			        "3",
			        "Delete",
			        true,
			       delete_action
		)
	}

	dialogue_start(true);
	
	with (SaveSticker) image_alpha = 0.5;
	image_alpha = 1;