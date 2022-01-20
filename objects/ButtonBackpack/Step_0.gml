// Inherit the parent event
event_inherited();

if (is_map()){
	x = -1000;
}

if (room == rmStartOutside){
	image_alpha = wave(0.2, 1, 2, 0);
}else
	image_alpha = 1;