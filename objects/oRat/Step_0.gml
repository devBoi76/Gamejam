/// @description


var _t = get_timer()

if (fight_over) {
	if not won_fight {
		oFish.fight_over = fight_over
		oFish.won_fight = won_fight
		oLizard.fight_over = fight_over
		oLizard.won_fight = won_fight
		image_index = defeat_frame
		global.save.enemies[enemy_index] = 1
		global.save.enemies_highscores[enemy_index] =
		max(oNoteSpawner.player_confidence, global.save.enemies_highscores[enemy_index])
	}
	alarm[1] = -1
	return
}

if (do_attack) {
	oFish.do_attack = true
	oLizard.do_attack = true
	show_debug_message("enemy do attack")
	alarm[1] = 30
	_attack_step = (_attack_step + 1) % (array_length(_attack_frames))
	image_index = _attack_frames[_attack_step]
	do_attack = false
	
	_doing_attack = true
}

if not _doing_attack {
	if _t >= _next_idle_time {
		_still_step = (_still_step + 1) % (array_length(_still_frames))
		image_index = _still_frames[_still_step]
		_next_idle_time = _t + _still_seconds_per_frame * 1_000_000
		show_debug_message("next_idle_frame")
	}
}
