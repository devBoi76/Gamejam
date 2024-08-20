/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(background_sprite == t_o_kana_y)
{
	if(global.save.save_room == room_miasto_1 or
		global.save.save_room == room_miasto_2 or
		global.save.save_room == room_miasto_3 )
		{
			background_sprite = t_o_miasto;
		}
}
if(background_sprite == menu_kana_y)
{
		if(global.save.save_room == room_miasto_1 or
		global.save.save_room == room_miasto_2 or
		global.save.save_room == room_miasto_3 )
		{
			background_sprite = menu_miasto;
		}
}