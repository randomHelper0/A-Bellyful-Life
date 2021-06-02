if (!global.settings[? "All Sounds"]){
	audio_set_master_gain(0, 0);	
}else{
	audio_set_master_gain(0, 1);	
}

if (!global.settings[? "Music"]){
	audio_sound_gain(bgmA, 0, 0);
	audio_sound_gain(bgmB, 0, 0);
}

