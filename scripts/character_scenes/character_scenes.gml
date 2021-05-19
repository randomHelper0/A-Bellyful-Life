function character_drink_kitchensink(){
	with (Character){
		if (following){
			global.dialogue_char = id;
			var script = asset_get_index(name + "_drink_kitchensink");
			if (script > -1 && desire_inflate >= 0){
				global.scene_script = script;
				scene_start();
			}else{
				ctb_list(noone, noone, "Thank you but I'm not thristy.");
			}
		}
			
	}
	
}