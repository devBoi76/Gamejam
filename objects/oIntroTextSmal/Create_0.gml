/// @description


start_anim = false
_anim_started = false

slide_in_duration = 1 * 1_000_000
hold_duration = 5 * 1_000_000
unfade_duration = 3 * 1_000_000

goal_x = x
x_offset = -500
x += x_offset

start_time = 0
slide_in_end_time = 0
hold_end_time = 0
unfade_end_time = 0

phase = Phase.SLIDE_IN

sprite_index = text_sprite
image_alpha = 0

enum Phase {
	SLIDE_IN,
	HOLD,
	UNFADE,
	OVER,
}