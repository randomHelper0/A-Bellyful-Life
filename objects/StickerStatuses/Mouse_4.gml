xx = mouse_x - x;
if (xx < sprite_width/3){
	select = 0;	
}else if (xx < (sprite_width * 2)/3){
	select = 1;
}else{
	select = 2;
}