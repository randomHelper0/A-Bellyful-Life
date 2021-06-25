yy = mouse_y - y;
audio_play_sound(pageflip3, 0, 0);
if (yy < 125){
	custom_goto(rmBedroom);
	audio_stop_sound(bgm_intro);
	audio_play_sound(bgmA_intro, 0, 0);
	audio_sound_gain(bgmA_intro, 0.4, 0);
	//audio_sound_gain(bgmA, 1, 60);
}else if(yy < 223){
	custom_goto(rmSaveLoad);
}else if (yy < 322){
	custom_goto(rmSettings);
}else{
	//credits
}