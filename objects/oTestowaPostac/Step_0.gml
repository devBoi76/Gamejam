/// @description Insert description here
// You can write your code in this editor

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var _gotoX = x + sprite_width/2 + (_hor * 200)
var _gotoY = y + sprite_height/2 + (_ver * 200)

oCamera.move_target_px = _gotoX
oCamera.move_target_py = _gotoY
