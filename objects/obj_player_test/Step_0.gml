/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//x_speed = x_speed / slippery;

//x_speed = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * movement_speed;




//if(!failing)
//{
//	y_speed = - (keyboard_check(vk_space)) * jump_height;
//}
//y_speed += gravity_force;



//if( x_speed < 0 )
//{
//	x_speed = try_move_x_left(x_speed ,  hitbox_width , hitbox_height );
//}
//else
//{
//	x_speed = try_move_x_right(x_speed ,  hitbox_width , hitbox_height );
//}
//x += x_speed;

//if( y_speed < 0 )
//{
//	y_speed = try_move_y_up( y_speed , hitbox_width , hitbox_height );
//}
//else
//{
//	y_speed = try_move_y_down( y_speed , hitbox_width , hitbox_height );
//}
//y += y_speed;
var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _jump = keyboard_check(ord("W")) || keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(vk_up);


x_speed = x_speed / slippery;
x_speed = x_speed + (_right - _left) * acceleration ;
x_speed = try_move_x( x_speed , hitbox_width , hitbox_height );
x += x_speed;


y_speed = clamp(y_speed + gravity_force , - max_y_speed , max_y_speed );
if(_jump && !failing ) { y_speed = - jump_height; }
y_speed = try_move_y( y_speed , hitbox_width , hitbox_height );
y += y_speed;

if(keyboard_check(vk_enter)){ x = 50; y = 150; }

