/// @description

draw_sprite_ext(sprite_index, 0, x, y,
	image_xscale, image_yscale, image_angle, c_white, image_alpha)

if (impact_frame_visible) {
	if (_impact_unfade) {
		_impact_alpha = lerp(_impact_alpha, 0, 0.35)
	}
	draw_sprite_ext(_impact_sprite, 0, x, y,
		image_xscale * _impact_scale, image_yscale * _impact_scale, _impact_rotation, c_white, _impact_alpha)
}

//draw_set_color(c_lime)
//draw_circle(x, y, 10, false)
//draw_self()

//var first = ds_queue_head(oNoteSpawner.note_indexes[note_index]) == id
//
//var is_first_enabled = true
//
//var _tmp_queue = ds_queue_create()
//
//while (ds_queue_size(oNoteSpawner.note_indexes[note_index]) > 0) {
	//var _head = ds_queue_dequeue(oNoteSpawner.note_indexes[note_index])
	//if not _head._disable_player_action and _head != id {
		//is_first_enabled = false
	//}
//}

//while (ds_queue_size(_tmp_queue)) {
	//var _head = ds_queue_dequeue(_tmp_queue)
	//ds_queue_enqueue(oNoteSpawner.note_indexes[note_index], _head)
//}

//ds_queue_destroy(_tmp_queue)

//if first {
	//draw_set_color(c_green)
	//draw_circle(x, y, 20, false)
//}

//if is_first_enabled {
	//draw_set_color(c_navy)
	//draw_circle(x, y, 10, false)
//}