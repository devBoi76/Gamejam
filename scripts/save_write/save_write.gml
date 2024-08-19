// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function save_write( _save_name)
{
	ini_open(_save_name);
	ini_write_string( "room" , "save_room" , global.save.save_room );
	for( _i = 0; _i < array_length(global.save.inventory) ; _i++ )
	{
		ini_write_real( "inventory" , string(_i) , global.save.inventory[_i]);
	}
	for( _i = 0; _i < array_length(global.save.enemies) ; _i++ )
	{
		ini_write_real( "enemies" , string(_i) , global.save.enemies[_i]);
	}
	for( _i = 0; _i < array_length(global.save.chests) ; _i++ )
	{
		ini_write_real( "chests" , string(_i) , global.save.chests[_i]);
	}
	ini_close();
}