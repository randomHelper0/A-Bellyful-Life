//target_room = rmMapUni;
target_script = function(){
	if(show_question("Are you sure you want to return from your vacation early?")){
		ButtonMap.last_map = rmMapUni;
		custom_goto(rmMapUni);	
		ControlEnv.go_resort = false;
		with (Character) go_resort = false;
	}
}
name = "Return to City";
display = strlan(EN, name, RUS, "Назад в город ", JP, "シティに戻る", CN, "回城 ");
yy = -100;