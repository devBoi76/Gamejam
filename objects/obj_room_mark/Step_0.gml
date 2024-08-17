/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(place_meeting( x , y , obj_player_test ))
{
	if(active)
	{
		detected_player_id = instance_place( x , y , obj_player_test);
		active = false;
		global.target.x = x_target;
		global.target.y = y_target;
		detected_player_id.can_move = false;
		var _fading_room = instance_create_depth( 0 , 0 , -999 , obj_fading_room );
		_fading_room.is_fading = true;
		_fading_room.target_room = room_to;
		_fading_room.tint = 0;
	}
}
else
{
	active = true;
}
if(active)
{
	colour = c_blue;
}
else
{
	colour = c_red;
}