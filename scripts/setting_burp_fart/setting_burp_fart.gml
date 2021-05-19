function do_burp(){
	stomach_air -= min(stomach_air, 200);
	
	if (global.settings[? "burp sound"]){
		audio_play_sound(get_random_asset("burp", 1,5),0,0);
	}else{
		BurpSticker.image_alpha = 1;	
	}
}

function do_fart(){
	bowels_air -= min(bowels_air, 200);
	if (global.settings[? "fart sound"]){
		audio_play_sound(get_random_asset("fart", 1,4),0,0);
	}else{
		FartSticker.image_alpha = 1;	
	}
}