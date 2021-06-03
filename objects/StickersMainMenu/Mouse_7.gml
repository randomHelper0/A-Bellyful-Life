yy = mouse_y - y;
audio_play_sound(pageflip3, 0, 0);
if (yy < 125){
	room_goto(rmBedroom);
}else if(yy < 223){
	room_goto(rmSaveLoad);
}else if (yy < 322){
	room_goto(rmSettings);
}else{
	//credits
}