/// @description Insert description here
// You can write your code in this editor

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

var _current_zoom = _viewW/default_viewport_w

var _to_rm_from_queue = []

for (var i = 0; i < array_length(transition_queue); i += 1) {
	var _found_type = false
	for (var j = 0; j < array_length(running_transitions); j += 1) {
		if (running_transitions[j].type == transition_queue[i].type) {
			_found_type = true
		}
	}
	if not _found_type {
		switch(transition_queue[i].type) {
			case TransitionType.ZOOM:
				transition_queue[i].from = _current_zoom
				break
			case TransitionType.POSX:
				transition_queue[i].from = _viewX
				break
			case TransitionType.POSY:
				transition_queue[i].from = _viewY
				break
			case TransitionType.POS_LOCK:
				break
		}
		array_push(running_transitions, transition_queue[i])
		show_debug_message("unqueue " + string(transition_queue[i]))
		array_push(_to_rm_from_queue, i)
	}
}

for (var i = 0; i < array_length(_to_rm_from_queue); i += 1) {
	array_delete(transition_queue, _to_rm_from_queue[array_length(_to_rm_from_queue) - i - 1], 1)
}


var _to_rm_from_running = []

for (var i = 0; i < array_length(running_transitions); i += 1) {
	
	running_transitions[i].step(delta_time/1_000)
		
	switch(running_transitions[i].type) {
		case TransitionType.ZOOM:
			var _zoom = running_transitions[i].get()
			var _newW = default_viewport_w * _zoom
			var _newH = default_viewport_h * _zoom
			var _dtW = -(_newW - _viewW)/2
			var _dtH = -(_newH - _viewH)/2
			camera_set_view_size(view_camera[0], _newW, _newH)
			_viewX = _viewX + _dtW
			_viewY = _viewY + _dtH
			camera_set_view_pos(view_camera[0], _viewX, _viewY)
		break
		
		case TransitionType.POSX:
			var _newX = running_transitions[i].get()
			_viewX = _newX
			camera_set_view_pos(view_camera[0], _viewX, _viewY)
		break
		
		case TransitionType.POSY:
			var _newY = running_transitions[i].get()
			_viewY = _newY
			camera_set_view_pos(view_camera[0], _viewX, _viewY)
		break
		
		case TransitionType.POS_LOCK:
			move_target_locked = true
			//alarm_set(0, real(running_transitions[i].get() * game_get_speed(gamespeed_fps)))
		break
		
		default:
		break
	}

	if (running_transitions[i].is_over()) {
		show_debug_message("mark" + string(running_transitions[i]))
		if (running_transitions[i].type == TransitionType.POS_LOCK) {
			move_target_locked = false	
		}
		
		array_push(_to_rm_from_running, i)
	}
}

for (var i = 0; i < array_length(_to_rm_from_running); i += 1) {
	show_debug_message("delete" + string(running_transitions[_to_rm_from_running[array_length(_to_rm_from_running) - i - 1]]))
	array_delete(running_transitions, _to_rm_from_running[array_length(_to_rm_from_running) - i - 1], 1)
}


// clamp and offset camera
var _new_cam_target_x = move_target_px - _viewW/2
var _new_cam_target_y = move_target_py - _viewH/2

var _clamp_left = false
var _clamp_right = false
var _clamp_up = false
var _clamp_down = false

if (_new_cam_target_x < 0) {
	_clamp_right = true	
}
if (_new_cam_target_x > room_width - _viewW) {
	_clamp_left = true	
}
if (_new_cam_target_y < 0) {
	_clamp_up = true	
}
if (_new_cam_target_y > room_height - _viewH) {
	_clamp_down = true	
}

var _clamped_tx = clamp(move_target_px - _viewW/2, 0, room_width - _viewW)
var _clamped_ty = clamp(move_target_py - _viewH/2, 0, room_height - _viewH)

if (_clamp_left and _clamp_right) {
	_clamped_tx = move_target_px - _viewW/2
}

if (_clamp_up and _clamp_down) {
	_clamped_tx = move_target_py - _viewH/2
}



if not move_target_locked {
	camera_set_view_pos(view_camera[0],
		lerp(_viewX, _clamped_tx, 0.05),
		lerp(_viewY, _clamped_ty, 0.05))
}
