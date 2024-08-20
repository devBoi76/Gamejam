


x_speed = 0;
acceleration = 5.8;
slippery = 1.25;// The larger it is the less slippery floor is. Below 1 it accelerates player.
current_slippery = slippery;
air_slippery = 0.2; // The larger it is the more slippery air is. Shall not be larger than 1.
max_x_speed = 50;

hitbox_height = global.universal_constant * 5;
hitbox_width = global.universal_constant;


x = global.target.x ;
y = global.target.y ;
//x = clamp(global.target.x , 1 , room_width - hitbox_width -1 );
//y = clamp(global.target.y , 1 , room_height - hitbox_height -1 );
y_speed = global.target.y_speed; 

old_x = x;
old_y = y;

//y_speed = 0
gravity_force = 3.2;
jump_height = 70;
failing = false;
max_y_speed = 70;

can_move = true;
jump_buffor_length = 5;
jump_buffor = 0;
coyote_jump_length = 10;
coyote_jump = 0;

past_failing = failing;
last_direction = 1;
control_flying_speed = 20;
control_failing_speed = 40;
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
			sprite_index = MandelineJump;
		}
		else if( y_speed >= -control_flying_speed && y_speed <= control_flying_speed )
		{
			sprite_index = MandelineFly;
		}
		else
		{
			sprite_index = MandelineFall;
		}
	}
	else { if(_left || _right){did_landed = false;} sprite_index = MandelineIdle; };
	if(did_landed){sprite_index = MandelineLand;}
	image_index = _image_index;
    if (sprite_index == MandelineLand && image_index >= image_number - 1) {did_landed = false; sprite_index = MandelineIdle }
	if( (x_speed < -control_x_speed || x_speed > control_x_speed) && !failing ){sprite_index = MandelineWalk; }
}

global.save.save_room = room_get_name(room);