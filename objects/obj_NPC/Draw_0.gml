/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_sprite_stretched(sprite_index , image_index , x , y - stretch ,
	(sprite_get_width(sprite_index)) * image_xscale ,
	(sprite_get_height(sprite_index) + stretch) * image_yscale );
draw_sprite_ext( spr_npc_test_attention , image_index , x , y - stretch - sprite_get_height(spr_npc_test_attention) - 5 , 1 , 1, 0, #ffffff , attention_variable);
draw_text( x , y + 10 , string(global.lang.npc[index].name));
draw_text( x , y + 30 , string("{0}" , array_length(dialogs_array)));
