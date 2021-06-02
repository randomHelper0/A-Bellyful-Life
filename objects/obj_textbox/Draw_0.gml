draw_sprite(sprDialogueBox, 0, 0, 0);

draw_cached();
ctb_draw();//
draw_set_font(fontReport);


/*draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(35, y - 20, 300, y+10, false);
draw_set_alpha(1);
draw_set_color(c_aqua);*/
if (instance_exists(global.dialogue_char))
    draw_text(50, y-30, string_hash_to_newline(global.dialogue_char.name));
else
    draw_text(50, y-30, string_hash_to_newline("System"));
    

draw_load_cache();
//draw_sprite_ext( char_sprite, 0, x+6+29*1.5, y+6+29*1.5,  1.5, 1.5, 0, c_white, 1);

