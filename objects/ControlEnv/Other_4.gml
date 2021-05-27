if (is_location())
    refresh_location();

if (global.scene_from != noone && room == global.scene_from){
	global.scene_from = noone;	
	scene_start();
}