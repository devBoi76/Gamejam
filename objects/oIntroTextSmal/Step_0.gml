/// @description

if (start_anim) {
	start_time = get_timer()
	slide_in_end_time = start_time + slide_in_duration
	hold_end_time = slide_in_end_time + hold_duration
	unfade_end_time = hold_end_time + unfade_duration
	start_anim = false
	_anim_started = true
}

if not _anim_started {
	return
}

switch (phase) {
	case Phase.SLIDE_IN:
		var _progress = (get_timer() - start_time) / (slide_in_duration)
		show_debug_message("smal_text slide_in: " + string(_progress))
		x = lerp(goal_x + x_offset, goal_x, bezier(0, 0.55, 0.45, 1, _progress))
		image_alpha = lerp(0, 1, bezier(0, 0.55, 0.45, 1, _progress))
		if (_progress >= 0.99) {
			phase = Phase.HOLD
		}
	break
	case Phase.HOLD:
		var _progress = (get_timer() - slide_in_end_time) / (hold_duration)
		show_debug_message("smal_text hold: " + string(_progress))
		if (_progress >= 0.99) {
			phase = Phase.UNFADE
		}
	break
	case Phase.UNFADE:
		var _progress = (get_timer() - hold_end_time) / (unfade_duration)
		show_debug_message("smal_text unfade: " + string(_progress))
		image_alpha = lerp(1, 0, bezier(0, 0.55, 0.45, 1, _progress))
		if (_progress >= 0.99) {
			phase = Phase.OVER
		}
	break;
	case Phase.OVER: instance_destroy(id)
}