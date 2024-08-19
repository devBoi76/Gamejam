


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
y_speed = clamp(global.target.y_speed , -30 , 20);

old_x = x;
old_y = y;

//y_speed = 0
gravity_force = 1;
jump_height = 20;
failing = false;
max_y_speed = 30;

can_move = true;
jump_buffor_length = 20;
jump_buffor = 0;
coyote_jump_length = 10;
coyote_jump = 0;

past_failing = failing;
last_direction = 1;
control_flying_speed = 7;
control_failing_speed = 25;
control_x_speed = 1;
did_landed = false;
sprite_index = spr_player;

layer_hitbox_id = layer_get_id("Tiles_Hitbox");
global.tilemap_hitbox_id = layer_tilemap_get_id(layer_hitbox_id);

room_unfade();

function adjust_sprite(_left , _right , _jump)
{
	var _image_index = image_index;
	if( past_failing >= failing && !_left && !_right  && past_failing * max_y_speed > control_failing_speed)
	{ did_landed = true; }
	else if(failing)
	{
		//did_landed = false;
		if(y_speed < - control_flying_speed)
		{
			sprite_index = spr_player_jumping;
		}
		else if( y_speed >= -control_flying_speed && y_speed <= control_flying_speed )
		{
			sprite_index = spr_player_flying;
		}
		else
		{
			sprite_index = spr_player_falling;
		}
	}
	else { if(_left || _right){did_landed = false;} sprite_index = spr_player_standing; };
	if(did_landed){sprite_index = spr_player_jumping_ready;}
	image_index = _image_index;
    if (sprite_index == spr_player_jumping_ready && image_index >= image_number - 1) {did_landed = false; sprite_index = spr_player_standing }
	if( (x_speed < -control_x_speed || x_speed > control_x_speed) && !failing ){sprite_index = spr_player; }
}

global.save.save_room = room_get_name(room);