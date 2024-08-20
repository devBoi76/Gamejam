/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


draw_sprite_ext(background_sprite, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1 * oCamera.current_zoom * oCamera._default_zoom, 1 * oCamera.current_zoom * oCamera._default_zoom, 0, c_white, 1)

//draw_sprite_ext( sprite_index , image_index , camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1);
	//draw_sprite_ext( sprite_index , image_index , camera_get_view_x(view_camera[0]) + view_wport[0] * (i + 1 ), camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1