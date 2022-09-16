///@func game_config_save()
///@desc Save the configurations from the game
function game_config_save(){
	var content =json_encode(global.settings);
	var file = file_text_open_write(working_directory + "config.json");
	file_text_write_string(file, content);
	file_text_close(file);	
};
function game_config_load(){
	if(!file_exists(working_directory + "config.json")){
		return;
	};
	var result = json_decode(file_read_all(working_directory + "config.json"));
	if(result == -1){
		return
	}
	global.settings = result;
}
