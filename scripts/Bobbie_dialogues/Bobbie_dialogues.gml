function Bobbie_dialogues(){
	dialogue_init()
	
	if (in_house())
		dialogue_create(
		        "1",
		        "Let's smoke more weed!",
		        true,
		        Bobbie_smoke_together//"(Event not implemented)"
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
		custom_goto(rmShop);
}

function Bobbie_smoke_together(){
	ctb_list(Bobbie_smoke2, noone, "[speaker:Bobbie][ex:ex_smile] Hope you don't mind but when I smoke I tend to get a [font:large]MASSIVE[font:normal] case of the munchies",
	"[speaker:Player] Oh, I don't mind at all...",
	"[speaker:Player] In fact, please dont hesitate to use my fridge",
	"[speaker:Bobbie][ex:ex_surprise] [font:large] OH WORD!? [font:normal] That's real cool of you "+Player.name+" you're a true homegirl",
	"[speaker:Player][ex:ex_idle] Don't even worry about it, I like to help",
	"[speaker:noone] *Time passes and Bobbie begins to feel the effects of her smoking binge*",
	"[speaker:Bobbie] [ex:ex_smile2] You ever just have a moment where you forgot what you were thinking",
	"[speaker:Player] Yeah, I get tha-",
	"[speaker:noone][sound:snd_hungry4]*A loud gurgle from Bobbie's belly seems to have interrupted your train of thought",
	"[speaker:Bobbie][ex:ex_blush] Yooo I'm pretty hungry, I'd bet you could probably already tell",
	"[speaker:Bobbie][ex:ex_smile] Could I maybe dig into your food now?");	
	
}

function Bobbie_smoke2(){
	global.has_food = false;
	with (Item){
		if (!is_template){
			if (calories > 0){
				global.has_food = true;	
			}
		}
	}
	
	if (!global.has_food){
		Bobbie.likability += 3;
		Bobbie.high += 20;
		Player.high += 20;
		ctb_msg(
			"[speaker:Bobbie][ex:ex_sad] Oh, it looks like you don't have much...",
			"[speaker:Player]That's alright I'll restock for next time",
			"[speaker:noone]It looks like Bobbie likes you a bit more",
			"[speaker:noone]Maybe have some more food next time if you want something to happen ;)"
		)
	}else{
		Bobbie.likability += 6;
		Bobbie.high += 30;
		Player.high += 30;
		Bobbie.desire_stuffing += 10;
		
		global.food_left = 3;
		with (Item){
				if (!is_template){
					if (calories > 0 && global.food_left ){
						global.food_left --;
						item_consume(id, Bobbie);
						item_consume(id, Player);
						instance_destroy();	
					}
				}
			}
		if (!Bobbie.first_stuffing){
			Bobbie.first_stuffing = true;
			ctb_msg("[speaker:noone]Renders not completed, sorry :(",
				"[speaker:Bobbie][ex:ex_surprise]*Bobbie opens the fridge and is positively overwhelmed at the mass of food stored there*",
				"[speaker:Player][c:blue] Hmm... I wonder how much that girl can fit in her belly? [c:default]",
				"[speaker:Bobbie][ex:ex_smile]Hey, Y'know this stuff really calms my nerves.",
				"[speaker:Bobbie]Would you mind feeding m-",
				"[speaker:Player]On it!",
				"[speaker:noone]You immedately start stuffing Bobbie with as much food and drink as you have",
				"[speaker:Bobbie][sound:burp1]Woah, that was some surreal shit...",
				"[speaker:Bobbie]I feel super bloated and I can't quite say I dislike it",
				"[speaker:Bobbie]Can we maybe do this again?",
				"[speaker:Player]Anytime!",
				"[speaker:noone]Bobbie has begun to feel a craving to stuff herself, keep it up :)")
		}else{
			ctb_msg(
				"[speaker:noone]Bobbie seems eager this time to get the stuffing on, you feed her and she rubs her belly",
				"[speaker:noone]Bobbie's like for stuffing has increased largely"
			);
		}
	}	
}