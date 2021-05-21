with(ItemCard) image_alpha = 1;
if (persistent){
	var holder = instance_place(x,y,CharacterHolder);
	if (item.script_use_on_char != noone && instance_exists(holder)){
		var char =  holder.character;
		global.dialogue_char = char;
		
		script_execute(item.script_use_on_char, char);
			
		if (item.consumable && item.bites <= 0){
			if (item.uses <= 0)
				with (item) instance_destroy();
		}
		instance_destroy();
		
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
	//check item on item in backpack
	}else if (drag_counter > 20){
		drag_counter = 0;
		var otherItemCard = instance_place(x,y,ItemCard);
			if (item.script_use_on_item != noone && instance_exists(otherItemCard)){
				script_execute(item.script_use_on_item, otherItemCard);
			
				if (item.consumable && item.bites <= 0){
					if (item.uses <= 0){
						with (item) instance_destroy();
						//refresh_backpack();
					}
				}
		
			}
	}
}

