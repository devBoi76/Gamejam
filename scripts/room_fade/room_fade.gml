// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function room_unfade()
{
	instance_create_depth( 0 , 0 , -999 , obj_fading_room);
}

function room_fade( _x , _y , _room, _y_speed = 0)
{
	_fading_id = instance_create_depth( 0 , 0 , -999 , obj_fading_room);
	_fading_id.target_room = _room;
	_fading_id.is_fading = true;
	_fading_id.tint = 0;
	if(_y_speed != 0) { _fading_id.fading_speed = clamp(abs(_y_speed), 5 , 10);}
	global.target.x = _x;
	global.target.y = _y;
	global.target.y_speed = _y_speed;
}