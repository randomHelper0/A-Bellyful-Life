if (is_npc)
	exit;

skew_step();

stomach_content  = stomach_water + stomach_air + stomach_food;
bowels_content  = bowels_water + bowels_air + bowels_food;
total_content = stomach_content + bowels_content;
total_capacity = stomach_capacity + bowels_capacity;
encumbered =  (total_content/total_capacity > 0.5);

//no divide by 0
stomach_content = max(0.1, stomach_content);
bowels_content = max(0.1, bowels_content);
total_content = max(0.1, total_content);
//digest_step(0.01);

/*calories_unabsorbed = 0;
    
for (i = 0; i < instance_number(Item); i++){
    item = instance_find(Item,i);
    if (item.character == id){
        if (item.in_stomach){
            stomach_content += item.volume;
            calories_unabsorbed += item.calories;
        }else{
            bowels_content += item.volume;
        }
    }
}*/

//belly_size = round(stomach_content/stomach_capacity*2)
belly_size = (stomach_content/stomach_capacity)*55
    + (bowels_content/bowels_capacity)*55;
	
belly_size *= (stomach_capacity + bowels_capacity)/final_capacity;

//clip to 100%
belly_size = min(100, belly_size);

 var spr_name = "spr" + name + "_" + string(fat_level);
 sprite_index = asset_get_index(spr_name);
 belly_index = min((belly_size/100)*image_number, image_number-1);
 
/*if (belly_size > 3)
    belly_size = 3;*/

weight = base_weight + fat_calories/5000;

//reset arrived notice flag on new day
if (!visited){
	arrived_notice = false;	
}

if (arrived_notice && !instance_exists(obj_textbox)){
	ctb_list(noone, noone, name + " has arrived at your place.");	
	arrived_notice = false;
}