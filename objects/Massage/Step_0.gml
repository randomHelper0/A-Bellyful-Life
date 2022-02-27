if (dragging){
	x = mouse_x;
	y = mouse_y;
	if (drag_func != noone)
		drag_func();
}else{
	scale_left = scale;
	scale_right = scale;
	
	if (point_distance(x,y,xstart, ystart) > 30){
		x += (xstart - x)/5;
		y += (ystart - y)/5;
	}
}