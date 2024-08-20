

	//// checking for pressed keys.
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space)
	|| keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up);


	//// controling player X movement.
	x_speed = x_speed / current_slippery;
	if(can_move){x_speed = x_speed + (_right - _left) * acceleration ;}
	x_speed = try_move_x( x_speed , hitbox_width , hitbox_height );
	x = clamp( x + x_speed , 1 , room_width - hitbox_width -1 );
	
	
	// controlling player sprite sprite
	if(_left){last_direction = -1;}
	if(_right){last_direction = 1;}

	adjust_sprite( _left , _right , _jump);
	
	
	
	//// Adjusting silppery and controling jump buffor.
	current_slippery = slippery + ( - failing * (slippery - 1) * air_slippery );
	
	jump_buffor--;
	jump_buffor = clamp(jump_buffor + _jump * jump_buffor_length , 0 , jump_buffor_length);


is_mirrored = ! bool( x_speed + 0.5);

	//// controling player Y movement.
y_speed = clamp(y_speed + gravity_force , - max_y_speed , max_y_speed );
if(coyote_jump && jump_buffor && can_move ) { y_speed = - jump_height; jump_buffor = 0; }
	past_failing = y_speed / max_y_speed;
y_speed = try_move_y( y_speed , hitbox_width , hitbox_height );
y = clamp( y + y_speed , 1 , room_height - hitbox_height -1 );



	//// Camera controls.
var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var _gotoX = x + (_hor * 500);
var _gotoY = y + (_ver * 500);

oCamera.move_target_px = _gotoX;
oCamera.move_target_py = _gotoY;

	//// Temporary
if(keyboard_check(vk_enter)){ x = old_x; y = old_y; }

// aktualizuj pozycje dla listenera audio
audio_listener_position(x + hitbox_width/2, y, 0)
audio_listener_orientation(0, 0, -1000, 0, 1, 0)
//audio_listener_orientation(0, 0, 1, lengthdir_x(1, direction), lengthdir_y(1, direction), 0);

