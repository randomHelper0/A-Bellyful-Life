expression = ex_idle;

if (global.watched_inflate && following){
	global.dialogue_char = id;
	var msg = "";
	if (desire_inflate > 0){
			msg = inflate_interest_msg;
	}else if (desire_inflate == 0){
		msg = disinterest_msg;	
	}else{
		msg = hate_msg;	
	}
	
	ctb_list(noone, noone, msg);
	global.watched_inflate = false;
}

