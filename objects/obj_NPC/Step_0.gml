/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var is_close_enough_to_talk = distance_to_object(obj_player_test) < attention_distance;

stretch = sin( current_time * 0.002 ) * 3;

attention(is_close_enough_to_talk);

if (not talk_only_once and my_textbox.is_over) {
	my_textbox.start_dialog()
}

if (keyboard_check_pressed(ord("X"))
and not block_manual_start) and
((ignore_distance) or (is_close_enough_to_talk and not ignore_distance))
{
	my_textbox.next_dialog();
}

if (start_force_talking) {
	my_textbox.next_dialog()
	start_force_talking = false
	ignore_distance = true
}

my_textbox.dialog_appear();


if(!is_close_enough_to_talk) and my_textbox.current_text != -1 and not ignore_distance
{
	my_textbox.current_text = -1;
}
