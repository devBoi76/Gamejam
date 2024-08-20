/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
is_on = false;
buttons = new button_group();

var separation;

buttons.add_element( x , y , "continue_pause" , "basic" , false);
buttons.add_element( x , y , "options_pause" , "basic" , false);
buttons.add_element( x , y , "exit_pause" , "basic" , false);

do_toggle = function() {
	is_on = not is_on	
}