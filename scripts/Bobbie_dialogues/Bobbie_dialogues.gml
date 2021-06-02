function Bobbie_dialogues(){
	dialogue_init()
	
	if (in_house())
		dialogue_create(
		        "1",
		        "Let's smoke more weed!",
		        false,
		        "(Event not implemented)"
		)
	
	dialogue_create(
		        "2",
		        "Make a purchase",
		        true,
		       bobbie_shop
		)

		
	eating_out_ask(Bobbie);
	dialogue_start(true);
	
	ctb_msg(cmd_speaker(Bobbie)+"Welcome to my secret shop! (she opened her backpack, revealing all the goods).");
}

function Bobbie_eating_out(){
	ctb_msg(
		cmd_speaker(Bobbie) + cmd_ex(ex_talk)  +cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", 
		cmd_ex(ex_idle) +cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_ex(ex_smile2) + cmd_sound(get_random_asset("chewsoft", 1,4)) + "Thank you so much for the free food, I'm definitely not going to waste any of it!",
		cmd_ex(ex_smile)+ cmd_sound(get_random_asset("chewsoft", 1,4)) + "(Bobbie said as she rapidly consume all the food)",
		cmd_ex(ex_idle) + cmd_speaker(noone) + "You can't help but think that Bobbie and Amber are alike in this aspect.",
		cmd_speaker(Bobbie) +cmd_ex(ex_blush) + cmd_speaker(noone) +"As you both finish, you can see Amber, ahem, Bobbie flopping back with her ball-like belly up like a stoned goldfish",
		cmd_speaker(Bobbie) + cmd_ex(ex_idle)+ "..."
	)
}

function Bobbie_drink_kitchensink(){
	global.scene_name = "Drink";
	global.scene_inflate_rate = 2;
	scene_add_actors(Bobbie, ORAL, WATER);
	background_set(sprKitchenZoomed);
	scene_auto_sound(ORAL, WATER);
	global.scene_sound_action = list_create(sndFlowWater, sndSwallowWater);
}

function bobbie_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(IWeedBag, IWeedBagExotic, ISmokingPipe,ICigarettePack);	
		global.last_room = room;
		room_goto(rmShop);
}