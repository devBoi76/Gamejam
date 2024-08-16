room_goto_next();

if file_exists("en.json") {

var file = file_text_open_read("en.json");
var json_string = "";
while (!file_text_eof(file)) {
	json_string += file_text_readln(file);
}
file_text_close(file);

global.lang = json_parse(json_string);
}