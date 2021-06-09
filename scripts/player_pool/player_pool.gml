function player_pool(){
	global.scene_name = "Swim";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprPlayerSwimBG);
	ctb_list(player_swim_finish, noone , "You began swimming earnessly. You can feel the refreshing water lifting your mood.");
//	with (Player) skew_common();
}

function d_player_pool_enter(){
	if (Player.pool_pass > 0){
		return;
	}
	
	dialogue_init();
	dialogue_create(
	"1",
	"Buy a day pass for $7",
	true,
	d_player_day_pass
	)
	
	dialogue_create(
	"2",
	"Buy a week pass for $35",
	true,
	d_player_week_pass
	)
	
	dialogue_create(
	"3",
	"Leave",
	true,
	d_player_pool_leave
	)

	dialogue_start(false);
}

function d_player_day_pass(){
	ControlEnv.money -= 7;
	Player.pool_pass ++;
	LocationInteract.image_alpha = 1;
}

function d_player_week_pass(){
	ControlEnv.money -= 35;
	Player.pool_pass += 7;
	LocationInteract.image_alpha = 1;
}

function d_player_pool_leave(){
	custom_goto(rmMapUni);
}

function d_player_pool(){
	dialogue_init();
	dialogue_create(
	"1",
	"swim for 20 minutes",
	true,
	d_player_swim20
	)
	
	dialogue_create(
	"2",
	"swim for 40 minutes",
	true,
	d_player_swim40
	)
	
	dialogue_create(
	"3",
	"swim for 60 minutes",
	true,
	d_player_swim60
	)
	dialogue_start(true);
}

function  d_player_swim20(){
	d_player_swim(20);
}

function  d_player_swim40(){
	d_player_swim(40);
}

function  d_player_swim60(){
	d_player_swim(60);
}

function player_swim_start(){
	global.scene_script = player_pool;
	scene_start();
}

function d_player_swim(minutes){
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, "You're too tired!");
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_swim_minutes = minutes;
	
	player_swim_start();
}

function player_swim_finish(){
	time_forward_minutes(global.player_swim_minutes);
	var msg = "It was a light swimming session.", 
		msg2 = "You can feel your endurance improved a little bit",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);;
	
	if (fraction > 0.8){
		msg = "It was extremely exhausting because you had to drag your very bloated belly through the pool, but you did it!";
		msg2 = "Your endurance improved drastically.";
	}else if (fraction > 0.5){
		msg = "It was quite tiring because your belly was dragging you down.";
		msg2 = "Your endurance improved alot.";
	}else if (fraction > 0.2){
		msg = "It was more taxing than usual because of your bloated belly.";
		msg2 = "Your endurance improved slightly.";
	}
	
	msg2 += ". Max energy increased by " + string(inc*100) + " %";
	Player.energy_max += Player.energy_max * inc;
	ctb_list(noone,  global.last_room, msg, msg2);
	
	
}