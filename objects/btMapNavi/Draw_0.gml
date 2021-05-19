if (target_room == global.last_dest && target_room != rmShop) ||
	(target_room == rmShop && global.clicked_shop_bt == id && global.shop_bg == shop_bg){
	image_alpha = 	cos(current_time/250) + 1;
}
draw_self();

image_alpha = 1;

draw_cached();
draw_set_font( fontReport);
draw_set_halign(fa_center);


var width = string_width(name),
	height = string_height(name);
y += yy;

draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(x - width/2 - 15, y-3, x + width/2+15, y + height - 4, 0);
draw_set_alpha(1);

draw_set_color(make_color_rgb(255,102,0));
draw_text(x,y,name);
draw_load_cache();
y -= yy;