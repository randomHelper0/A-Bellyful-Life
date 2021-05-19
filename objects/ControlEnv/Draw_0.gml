//draw_healthbar(x,y,x+100, y + 5, Player.stomach_pressure, c_black, c_blue, c_blue, 0, true, 0);
if(raining > 0 &&  (room == rmMapShopping || room == rmMapUni || room == rmPark)){
	draw_sprite_ext(sprRain, counter/4, 0,0, 2,2, 0, c_white, 1);	
}

if blur > 0 //only apply shader if the enabled = 1
{
	blur --;
    shader_set(shaderBlur)
    shader_set_uniform_f(usize,512,512,8)//width,height,radius
}else// if blur == 0
	shader_reset()



if (!is_location())
    exit;

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0,room_width, 50, false);
draw_set_alpha(1);



