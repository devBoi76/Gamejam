/// @description Wstaw opis w tym miejscu

my_textbox.draw_dialog(spr_textbox, spr_namebox);

if(is_chest > -1)
{
	draw_text( 50 , 600 , string(global.save.chests[is_chest]));
}