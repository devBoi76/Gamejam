
if file_exists("en.json") {

var file = file_text_open_read("en.json");
var json_string = "";
while (!file_text_eof(file)) {
	json_string += file_text_readln(file);
}
file_text_close(file);

global.lang = json_parse(json_string);
}

global.target =
{
	x : 330,
	y : 450
}


save_constructor = function() constructor
{
	save_room = "room_start";
	inventory = array_create(array_length(global.lang.inventory));
	var _i = 0;
	repeat(array_length(inventory))
	{
		inventory[_i] = 0;
		_i ++;
	}
	_i = 0;
	enemies = array_create(10);
	repeat(10)
	{
		enemies[_i] = 0;
		_i ++;
	}
	chests = array_create(10);
	_i = 0;
	repeat(10)
	{
		chests[_i] = 0;
		_i ++;
	}
}

global.save = new save_constructor();

save_load("save");

room_goto(asset_get_index(global.save.save_room));

randomize();