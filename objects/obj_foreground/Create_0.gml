/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
i = 0;

function fill_screen(i)
{
	var _offset = - camera_get_view_x(view_camera[0])* frac( abs(camera_get_view_x(view_camera[0])) / view_wport[0] );
	draw_sprite_ext( sprite_index , image_index , _offset + view_wport[0] * i, camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1);
	draw_sprite_ext( sprite_index , image_index , _offset + view_wport[0] + view_wport[0] * i , camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1);
	draw_sprite_ext( sprite_index , image_index , _offset + view_wport[0] * 2+ view_wport[0] * i , camera_get_view_y(view_camera[0]) , view_wport[0] / sprite_get_width(sprite_index) , view_hport[0] / sprite_get_height(sprite_index) , 0, c_white, 1);
}