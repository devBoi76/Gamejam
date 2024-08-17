
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space)
	|| keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up);
	
	jump_buffor--;
	jump_buffor = clamp(jump_buffor + _jump * jump_buffor_length , 0 , jump_buffor_length);



x_speed = x_speed / slippery;
if(can_move){x_speed = x_speed + (_right - _left) * acceleration ;}
x_speed = try_move_x( x_speed , hitbox_width , hitbox_height );
x = clamp( x + x_speed , 1 , room_width - hitbox_width -1 );


y_speed = clamp(y_speed + gravity_force , - max_y_speed , max_y_speed );
if(coyote_jump && jump_buffor && can_move ) { y_speed = - jump_height; jump_buffor = 0; }
y_speed = try_move_y( y_speed , hitbox_width , hitbox_height );
y = clamp( y + y_speed , 1 , room_height - hitbox_height -1 );


if(keyboard_check(vk_enter)){ x = old_x; y = old_y; }

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var _gotoX = x + sprite_width/2 + (_hor * 200);
var _gotoY = y + sprite_height/2 + (_ver * 200);

oCamera.move_target_px = _gotoX;
oCamera.move_target_py = _gotoY;