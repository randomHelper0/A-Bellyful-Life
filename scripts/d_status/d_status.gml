function d_status() {
	audio_play_sound(pageflip3, 0, 0);
	global.last_room = room;
	room_goto(rmStatus)
}
