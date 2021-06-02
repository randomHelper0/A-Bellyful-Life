//audio_stop_all();
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

if (!global.scene_bgm){
	bgm = noone;
	if (audio_sound_get_gain(bgmA) > 0)
		bgm = bgmA;
	else if (audio_sound_get_gain(bgmB) > 0)
		bgm = bgmB;
	
	audio_sound_gain(bgmA,0 ,0);
	audio_sound_gain(bgmB,0 ,0);
}