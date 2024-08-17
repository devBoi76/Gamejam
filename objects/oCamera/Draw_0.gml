/// @description

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);



draw_set_color(c_green)
draw_circle(_viewX + _viewW/2, _viewY + _viewH/2, 10, false)

draw_set_color(c_red)
draw_circle(move_target_px, move_target_py, 5, false)