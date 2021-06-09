sprite_index = character.sprite_index;

if (!character.is_npc){
   // draw_sprite_ext(character.sprite_index, character.fat_level*2+character.belly_size, x,y, 1,1,0, c_white, 1);
   var spr_name = "spr" + object_get_name(character.object_index) + "_" + string(character.fat_level),
   sprite = asset_get_index(spr_name);
   // draw_sprite_ext(sprite, character.belly_index, x,y, 1,1,0, c_white, 1);
   skew_draw_other(character, sprite, character.belly_index, x,y);
   skew_draw_other(character, character.sprite_expression, character.expression, x,y);
 
    //draw_sprite_ext(character.sprite_expression, character.expression, x,y, 1,1,0, c_white, 1);
}else{
    draw_sprite(character.sprite_index, character.image_index, x,y);
}

