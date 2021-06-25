depth = -99;

draw_cached();
draw_self();
draw_set_font(fontReport);
draw_set_color(c_black);
draw_text(x+ 10,y+8, string_hash_to_newline(item.name));
draw_set_font(fnt_dialogue);

draw_set_color(c_white);
if (item.price > 0)
	draw_text(x+10,y+ 70, string_hash_to_newline("Price: $" + string(item.price)));

if (item.volume > 0){
	draw_text(x+10,y+ 105, string_hash_to_newline("Volume: " + string(item.volume) + "cc"));
	draw_text(x+10,y+ 142,  string_hash_to_newline("Calories: " + string(item.calories)));
}

var desc = item.desc;
if (item.energy > 0)
	desc = "Energy: +" + string(item.energy) + ". "  + desc;
if (item.alcohol > 0)
	desc = "Alcohol: +" + string(item.alcohol) + ". "  + desc;
if (item.high > 0)
	desc = "High: +" + string(item.high) + ". "  + desc;
draw_text_ext(x+10,y+ 177, string_hash_to_newline(desc), -1, 450);
//if(item.hours_left > 0)

if (item.do_expire){
	if(item.expire_in > 60)
		draw_text(x+10,y+ 252 , string_hash_to_newline("Hours left: " + string(item.expire_in/60)));
	else
		draw_text(x+10,y+ 252 , string_hash_to_newline("Minutes left: " + string(item.expire_in)));
}else if (item.uses > 0){
	draw_text(x+10,y+ 252 , string_hash_to_newline("Uses left: " + string(item.uses)));
}

draw_load_cache();