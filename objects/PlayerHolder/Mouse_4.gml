if (!ControlEnv.screen_lock && !instance_position(mouse_x, mouse_y, btArrowNavi) && room != rmBackpack){
    global.dialogue_char = Player;
    with (CharacterHolder){
        enabled = false;
    }
    //script_execute()//character.script_dialogue);
    d_standard();
}

