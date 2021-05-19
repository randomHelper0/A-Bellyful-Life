function fatdonalds_location(){
	return rmFatdonalds;
}

function fatdonalds_dialogue(){
	
	dialogue_init();
	

	if (!FatdonaldsCashier.player_registered){
		dialogue_create(
		        "1",
		        "Ask for part time job",
		        true,
		       d_fatdonalds_ptj
		)
	}else{
		dialogue_create(
		        "1",
		        "Quit part time job",
		        true,
		       d_fatdonalds_quit
		)
	}
	
	dialogue_create(
		        "2",
		        "Make a purchase",
		        true,
		       d_fatdonalds_shop
		)

	dialogue_start(true);
}

function d_fatdonalds_shop(){
		global.shop_bg = background_get();
		global.shop_items = list_create(IHamburger, IFries, IHotdog, ISoda, IEspresso, ISundea, IHugeburger);	
		global.last_room = room;
		room_goto(rmShop);
}

function d_fatdonalds_quit(){
	FatdonaldsCashier.last_cancelled = 3;
	FatdonaldsCashier.player_registered = false;
	
	ctb_list(noone, noone, "You're no longer a Fatbucks employee");
}

function d_fatdonalds_ptj(){
	if (FatdonaldsCashier.last_cancelled > 0){
		ctb_list(noone, noone, "You've just quit a few days ago! Maybe wait a few more days?");
		return;
	}
	
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "Accept!",
	        true,
	       d_fatdonalds_accept
	)
	
	dialogue_create(
	        "2",
	        "I'll think about it",
	        false,
	       "Alright"
	)

	dialogue_start(false);
	ctb_list(noone, noone,"You took some time to contemplate the job:#The pay is low, but you don't need to do much.","(Per hour) pay: $11, energy use: 8, mood: very  boring");
}

function d_fatdonalds_accept(){
	FatdonaldsCashier.player_registered = true;
	
	dialogue_init();

	dialogue_create(
	        "1",
	        "7-12am",
	        true,
	       d_fatdonalds_1stshift
	)
	
	dialogue_create(
	        "2",
	        "12am-5pm",
	        true,
	       d_fatdonalds_2ndshift
	)
	
	dialogue_create(
	        "3",
	        "5pm-10pm",
	        true,
	       d_fatdonalds_3rdshift
	)

	dialogue_start(false);
	ctb_list(noone, noone,"Welcome abroad! Which shift do you want to take?");
}

function d_fatdonalds_1stshift(){
	FatdonaldsCashier.player_shift = 1;
}
function d_fatdonalds_2ndshift(){
	FatdonaldsCashier.player_shift = 2;
}
function d_fatdonalds_3rdshift(){
	FatdonaldsCashier.player_shift = 3;
}