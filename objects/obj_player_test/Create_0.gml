/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
x = 50;
y = 150;
depth = 0;

x_speed = 0;
acceleration = 1.5;
slippery = 1.25; // The larger it is the less slippery floor is. Below 1 it accelerates player.
max_x_speed = 15;


y_speed = 0;
gravity_force = 1;
jump_height = 20;
failing = false;
max_y_speed = 30;

hitbox_height = 120;
hitbox_width = 30;


sprite_index = spr_player;

layer_hitbox_id = layer_get_id("Tiles_Hitbox");
global.tilemap_hitbox_id = layer_tilemap_get_id(layer_hitbox_id);
