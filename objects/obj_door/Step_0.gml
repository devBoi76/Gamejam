/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
is_on = global.save.levers[index];
if(is_on)
{
	height = clamp(height + opening_speed , 0 , sprite_get_height(sprite_index));
}
else
{
	height = clamp(height - opening_speed , 0 , sprite_get_height(sprite_index));
}

update(close(height));