event_inherited();
char = Player;
if (room == rmScene &&  global.show_follower){
	with (Character){
		if (object_index != Player && following && in_house() && !scene_check_actor(id)){
			other.char = id;
			//if (keyboard_check(vk_backspace))
			//	show_message(name);
		}
	}
}

 var spr_name = "spr" + object_get_name(char.object_index) + "_Back_" + string(char.fat_level);
sprite_index = asset_get_index(spr_name);
image_index = char.belly_index;

skew_step();

//show self if dialogue is player
if (is_location())
if ( (room != rmScene && (instance_exists(obj_textbox) || instance_exists(dropdown_dialogue))) || room == rmBackpack ||
	(global.show_follower &&  room == rmScene  && (char != Player || !scene_check_actor(Player)))){
		//if (keyboard_check(vk_delete))
	//		show_debug_message(string(char) + ", " + string(Player));
	x = xstart;
}

if (instance_exists(ItemCard) && !place_meeting(x,y,ItemCard)){
		image_alpha = 0.5;
}else
	image_alpha = 1;

/*if (room == rmScene && (!global.show_follower || char == Player)){
	x = -1000;
}*/