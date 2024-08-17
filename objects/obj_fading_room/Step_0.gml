/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(is_fading)
{
	tint += fading_speed;
	if(tint >= 100)
	{
		room_goto(target_room);
	}
}
else
{
	tint -= fading_speed;
	if(tint <= 0)
	{
		instance_destroy();
	}
}