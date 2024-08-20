/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_sprite_ext( sprite_index , image_index , x + (hitbox_width /2) - (sprite_get_width(sprite_index) / 2)  - ((last_direction / 2) - 0.5) * sprite_get_width(sprite_index) , y + hitbox_height - sprite_get_height(sprite_index) , last_direction , 1 , 0 , c_white , 1 );

draw_set_color(c_lime)
draw_circle(x + sprite_width/2, y, 10, false)