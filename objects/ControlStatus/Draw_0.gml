///draw character
sprite_index = character.sprite_index;
// draw_sprite_ext(character.sprite_index, character.fat_level*2+character.belly_size, x,y, 1,1,0, c_white, 1);
var spr_name = "spr" + object_get_name(character.object_index) + "_" + string(character.fat_level),
sprite = asset_get_index(spr_name);
//draw_sprite_ext(sprite, character.belly_index, x,y, 1,1,0, c_white, 1);
//  draw_sprite_ext(character.sprite_expression, character.expression, x,y, 1,1,0, c_white, 1);
skew_draw_other(character, sprite, character.belly_index, x,y);
skew_draw_other(character, character.sprite_expression, character.expression, x,y);
if (character.using_mpump){
	var sprMPump = getMPumpSprite(character, "Front");
		
	if (sprMPump >= 0){
		skew_draw_other(character,sprMPump ,0, x, y);
	}
}

var char = global.dialogue_char;
draw_cached();
draw_set_color(c_white);
var base_y = 100, line_y = 45, base_x = 300, select = StickerStatuses.select;


exit;
if (select == 1){
	//-----------------------stomach
	draw_text(base_x, base_y, "Stomach: " + string(char.stomach_content) + "/"
		+string(char.stomach_capacity) + "cc (4000cc possible)" );
	draw_healthbar(base_x, base_y + line_y, base_x + 600, base_y + line_y*2-5, (char.stomach_capacity/4000)*100, 
		c_black, c_dkgray, c_dkgray, 0, 1, 0);
	draw_healthbar(base_x, base_y + line_y, base_x + 600, base_y + line_y*2-5, (char.stomach_content/4000)*100, 
		c_black, c_white, c_white, 0, 0, 0);
	draw_text(base_x, base_y+line_y*2, "Food: " + string(char.stomach_food) + "cc, "
		+"water: " + string(char.stomach_water) + "cc, "
		+"air: " + string(char.stomach_air) + "cc, ");
	//----------------------bowels
	draw_text(base_x, base_y+line_y*3, "Bowels: " + string(char.bowels_content) + "/"
		+string(char.bowels_capacity) + "cc (3000cc possible)" );
	draw_healthbar(base_x, base_y + line_y*4, base_x + 600, base_y + line_y*5-5, (char.bowels_capacity/3000)*100, 
		c_black, c_dkgray, c_dkgray, 0, 1, 0);
	draw_healthbar(base_x, base_y + line_y*4, base_x + 600, base_y + line_y*5-5, (char.bowels_content/3000)*100, 
		c_black, c_white, c_white, 0, 0, 0);
	draw_text(base_x, base_y+line_y*5, "Food: " + string(char.bowels_food) + "cc, "
		+"water: " + string(char.bowels_water) + "cc, "
		+"air: " + string(char.bowels_air) + "cc, ");
	// energy
	draw_text(base_x, base_y+line_y*6, "Energy: " + string(char.energy) + "/"
		+string(char.energy_max) + " (100 possible)" );
	draw_healthbar(base_x, base_y + line_y*7, base_x + 600, base_y + line_y*8-5, char.energy_max, 
		c_black, c_dkgray, c_dkgray, 0, 1, 0);
	draw_healthbar(base_x, base_y + line_y*7, base_x + 600, base_y + line_y*8-5, char.energy, 
		c_black, c_white, c_white, 0, 0, 0);

	//weight
	draw_text(base_x, base_y+line_y*8, "Weight: " + string(char.weight) + "kg (Next weight level: N/A)");
	//statuses
}else if (select == 0){
	base_y = 100; line_y = 45; base_x = 250;
	/*draw_set_font(fontReport);
	draw_text(base_x, base_y+line_y*9, "Statuses:");
	draw_set_font(fnt_dialogue);*/

	var map = character.statuses_count;
	var key = ds_map_find_first(map);
	var count = 0;
	var 
	for (var i=0; i < ds_map_size(map); i ++){
		if (map[? key] > 0){
			var name = string_replace_all(key, "_", " "),
				duration = "(",
				list =  character.statuses[? key];
			for (var j=0; j < map[? key]; j++)
				duration +=string(list[| j]) + ", ";
			duration += ") minutes";
			draw_text(300, base_y+line_y+count*25, name + " x" + string(map[? key]) + " " + duration);	
			count++;
		}
		key = ds_map_find_next(map, key);
	}
	
	if (count== 0){
		draw_text(300, base_y+line_y+count*25, "(No active status)");	
	}
}else if (select == 2){
	draw_text(base_x, base_y, "Likability: " + str(char.likability));
	draw_text(base_x, base_y+line_y*1, "Inflation Desire: " + str(char.desire_inflate));
	draw_text(base_x, base_y+line_y*2, "Stuffing Desire: " + str(char.desire_stuffing));
	draw_text(base_x, base_y+line_y*3, "Mental Stability: " + str(char.mental_stability));
	draw_healthbar(base_x, base_y + line_y*4, base_x + 600, base_y + line_y*5-5, char.mental_stability, 
		c_black, c_red, c_green, 0, 1, 0);
}

draw_load_cache();