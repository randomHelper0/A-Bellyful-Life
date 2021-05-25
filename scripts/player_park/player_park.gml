function player_park(){
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprPark);
	
	if (script_execute(Amber.script_location) != rmPark)
		ctb_list(player_jog_finish, noone , "You began jogging through the park. You can feel the refreshing air lifting your mood.");
	else{
		global.scene_script = amber_jog;
		if (!Amber.met_player)
			ctb_list(room_restart, noone , "You began jogging through the park. You can feel the refreshing air lifting your mood.", 
				"During your jog, you noticed another girl up ahead. You both matched each other's pace.");
		else{
			room_restart();	
		}
	}
//	with (Player) skew_common();
}

function d_player_park(){
	dialogue_init();
	dialogue_create(
	"1",
	"Jog for 20 minutes",
	true,
	d_player_jog20
	)
	
	dialogue_create(
	"2",
	"Jog for 40 minutes",
	true,
	d_player_jog40
	)
	
	dialogue_create(
	"3",
	"Jog for 60 minutes",
	true,
	d_player_jog60
	)
	dialogue_start(true);
}

function  d_player_jog20(){
	d_player_jog(20);
}

function  d_player_jog40(){
	d_player_jog(40);
}

function  d_player_jog60(){
	d_player_jog(60);
}

function player_jog_start(){
	global.scene_script = player_park;
	scene_start();
}

function d_player_jog(minutes){
	var cost = -minutes/2,
	fraction =  (Player.total_content/Player.total_capacity);
	energy_charge =fraction*cost + cost;
	if (change_energy(Player, energy_charge, false) == -1){
		ctb_list(noone, noone, "You're too tired!");
		return;
	}
	change_mood(Player, -energy_charge, true);
	
	
	global.player_increase_endurance =  -energy_charge/1000;
	global.player_jog_minutes = minutes;
	
	player_jog_start();
}

function player_jog_finish(){
	time_forward_minutes(global.player_jog_minutes);
	var msg = "It was a light running session.", 
		msg2 = "You can feel your endurance improved a little bit",
		inc = global.player_increase_endurance,
		fraction =  (Player.total_content/Player.total_capacity);;
	
	if (fraction > 0.8){
		msg = "It was extremely exhausting because you had to drag your very bloated belly through the park, but you did it!";
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