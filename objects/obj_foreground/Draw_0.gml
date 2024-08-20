
var y_scale = oCamera.current_zoom * oCamera._default_zoom * view_hport[0] / sprite_get_height(foreground_sprite)

var x_size = sprite_get_width(foreground_sprite)* y_scale
show_debug_message("x_size: " + string(x_size))
var n_repeats = ceil(view_wport[0] * y_scale / x_size) + 1

_x_off = -(obj_player_test.x * scrolling_speed) % x_size

show_debug_message("repeats" + string(n_repeats))
for (var i = 0; i < n_repeats; i += 1) {
	draw_sprite_stretched(foreground_sprite, 0,
		camera_get_view_x(view_camera[0]) + _x_off + x_size * i, camera_get_view_y(view_camera[0]),
		x_size, sprite_get_height(foreground_sprite) * y_scale)
	//draw_sprite_ext(foreground_sprite, 0,
	//camera_get_view_x(view_camera[0]) + _x_off + x_size * i, camera_get_view_y(view_camera[0]),
	//y_scale,
	//y_scale,
	//0, c_white, 1)		
}


