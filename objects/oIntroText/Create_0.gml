/// @description

sprite_index = text_sprite

appear_finished = false
unfade_finished = false
y_offset = 200
y_target = y
x_start = x
w_start = sprite_width

duration = 2
hold_duration = 5
hold_up_shift = 50
fade_duration = 2

image_alpha = 0

y -= y_offset

start_anim = false
_anim_started  = false

start_time = 0// get_timer() + init_delay * 1_000_000
appear_end_time = 0// start_time + duration * 1_000_000
unfade_end_time = 0// appear_end_time + fade_duration * 1_000_000