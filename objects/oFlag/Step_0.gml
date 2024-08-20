 /// @description Insert description here
// You can write your code in this editor

var _collides = place_meeting(x, y, obj_player_test)

show_debug_message("FLAG COLLIDES!!" + string(_collides))	


var _t = get_timer()

if (_collides and locked == false) {
	locked = true
	trigger_time = _t + trigger_delay * 1_000_000

} else if (not _collides and locked = true) {	
	locked = false
}

if (_t >= trigger_time) {
	trigger_time = infinity
	
	var _cam = layer_instance_get_instance(oCamera)
	
	var _camW = camera_get_view_width(view_camera[0])
	var _camH = camera_get_view_height(view_camera[0])
	
	
	var _camX = camera_get_view_x(view_camera[0])// - (_camW / cam_set_zoom)
	var _camY = camera_get_view_y(view_camera[0])// - (_camH / cam_set_zoom)

	if not is_nan(cam_zoom) {
		array_push(oCamera.transition_queue, new Transition(
		(_camW / oCamera.default_viewport_w),
		cam_zoom,
		duration,
		TransitionType.ZOOM,
		function_type))
		show_debug_message("add cam_zoom (0)")
	}
	
	if not is_nan(cam_lock_px) {
		array_push(oCamera.transition_queue, new Transition(
		(_camX),
		cam_lock_px  - (_camW / 2),
		duration,
		TransitionType.POSX,
		function_type))
		show_debug_message("add cam_lock_px (1)")
	}
	
	if not is_nan(cam_lock_py) {
		array_push(oCamera.transition_queue, new Transition(
		(_camY),
		cam_lock_py  - (_camH / 2),
		duration,
		TransitionType.POSY,
		function_type))
		show_debug_message("add cam_lock_py (2)")
	}
	
	if not is_nan(cam_lock_duration) {
		array_push(oCamera.transition_queue, new Transition(
		0,
		1,
		cam_lock_duration,
		TransitionType.POS_LOCK,
		function_type))
		show_debug_message("add cam_lock_duration (3)")
	}

}