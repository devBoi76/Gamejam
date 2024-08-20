//room_goto(rMenu);

if file_exists("en.json") {

var file = file_text_open_read("en.json");
var json_string = "";
while (!file_text_eof(file)) {
	json_string += file_text_readln(file);
}
file_text_close(file);

global.lang = json_parse(json_string);
}

global.last_player_pos =
{
	x: 0,
	y: 0
}


save_constructor = function() constructor
{
	current_scale = 1;
	save_room = "room_start";
	save_x = 100;
	save_y = 100;
	respawn_room = "room_start";
	respawn_x = 100;
	respawn_y = 100;
	inventory = array_create(array_length(global.lang.inventory) , 0);
	enemies = array_create(10 , 0);
	chests = array_create(10 , 0);
	enemies_highscores = array_create(10 , 0);
	levers = array_create(10 , 0 );
	
	static load = function(_save_name)
	{
	ini_open(_save_name);
	current_scale = ini_read_real( "scale" , "scale" , 1 );
	save_room = ini_read_string("room" , "save_room" , "room_start");
	save_x = ini_read_real("room" , "save_x" , 100);
	save_y = ini_read_real("room" , "save_y" , 100);
	respawn_room = ini_read_string("respawn" , "respawn_room" , "room_start");
	respawn_x = ini_read_real("respawn" , "respwan_x" , 100);
	respawn_y = ini_read_real("respawn" , "respawn_y" , 100);
	var _i = 0;
	for( _i = 0; _i < array_length(inventory) ; _i++ )
	{
		inventory[_i] = ini_read_real( "inventory" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(enemies) ; _i++ )
	{
		enemies[_i] = ini_read_real( "enemies" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(chests) ; _i++ )
	{
		chests[_i] = ini_read_real( "chests" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(enemies_highscores) ; _i++ )
	{
		enemies_highscores[_i] = ini_read_real( "enemies_highscores" , string(_i) , 0);
	}
	for( _i = 0; _i < array_length(levers) ; _i++ )
	{
		levers[_i] = ini_read_real( "levers" , string(_i) , 0);
	}
	ini_close();
	}
	
	static write = function(_save_name)
	{
	ini_open(_save_name);
	ini_write_real("scale" , "scale" , current_scale );
	ini_write_string( "room" , "save_room" ,save_room );
	ini_write_real( "room" , "save_x" ,save_x );
	ini_write_real( "room" , "save_y" ,save_y );
	ini_write_string( "respawn" , "respawn_room" ,respawn_room );
	ini_write_real( "respawn" , "respawn_x" ,respawn_x );
	ini_write_real( "respawn" , "respawn_y" ,respawn_y );
	var _i = 0;
	for( _i = 0; _i < array_length(inventory) ; _i++ )
	{
		ini_write_real( "inventory" , string(_i) , inventory[_i]);
	}
	for( _i = 0; _i < array_length(enemies) ; _i++ )
	{
		ini_write_real( "enemies" , string(_i) , enemies[_i]);
	}
	for( _i = 0; _i < array_length(chests) ; _i++ )
	{
		ini_write_real( "chests" , string(_i) , chests[_i]);
	}
	for( _i = 0; _i < array_length(enemies_highscores) ; _i++ )
	{
		ini_write_real( "enemies_highscores" , string(_i) , enemies_highscores[_i]);
	}
	for( _i = 0; _i < array_length(levers) ; _i++ )
	{
		ini_write_real( "levers" , string(_i) , levers[_i]);
	}
	
	ini_close();
	}
	
	static reset = function()
	{
		save_room = "room_start";
		save_x = 100;
		save_y = 100;
		respawn_room = "room_start";
		respawn_x = 100;
		respawn_y = 100;
		inventory = -1; inventory = array_create(array_length(global.lang.inventory) , 0);
		enemies = -1; enemies = array_create(10 , 0);
		chests = -1; chests = array_create(10 , 0);
		enemies_highscores = -1; enemies_highscores = array_create(10 , 0);
		levers = -1; levers = array_create(10 , 0 );
	}
	
}

global.universal_constant = sprite_get_height(spr_tileset);

global.save = new save_constructor();

global.save.load("save");

global.target =
{
	x : global.save.save_x,
	y : global.save.save_y,
	y_speed : 0
}


global.npc_dialog_options = array_create(array_length(global.lang.npc) , 0 );

room_goto(asset_get_index(global.save.save_room));

randomize();
