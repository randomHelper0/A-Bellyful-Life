if (global.screen_lock)
    exit;

if (script != noone){
    script_execute(script);
}

if (target_room != noone){
    if (!transition)
        room_goto(target_room);
    else
        room_goto(target_room);
}

