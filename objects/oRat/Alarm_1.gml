/// @description Reset attack animation to idle

_next_idle_time = get_timer() + _still_seconds_per_frame * 1_000_000
_doing_attack = false