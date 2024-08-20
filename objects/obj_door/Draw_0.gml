/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_sprite_part(sprite_index , image_index , 0 , height , sprite_get_width(sprite_index) , sprite_get_height(sprite_index) - height , x , y );
draw_text( x , y, string("closing_stage: {0}" , close(height) ) );