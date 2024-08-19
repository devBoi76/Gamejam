/// @description

if start_anim {
	start_time = get_timer()
	appear_end_time = start_time + duration * 1_000_000
	unfade_end_time = appear_end_time + (fade_duration + hold_duration) * 1_000_000
	_anim_started = true
	start_anim = false
}

if not _anim_started  {
	return
}

if not appear_finished {
	var _appear_progress = (get_timer() - start_time) / (appear_end_time - start_time)
	show_debug_message("appear: " + string(_appear_progress))
	if (_appear_progress >= 0.999) {
		appear_finished = true
	} else {
		y = lerp(y_target + y_offset, y_target, bezier(0, 0, 0.58, 1, _appear_progress))
		image_alpha = lerp(0, 1, bezier(0, 0, 0.58, 1, _appear_progress))
		x = lerp((x_start + w_start)*0.8 / 2, x_start - w_start/2, bezier(0, 0, 0.58, 1, _appear_progress))
		image_xscale = lerp(0.5, 1, bezier(0, 0, 0.58, 1, _appear_progress))
		image_yscale = lerp(0.8, 1, bezier(0, 0, 0.58, 1, _appear_progress))
	}
} else if not unfade_finished {
	if (get_timer() - appear_end_time < hold_duration * 1_000_000) {
		y = lerp(y, y_target - hold_up_shift, 0.01)
	}
	var _unfade_progress = (get_timer() - appear_end_time) / (unfade_end_time - appear_end_time)
	show_debug_message("unfade: " + string(_unfade_progress))
	image_alpha = lerp(1, 0, bezier(0, 1, 0, 1, _unfade_progress))
	if (_unfade_progress >= 0.999) {
		unfade_finished = true
		instance_destroy(id)
	}
}