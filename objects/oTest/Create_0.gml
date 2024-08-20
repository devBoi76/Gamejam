/// @description

_still_step = 0
_still_frames = [0, 1]
_still_seconds_per_frame = 0.5
_next_idle_time = get_timer() + _still_seconds_per_frame * 1_000_000

do_attack = false
_doing_attack = false

_attack_step = -1
_attack_frames = [2, 3]

defeat_frame = 4

fight_over = false
won_fight = false

pulse = false