/// @description ctb_list(finish script, finish room, text, text, text...)
/// @param finish script
/// @param  finish room
/// @param  text
/// @param  text
/// @param  text...
function ctb_list() {
	//var d = argument[0]
	//with(obj_textbox) instance_destroy();;
	var d = instance_create(5,room_height-125,obj_textbox);
	d.finish_script = argument[0];
	d.finish_room = argument[1];
	d.char_sprite = sprBlank;

	for (var i = 2; i < argument_count; i ++){
	    d.temp = argument[i];
	   with (d) ctb_add_text( temp );
	}

	return d;



}
