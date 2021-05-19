if (persistent){
	var holder = instance_place(x,y,CharacterHolder);
	if (instance_exists(holder)){
		var char =  holder.character;
		global.dialogue_char = char;
		//item is food
		if (item.script_use == d_item_consume){
			if ((char.interest_stuffing < 30 && char.stomach_content/char.stomach_capacity >= 0.5) ||
				(char.interest_stuffing < 70 && char.stomach_content/char.stomach_capacity >= 0.9)	||
				(char.stomach_content/char.stomach_capacity >= 1.2)){
				ctb_list(noone, noone, 
					"Thank you, but I'm not hungry right now.",
					"Sorry but I'm full."
					);		
					
				exit;
			}
			
			char.interest_stuffing *= 1.05;
			
			ctb_list(noone, noone, choose(
				"thanks!",
				"yum!",
				"thank you"
			));
			item_consume(item, char);
			
			if (item.consumable && item.bites <= 0){
				if (item.uses <= 0)
					with (item) instance_destroy();
			}
			instance_destroy();
		}
	}
}


if (!persistent)
if (!ControlEnv.screen_lock){
    if (item.is_template){
        win = instance_create(
            0,0,
            BuyWindow);
        win.item = item;
        win.card = id;
    }else if (room == rmKitchenFridge){
		if (item.in_fridge && x >= ControlBackpack.x){
			item.in_fridge = false;
			with (ControlBackpack) refresh_backpack();
			with (ControlFridge) refresh_fridge();
		}else if (!item.in_fridge && x < ControlFridge.x + 300){
			item.in_fridge = true;
			with (ControlBackpack) refresh_backpack();
			with (ControlFridge) refresh_fridge();
		}
	}
}

