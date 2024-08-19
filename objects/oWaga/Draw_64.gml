/// @description

// rotate p2 around p1
function rotate_around_point(p1x, p1y, p2x, p2y, rad) {
	p2x -= p1x
	p2y -= p1y
	
	var xnew = p2x * cos(rad) - p2y * sin(rad)
	var ynew = p2x * sin(rad) + p2y * cos(rad)
	
	p2x = xnew + p1x
	p2y = ynew + p1y
	
	return [p2x, p2y]
}

var SCALE = 0.25


var a = angle_deg
//var a = sin((get_timer() / 1000000) % (2 * pi)) * 30

var _center_width = sprite_get_width(waga_center) * SCALE
var _center_x = x - _center_width/2 + 314 * SCALE
var _center_y = y + 50 * SCALE

var new_corner = rotate_around_point(
_center_x, _center_y,
x - _center_width/2, y, -degtorad(a))
	
//draw_set_color(c_red)
//draw_circle(_center_x, _center_y, 30, true)

//draw_set_color(c_green)
//draw_circle(new_corner[0], new_corner[1], 20, false)

draw_sprite_ext(waga_center2, 0,
	new_corner[0], new_corner[1],
	SCALE, SCALE, a, c_white, 1)

draw_sprite_ext(waga_center, 0, x + 160 * SCALE, y - 60 * SCALE, SCALE, SCALE, 0, c_white, 1)

var _trans_x = 76 * SCALE
var _trans_y = 14 * SCALE

new_corner = rotate_around_point(
_center_x, _center_y,
x - (314 - 85 - sprite_get_width(waga_lewy)) * SCALE + _trans_x,
y + (85 - 14) * SCALE + _trans_y, -degtorad(a))

//draw_set_color(c_yellow)
//draw_circle(new_corner[0], new_corner[1], 20, false)

draw_sprite_ext(
	waga_lewy, 0, new_corner[0] - _trans_x, new_corner[1] - _trans_y - 30 * SCALE,
	SCALE, SCALE, 0, c_white, 1)
	
_trans_x = 81 * SCALE
_trans_y = 14 * SCALE

new_corner = rotate_around_point(
_center_x, _center_y,
x + (395) * SCALE + _trans_x,
y + (85 - 14) * SCALE + _trans_y, -degtorad(a))

//draw_set_color(c_yellow)
//draw_circle(new_corner[0], new_corner[1], 20, false)

draw_sprite_ext(
	waga_prawy, 0, new_corner[0] - _trans_x, new_corner[1] - _trans_y - 30 * SCALE,
	SCALE, SCALE, 0, c_white, 1)

