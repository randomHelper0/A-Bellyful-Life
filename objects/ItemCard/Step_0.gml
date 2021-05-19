width = item.sprite_width + 10;    
height = item.sprite_height + 10;
image_xscale = width/100;
image_yscale = height/100;

if (!global.abilities[? "check"] && 
    (item.in_stomach || item.in_bowels)){
    visible = false;
}

if (dragging){
    x = mouse_x - width/2;
    y = mouse_y - height/2;
    
	//move out if in inventory
	if (room == rmBackpack && point_distance(x,y,xstart, ystart) > 100){
		persistent = true;
		room_goto(global.last_room);
	}
    
}else{
    if (!item.in_stomach && !item.in_bowels){
		if (persistent &&  point_distance(x,y,xstart, ystart) <= 100){
			persistent = false;
			room_goto(rmBackpack);
		}
		
        dis = point_distance(x,y,xorg, yorg);
        if (dis > 10){
            x += (xorg - x)/10;
            y += (yorg - y)/10;
        }else{
            x = xorg;
            y = yorg;
        }
    }else{
        if (item.in_stomach)
            zone = global.zone_stomach;
        else
            zone = global.zone_bowels;
            
        if (x < zone.x)
            x += 4;
        if (y < zone.y)
            y += 4;
        if (x + width > zone.x + zone.sprite_width)
            x -= 4;
        if (y + height > zone.y + zone.sprite_height)
            y -= 4;
    }
}




