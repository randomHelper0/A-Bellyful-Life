function fataurant_location(){
	return rmFataurant;
}

function fataurant_dialogue(){
	
	dialogue_init();
	

	if (!FataurantCashier.player_registered){
		dialogue_create(
		        "1",
		        "Ask for part time job",
		        true,
		       d_fataurant_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        "Quit part time job",
		        true,
		       d_fataurant_quit
		)
	}
	
	dialogue_create(
		        "2",
		        "Make a purchase",
		        true,
		       d_fataurant_shop
		)

	dialogue_start(true);
}

function d_fataurant_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(ISundea, ISoda);	
		global.last_room = room;
		custom_goto(rmShop);
}

function d_fataurant_quit(){
	FataurantCashier.last_cancelled = 3;
	FataurantCashier.player_registered = false;
	
	ctb_list(noone, noone, "You're no longer a Fatbucks employee");
}

function d_fataurant_ptj(){
	if (FataurantCashier.last_cancelled > 0){
		ctb_list(noone, noone, "You've just quit recently! Maybe wait a few more days?");
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "Accept!",
	        true,
	       d_fataurant_accept
	)
	
	dialogue_create(
	        "2",
	        "I'll think about it",
	        false,
	       "Alright"
	)

	dialogue_start(false);
	ctb_list(noone, noone,"You took some time to contemplate the job:#The pay is high, but you'll need to spend all your energy serving customers!.","(Per hour) pay: $20, energy use: 18, mood: exhausting");
}

function d_fataurant_accept(){
	FataurantCashier.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_fataurant_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_fataurant_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_fataurant_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone,"Welcome abroad! Which shift do you want to take?");
}

function d_fataurant_1stshift(){
	FataurantCashier.player_shift = 1;
}
function d_fataurant_2ndshift(){
	FataurantCashier.player_shift = 2;
}
function d_fataurant_3rdshift(){
	FataurantCashier.player_shift = 3;
}