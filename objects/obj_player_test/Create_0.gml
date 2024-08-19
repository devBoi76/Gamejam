


x_speed = 0;
acceleration = 1.5;
slippery = 1.25;// The larger it is the less slippery floor is. Below 1 it accelerates player.
current_slippery = slippery;
air_slippery = 0.1; // The larger it is the more slippery air is. Shall not be larger than 1.
max_x_speed = 15;

hitbox_height = 120;
hitbox_width = 30;

x = clamp(global.target.x , 1 , room_width - hitbox_width -1 );
y = clamp(global.target.y , 1 , room_height - hitbox_height -1 );

old_x = x;
old_y = y;

y_speed = 0;
gravity_force = 1;
jump_height = 20;
failing = false;
max_y_speed = 30;

can_move = true;
jump_buffor_length = 20;
jump_buffor = 0;
coyote_jump_length = 10;
coyote_jump = 0;


last_direction = 1;
sprite_walking = spr_player;


sprite_index = sprite_walking;

layer_hitbox_id = layer_get_id("Tiles_Hitbox");
global.tilemap_hitbox_id = layer_tilemap_get_id(layer_hitbox_id);

instance_create_depth( 0 , 0 , -999 , obj_fading_room);

global.save.save_room = room_get_name(room);