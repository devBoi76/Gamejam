// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function save_load(_save_name)
{
	ini_open(_save_name);
	global.save.save_room = ini_read_string("room" , "save_room" , "room_start");
	for( _i = 0; _i < array_length(global.save.inventory) ; _i++ )
	{
		global.save.inventory[_i] = ini_read_real( "inventory" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(global.save.enemies) ; _i++ )
	{
		global.save.enemies[_i] = ini_read_real( "enemies" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(global.save.chests) ; _i++ )
	{
		global.save.chests[_i] = ini_read_real( "chests" , string(_i) , 0);
	}
	ini_close();
}