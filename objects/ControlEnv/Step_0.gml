event_inherited();

if (is_location())
	global.last_room = room;

if (instance_exists(dropdown_dialogue) || instance_exists(obj_textbox) || instance_exists(Window)){
    screen_lock = true;
}else{
    screen_lock = false;
}
room_counter++;
counter++;

if (room == rmMapShopping || room == rmMapUni || room == rmPark || room == rmMapCountryside){
	audio_sound_gain(sndWind, 0.5, 0);
	if (raining <= 0)
		audio_sound_gain(sndRain, 0, 0);
	else
		audio_sound_gain(sndRain, 1, 0);
}else{
	audio_sound_gain(sndWind, 0, 0);
	audio_sound_gain(sndRain, 0, 0);
}

if (!audio_is_playing(sndRain)){
	audio_play_sound(sndWind, 0, 1);
	audio_play_sound(sndRain, 0, 1);	
}

/*if (room == rmMapShopping || room == rmMapUni){
	if (!audio_is_playing(sndWind)){
		audio_play_sound(sndWind,0, 1);
	}
	
	if (raining <=0 && audio_is_playing(sndRain)){
		audio_stop_sound(sndRain);
	}else if (raining > 0 && !audio_is_playing(sndRain)){
		audio_play_sound(sndRain, 0, 1);	
	}
}else{
	if (audio_is_playing(sndWind)){
		audio_stop_sound(sndWind);
	}
	
	if (audio_is_playing(sndRain)){
		audio_stop_sound(sndRain);
	}
}*/