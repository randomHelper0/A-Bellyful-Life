///@desc Defining global settings

///@func defSet(PropertyName,Value)
///@desc register the value passed case not exist value to the setting
///@param {String} setg Config name
function defSet(setg,value){
	if(!ds_map_exists(global.settings,setg))
	 global.settings[? setg] = value;
}
global.last_room = room;
global.save_tab = 0;
global.upload_content = noone;
global.settings = ds_map_create();
game_config_load();
 defSet("All Sounds",true);
 defSet("Music",true);
 defSet("Skew Animation",true);
 defSet("Enable Portals",false);
 defSet("Blurr Backgrounds",true);
 defSet("Belly Burst",true);
 defSet("burp sound",false);
 defSet("fart sound",false);
 defSet("vomit sound",true);
 defSet("Fullscreen",false);
 defSet("Snowing",true);
game_config_save();

global.version = "0.3.0";

global.screen_lock = false;