menu.step();

if menu.read_element("continue") {
	room_fade( global.save.save_x , global.save.save_y , asset_get_index(global.save.save_room) );
}

if menu.read_element("reset_game") {
	global.save.reset();
	global.save.write("save");
}

if menu.read_element("settings") {
	room_fade( global.save.save_x , global.save.save_y , asset_get_index(global.save.save_room) );
}

if menu.read_element("exit_game") {
	game_end();
}