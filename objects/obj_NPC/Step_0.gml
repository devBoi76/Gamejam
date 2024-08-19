/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(distance_to_object(obj_player_test) < attention_distance)
{
	want_talk = true;
}
else
{
	want_talk = false;
}
stretch = sin( current_time * 0.002 ) * 3;

attention(want_talk);

if(keyboard_check_pressed(ord("X")) && want_talk)
{
	my_textbox.next_dialog();
}