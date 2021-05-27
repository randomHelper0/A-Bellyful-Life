alarm[0] = 2;
global.show_follower = false;
global.values = ds_map_create();
global.scene_actors = ds_list_create();
global.scene_sound_action =  noone;
global.scene_sound_sporadic =  ds_map_create();
global.scene_sound_sporadic_rate = -1;
global.watched_inflate = false;
global.scene_from = noone;

global.last_bg = noone;
global.shop_bg = sprBlank;
global.clicked_shop_bt = noone;

global.dialogies = noone;
global.dialogies_icons = noone;

global.settings = ds_map_create();
global.settings[? "burp sound"] = false;
global.settings[? "fart sound"] = false;

global.last_dest = rmBedroom;

audio_group_load(sndGroup_walk);

/*audio_play_sound(sndWind, 0, 1);
audio_play_sound(sndRain, 0, 1);

audio_sound_gain(sndWind, 0, 0);
audio_sound_gain(sndRain, 0, 0);*/

has_bike = false;

raining = 0;
minutes = 30;
hours = 6;
day = 0;
fat_essences = 0;
//show_debug_overlay(true);
screen_lock = false;
//ctb_list(noone, noone, "test", "test2");


stat_init();
abilities_init();
//show_debug_message("before init")
//show_debug_message(string(Player)+", "+string(FatbucksCashier))
item_init(Player, Aria, Aya, Yumi,  Amber, Bobbie, FatbucksCashier, FatdonaldsCashier, FataurantCashier,  Bartender, Nurse);
//instance_create(-200,-200, );
//show_debug_message("affter init")
    //Librarian);
item_init(ICocktail1, ICocktail2, ICocktail3, ICocktail4,
IPump, IApple,IOrange, ICakeSlice, INextLine,
IEspresso, IFrappuccino, IGreenTeaFrap, IOrangeJuice, ISoda, ISundea, IMilk,
	IHamburger, IHotdog, IHugeburger, IFries,
	 IPillDiet, IPillDigest, IPillGas, IPillNoise, IPillLaxative,
		IBottleDiet, IBottleDigest, IBottleGas, IBottleNoise, IBottleLaxative,
		IBike);
//create_item(instance_find(IPump,0));
create_item(instance_find(IPillDiet,0));
create_item(instance_find(IBottleDiet,0));
for (i = 0; i <8; i ++){
    create_item(instance_find(ICakeSlice,0));
}

location = noone;

global.dialogue_char = noone;
global.zone_stomach = noone;
global.zone_bowels = noone;
global.dialogue_char = noone;
register_location_close_times();

//Player.name = get_string("Please enter your name:", "Bobbie");

alarm[10] = 100;

money = 500;

counter = 0;

global.status_desc = ds_map_create();
global.status_desc[? "pill_digest"] = "(Increase digestion speed by 50% (stackable). Side effects: higher stomach pressure (harder to inflate), gas production, loose some energy over time)";
global.status_desc[? "pill_diet"] = "(Decrease digestion speed by 50%(stackable). Side effects: Max energy temporary reduced by 5%. ";
global.status_desc[? "pill_gas"] = "Increase stomach gas production";
global.status_desc[? "pill_noise"] = "Increase stomach noise production";
global.status_desc[? "pill_laxative"] = "";
global.status_desc[? "pill_relaxant"] = "";


//shader
blur = -1;
usize = shader_get_uniform(shaderBlur,"size");//uniform for width, height, radius