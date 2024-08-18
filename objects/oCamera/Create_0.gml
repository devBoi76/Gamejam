/// @description Insert description here
// You can write your code in this editor
default_viewport_w = view_wport[0];
default_viewport_h = view_hport[0];

view_camera[0] = camera_create_view(0, 0, default_viewport_w , default_viewport_h, 0, noone, -1, -1, -1, -1)


//target = empty_cam_info()
//target.px = cam.px
//target.py = cam.py
move_target_px = 0
move_target_py = 0
move_target_locked = false

N_TRANSITION_STEPS = 60

/// @arg {[Transition]}: running_transitions
running_transitions = []
transition_queue = []
