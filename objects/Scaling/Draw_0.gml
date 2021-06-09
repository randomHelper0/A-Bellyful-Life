//draw_sprite(sprLoadingSticker, 0, room_width/2, room_height*0.75);
if (global.goto_room != noone){	
	draw_sprite(sprLoadingSticker, 0, room_width/2, room_height*0.75);
	//show_message("here");
	if (load_counter < 3){
		load_counter++;	
		exit;
	}
	room_goto(global.goto_room);
	global.goto_room = noone;
	load_counter=0;
}