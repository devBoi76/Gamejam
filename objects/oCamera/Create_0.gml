/// @description Insert description here
// You can write your code in this editor

view_camera[0] = camera_create_view(0, 0, 600, 600, 0, noone, -1, -1, -1, -1)

default_viewport_w = 600;
default_viewport_h = 600;

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
