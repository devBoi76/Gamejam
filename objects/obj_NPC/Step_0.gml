/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var is_close_enough_to_talk = distance_to_object(obj_player_test) < attention_distance;

stretch = sin( current_time * 0.002 ) * 3;

if(is_chest > -1)
{
	stretch = 0;
}



attention( is_close_enough_to_talk and not (is_chest > -1 and global.save.chests[is_chest]) );


my_textbox.dialog_appear();

if (is_chest > -1 and global.save.chests[is_chest] == 1) {
	my_textbox.current_text = -1;
	my_textbox.is_over = true;
	//return;
}
	
if (not talk_only_once and my_textbox.is_over and is_chest <= -1) or (is_chest > -1 and global.save.chests[is_chest] == 0) {
	my_textbox.start_dialog()
	started_dialog = true
}


if not my_textbox.is_over and (keyboard_check_pressed(ord("X"))
and not block_manual_start)
and ((ignore_distance) or (is_close_enough_to_talk and not ignore_distance))// and !(is_chest > -1 and global.save.chests[is_chest]))
{
		my_textbox.next_dialog()
}

if(is_chest > -1 and my_textbox.is_over == true)
{
	global.save.chests[is_chest] = 1;
}









if (start_force_talking) {
	show_debug_message("START_FORCE_TALKING!!!")
	my_textbox.next_dialog()
	start_force_talking = false
	ignore_distance = true
}




if(!is_close_enough_to_talk) and my_textbox.current_text != -1 and not ignore_distance
{
	my_textbox.current_text = -1;
}
