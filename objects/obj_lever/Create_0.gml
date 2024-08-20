/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
is_on = false;
is_on = global.save.levers[index];



function pull_lever()
{
	if(is_on){is_on = false; global.save.levers[index] = false;}
	else{is_on = true; global.save.levers[index] = true;}
}
function adjust_sprite()
{
	if(is_on){sprite_index = spr_lever_on}
	else{sprite_index = spr_lever_off}
}