if (destroyed)
	exit; //WTF
destroyed = true;
if (finish_script != noone){
	//if (finish_script == aya_choice)
		//show_message("here2_" + str(id))
    script_execute(finish_script);
}
    
if (finish_room != noone)
    room_goto(finish_room);

