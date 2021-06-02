yy = mouse_y - y;
audio_play_sound(pageflip3, 0, 0);
if (yy < 123){
	room_goto(rmBedroom);
}else if (yy < 231){
	room_goto(rmSettings);
}else{
	//credits
}