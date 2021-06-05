yy = mouse_y - y;
audio_play_sound(pageflip3, 0, 0);
if (yy < 125){
	room_goto(rmBedroom);
	audio_stop_sound(bgm_intro);
	audio_sound_gain(bgmA, 1, 60);
}else if(yy < 223){
	room_goto(rmSaveLoad);
}else if (yy < 322){
	room_goto(rmSettings);
}else{
	//credits
}