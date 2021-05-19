is_template = item.is_template;
if (is_template)
	exit;

if (mouse_x > x + sprite_width/2){
	with (item) instance_destroy();
	with (card) instance_destroy();
}else{
	if (item.script_use != noone)
		script_execute(item.script_use);	
}

if (!is_template)
    with (ControlBackpack) refresh_backpack();
if (item.consumable && item.bites <= 0){
	if (item.uses <= 0)
		with (item) instance_destroy();
	else
		item.uses --;
}
	
instance_destroy();
    


