if (!global.streaming){
	visible = false;
	y = -100;
	exit;
}else{
	y = ystart;
	visible = true;
	ControlEnv.battery --;
	if (ControlEnv.battery <= 0){
		global.streaming = false;
		tooltip_start(room_width/2-100, 0, "Stream Off","Your camera ran out of battery, you'll recharge it when you sleep.");
	}
}

if (!on){
    x = room_width;
}else{
    x = room_width - CHAT_WIDTH;
}

var rate = 10000000;
if (BtPlay.toggled){
	rate = 90;
}

if (floor(random(rate))==0){
	viewers ++;	
}

if (viewers > 0){
	if ( BtPlay.toggled && floor(random(100 - viewers))==0)
		donations ++;	
		ControlEnv.money++;
	if ( floor(random(70 - clamp(viewers,0, 20)))==0)
		create_chat_entry();
}