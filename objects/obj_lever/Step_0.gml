/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(place_meeting( x , y, obj_player_test) && keyboard_check_pressed(ord("X")))
{
	pull_lever();
}
is_on = global.save.levers[index];
adjust_sprite();