function player_park(){
	global.scene_name = "Park";
	global.scene_inflate_rate = 0;
	global.scene_interface = false;
	scene_add_actors(Player, noone, noone);
	background_set(sprPark);
	
	var msg_finish_jog = strlan(
				EN, "You began jogging through the park. You can feel the refreshing air lifting your mood.",
				CN, "你开始在公园中慢跑。清凉的空气改善了你的心情。",
				JP, "公園をジョギングし始めた。爽やかな空気が気分を良くしてくれます。",
				RUS, "Ты начала бегать по парку. Ты можешь почувствовать, как освежающий воздух поднимает твое настроение."
			);
	///////FIX
	global.dialogue_char = Amber;
	if (script_execute(Amber.script_location) != rmPark)
		ctb_list(player_jog_finish, noone , 
			msg_finish_jog
		);
	else{
		global.dialogue_char = noone;
		global.scene_script = amber_jog;
		if (!Amber.met_player)
			ctb_list(room_restart, noone , msg_finish_jog, 
				strlan(EN, "During your jog, you noticed another girl up ahead. You both matched each other's pace.",
					CN, "慢跑的时候，你看到前面有一个女孩也在跑步，你们慢慢步调一致起来。",
					JP, "ジョギング中に、女の子が前を歩いている。あなたがペースを合わせると一緒にペースを合わせて歩いてくれました。",
					RUS, "Во время пробежки ты заметила впереди другую девушку. Вы поравнялись друг с другом."
				)
			);
		else{
			room_restart();	
		}
	}
//	with (Player) skew_common();
}

function d_player_park(){
	dialogue_init();
	var str_jog = strlan(EN, "Jog for", RUS, "Бег трусцой", JP, "ジョグ", CN, "慢跑");
	dialogue_create(
	"1",
	str_jog + " 20 " + str_mins,
	true,
	d_player_jog20
	)
	
	dialogue_create(
	"2",
	str_jog + " 40 " + str_mins,
	true,
	d_player_jog40
	)
	
	dialogue_create(
	"3",
	str_jog + " 60 " + str_mins,
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

function player_jog_energy(minutes){
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
}

function d_player_jog(minutes){
	player_jog_energy(minutes);
	
	player_jog_start();
}

function player_jog_finish(){
	time_forward_minutes(global.player_jog_minutes);
	exelan("msg_player_jog_finish");
	
	
}