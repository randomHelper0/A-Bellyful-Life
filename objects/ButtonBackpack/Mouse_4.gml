var __b__;
__b__ = action_if(visible);
if __b__
{
global.last_room = room;
global.last_bg =  background_get();
//show_message(sprite_get_name(global.last_bg));
room_goto(rmBackpack);

}
