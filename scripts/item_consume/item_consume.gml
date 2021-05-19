function item_consume(item, target){
	
	item.bites = 0;
	target.stomach_food += item.volume;
	target.undigested_calories += item.calories;
	eat_sound(item);
	if (item.energy > 0){
		change_energy(target, item.energy, 1);
		target.jittery += item.energy;	
	}
	if (item.alcohol > 0){
		target.alcohol += item.alcohol;
	}
	item.uses --;
}

function item_consume_part(item, target){
	if (item.do_expire && item.expire_in < 0){
		ctb_list(noone, noone, "Item expired");
		return;	
	}
	item.bites --;
	target.stomach_food += item.bite_volume;
	target.undigested_calories += item.bite_calories;
	if (item.alcohol > 0){
		target.alcohol += item.bite_alcohol;
	}
	eat_sound(item);

	if (item.bite_energy > 0){
		change_energy(target, item.bite_energy, 1);
		target.jittery += item.bite_energy;	
	}
}

function d_item_consume(){
	global.player_eat_item = ItemWindow.item;
	dialogue_init();
		if ( ItemWindow.item.bites > 1){
			dialogue_create(
			"1",
			"Take a bite",
			true,
			d_player_bite
			)
		}
		
		dialogue_create(
		"2",
		"Eat all",
		true,
		d_player_consume
		)
	dialogue_start(true);
}

function d_player_bite(){
	item_consume_part(global.player_eat_item, Player)
}

function d_player_consume(){
	if (global.player_eat_item.do_expire && global.player_eat_item.expire_in < 0){
		ctb_list(noone, noone, "Item expired");
		return;	
	}
	
item_consume(global.player_eat_item, Player);
if (global.player_eat_item.uses <= 0)
	with (global.player_eat_item) instance_destroy();
else
	global.player_eat_item.uses --;
with (ControlBackpack) refresh_backpack();
}