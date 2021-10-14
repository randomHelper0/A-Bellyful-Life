init_data_excludes("statuses_count", "statuses", 
		"eating_out_script", "visit_location", 
		"sprite_expression", "expression",
		"script_location", "script_dialogue", "script_idle", "script_observe",
		"eating_out", "eating_out_threshold", "eating_out_location", "eating_out_items",
		"inflate_interest_msg", "disinterest_msg", "hate_msg", "stuffing_interest_msg","arrive_msg",
		"status_notify");

//sprites
sprite_expression = noone;
expression = ex_idle;
high = 0;
using_mpump = false;
libido = 0;

pop_warning = false;
popped = 0;
popping = false;

//common stats, attributes
go_resort = false;
affection = 0;
likability = 0;
mental_stability = 100;
academic_readiness = 80;
energy = 60;
energy_max = energy;
mood = 100;
shower_times = 0;
TV_times = 0;
encumbered = false;
hunger = 0;
hours_without_eating = 0;
undigested_calories = 0;
daily_calories = 0;
fat_calories = 0;
hourly_calories_uptake = 2000/24;
min_calories_uptake = hourly_calories_uptake/60;
base_weight = 40;
weight = base_weight;
jittery = 0;
alcohol = 0;
high = 0;
daily_stomach_content = 0;
daily_bowels_content = 0
daily_minutes = 0;

//script ids
script_location = scrBlank;
script_dialogue = scrBlank;
script_idle = scrBlank;
script_observe = scrBlank;

//digestion values
belly_size = 0; //0-100
belly_index = 0; //0-image_number
fat_level = 0;
calories_unabsorbed = 0;
calories_absorbed = 0;
total_content = 0;
total_capacity = 1;

stomach_water = 0;
stomach_air = 0;
stomach_food = 0;
stomach_capacity = 2000;
stomach_content = 0;
stomach_pressure = 0;
//stomach_pressure_f = 0; //time constriant (require time passing)
//stomach_pressure_f2= 0; //reduce during scene

bowels_water = 0;
bowels_air = 0;
bowels_food = 0;
bowels_capacity = 1500;
bowels_content = 0;
bowels_pressure = 0;
final_capacity = 7000;
//bowels_pressure_f = 0;
//bowels_pressure_f2 = 0;

location = noone;

//flags
has_number = false;

//object attributes
is_npc = false;
persistent = true;
visible = false;
image_speed = 0;
name = object_get_name(object_index)
//triggers = ds_list_create();

//data = ds_map_create();

//skew_init(SKEW_ABSOLUTE, 0,0,0,0);
skew_common();
statuses = ds_map_create();
ds_map_add_list(statuses, "pill_diet", ds_list_create());
ds_map_add_list(statuses, "pill_digest", ds_list_create());
ds_map_add_list(statuses, "pill_gas", ds_list_create());
ds_map_add_list(statuses, "pill_noise", ds_list_create());
ds_map_add_list(statuses, "pill_laxative", ds_list_create());

statuses_count = ds_map_create();
statuses_count[? "pill_diet" ] = 0;
statuses_count[? "pill_digest" ] = 0;
statuses_count[? "pill_gas" ] = 0;
statuses_count[? "pill_noise" ] = 0;
statuses_count[? "pill_laxative" ] = 0;

//once per day
status_notify = ds_map_create();
status_notify[? "pill_diet" ] = 15;
status_notify[? "pill_digest" ] = 15;
status_notify[? "pill_gas" ] = 15;
status_notify[? "pill_noise" ] = 15;
status_notify[? "pill_laxative" ] = 15;

//ds_map_copy(statuses_count,statuses)
//set_all_map_entries_to_value(statuses_count,0);


visiting = false;
visit_location = rmLivingroom;
following = false;
arrived_notice = false;

visit_arrival = -1;
visit_minutes = 0;
visited = false;
desire_inflate = 0;
desire_stuffing = 0;
desire_inflate = 0;
desire_stuffing = 0;
inflate_interest_msg = "(she seems interested in what you were doing)";
disinterest_msg = "(she doesn't seem very interested in what you were doing)"
hate_msg = "(she seems repulsed by what you did)";
stuffing_interest_msg =  "(she seems very interested in what you were doing)";
arrive_msg = "I'm finally here!";

eating_out = false;
eating_out_threshold = 5;
eating_out_location = noone;
eating_out_items = noone;
eating_out_script = asset_get_index(name+"_eating_out"); //-1 if not

in_bathroom = 0;
plugged = false;