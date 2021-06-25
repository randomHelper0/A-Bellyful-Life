skew_draw(sprite_index ,image_index, x, y, image_xscale, image_yscale);

if (char.using_mpump){
	var sprMPump = getMPumpSprite(char, "Back");
		
	if (sprMPump >= 0){
		skew_draw(sprMPump ,0, x, y, image_xscale, image_yscale);
	}
}

/*if (keyboard_check(vk_delete)){
	show_message(str(image_xscale) + ", " + str(image_yscale))
	test=  0;
}*/
