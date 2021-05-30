function eating_out_finish(){
	with (Character){
		if (eating_out){
			eating_out = false;	
		}
	}
}

/*
eating_out = false;
eating_out_location = noone;
eating_out_script
*/
function eating_out_ask(char){
	if (!char.visiting || !in_house())
		return;
	
	global.eating_out_char = char;
	var cost = 15;
	if (char.eating_out_items != noone){
		for (var i=0; i<ds_list_size(char.eating_out_items); i++){
				cost += char.eating_out_items[| i].price*2;
		}
	}
	global.eating_out_cost = cost;
	
		if (char.visiting && char.eating_out_location != noone)
			dialogue_create(
		        "askout",
		        "Let's go get something to eat, food's on me! ($"+str(cost)+")" ,
		        true,
				eating_out_action
			)
}

function eating_out_action(){
	char = global.eating_out_char;
	if (ControlEnv.money < global.eating_out_cost){
		ctb_msg("[speaker:noone]You don't have enough money!");
		return;
	}
	if (char.likability <  char.eating_out_threshold){
		ctb_list(noone, noone, cmd_speaker(char) + 
			choose("Sorry but I don't want to leave the bill to you, and I'm also saving up so I don't want to spend money eating out.",
				"I feel like I am spending too much money eating out all the time and it is really beginning to bug me. And since we just met, I can't just make you pay!")
				, cmd_speaker(noone) + "You realized they just aren't comfortable enough with you to go out to eat yet.")	
	}else{
		ControlEnv.money -= global.eating_out_cost;
		char.affection += 3;
		char.eating_out = true;
		global.dialogue_char = char;
		ctb_list(noone, char.eating_out_location, "You both took took the taxi to the shopping district.");
	}
}

function eating_out_init(location, items){
	eating_out_location = location;
	eating_out_items = items;
}