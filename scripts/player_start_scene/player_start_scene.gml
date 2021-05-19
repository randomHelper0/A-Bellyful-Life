function player_start_scene(){
	global.scene_name = "Start";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	global.scene_exit = false;
	global.show_follower = false;
	//scene_add_actors(Player, noone, noone);
	background_set(sprSceneStart);
	ctb_list(noone, rmBedroom , "You are Ayume, a bubbly girl with lots of quirky desires.", " You just won a big lottery and is now moving out to rent your own mansion so you can do everything that you want!");
}