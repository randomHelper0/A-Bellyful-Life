if (!instance_exists(item)){
	instance_destroy();
	exit;
}

draw_set_color(make_colour_rgb(201,70,38));
draw_set_alpha(0.5*image_alpha);
draw_rectangle(x,y,x+width, y + height, false);
draw_set_alpha(1*image_alpha);
if (item.use_items == noone)
	draw_set_color(c_orange);
else
	draw_set_color(c_red);
draw_line_width(x, y, x + width, y, 2);
draw_line_width(x, y+height, x+width, y+height, 2);
draw_line_width(x+width, y, x + width, y+height, 2);
draw_line_width(x, y, x, y+height, 2);

var color = c_white;
if (item.do_expire && item.expire_in < 0){
		color = c_black;
}

draw_sprite_ext(item.sprite_index, item.image_index, 
    x + 5 + item.sprite_width/2, y + 5 + item.sprite_height/2, 1, 1, 0, color, image_alpha);

draw_set_color(c_black);
if (item.show_name){
    draw_set_font(fnt_popup)
    draw_text(x+5,y + 5, string_hash_to_newline(item.name));
}

if (item.show_volume){
    draw_set_font(fnt_popup)
    draw_text(x+5,y + 50, string_hash_to_newline(string(item.volume) + "cc"));
}


