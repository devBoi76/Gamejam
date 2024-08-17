menu.step();

if menu.read_element("settings") {
	room_goto(Room_test);
}

if menu.read_element("exit_game") {
	game_end();
}