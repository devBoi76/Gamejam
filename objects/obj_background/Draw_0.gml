/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var x_scale = oCamera.current_zoom * oCamera._default_zoom * view_wport[0] / sprite_get_width(background_sprite)
var y_scale = oCamera.current_zoom * oCamera._default_zoom * view_hport[0] / sprite_get_height(background_sprite)

draw_sprite_ext(background_sprite, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), x_scale, y_scale, 0, c_white, 1)

//draw_sprite_ext( sprite_index , image_index , camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1);
	//draw_sprite_ext( sprite_index , image_index , camera_get_view_x(view_camera[0]) + view_wport[0] * (i + 1 ), camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1