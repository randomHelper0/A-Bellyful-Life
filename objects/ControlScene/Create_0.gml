audio_stop_all();
script_execute(global.scene_script);
if (!global.scene_exit)
	with(btArrowNavi) instance_destroy();

sounds = global.scene_sound_action
if (sounds != noone){
	for (var i=0; i < ds_list_size(sounds); i ++){
		audio_play_sound(sounds[| i],0, true);
	}
}

watched_inflate = false;