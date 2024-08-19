/// @description

function note_to_height(note) {
	switch (note.note) {
		case "C": return 4
		case "C#": return 3
		case "D": return 2
		case "E-": return 1
		case "E": return 0
	}	
}

function note_to_type(note) {
	switch(note.octave) {
		case 3: return NoteType.RELOAD
		case 4: return NoteType.ENEMY
		case 5: return NoteType.PLAYER
	}
}


function play_note(note) {
	show_debug_message(note)
	var _h = note_to_height(note)
	var _new_note = instance_create_layer(x + sprite_width, y + note_percs[_h] * sprite_height - 16, "notes_and_player", oNote, {
		note_type: note_to_type(note),
		note_speed_px_per_sec: NOTE_SPEED_PX_PER_SEC,
		note_index: _h
	})
	
	ds_queue_enqueue(note_indexes[_h], _new_note)
		
}

if not fight_has_started {
	return
} else if start_time == 0 {
	start_time = get_timer()
	end_time = start_time + (
		max(audio_sound_length(enemy_music), audio_sound_length(hero_music))
		) * 1_000_000	
}

var _t = get_timer()
note_clicked_this_frame = false

if (not audio_started and _t >= start_time + note_sec_in_advance * 1_000_000) {
	audio_play_sound(enemy_music, 1, false)
	audio_play_sound(hero_music, 1, false)
	audio_started = true
}

if (_t > end_time and not enemy_obj.fight_over) {
	enemy_obj.fight_over = true
	var _enemy_won_fight =  player_confidence < -40
	enemy_obj.won_fight =_enemy_won_fight 
	if (_enemy_won_fight) {
		show_debug_message(instance_create_layer(gui_win_loose_x, gui_win_loose_y, "Przeciwnik", oIntroText, 
		{
			text_sprite: spr_you_lost
		}))
		show_debug_message("ENEMY WON")
	} else {
		instance_create_layer(gui_win_loose_x, gui_win_loose_y, "Przeciwnik", oIntroText, 
		{
			text_sprite: spr_you_win
		})
		show_debug_message("HERO WON")
	}
	oIntroText.start_anim = true
	alarm[1] = 120
}

for (var i = last_played_idx; i < array_length(notes); i += 1) {
	if (_t - start_time >= (notes[i].start_sec) * 1_000_000 * 60 / 200) {
		play_note(notes[i])
		last_played_idx = max(last_played_idx, i + 1)
	}
}


if note_index_pressed(0) {
	oFightingPlayer.goto_y = note_percs[0] * sprite_height
}
if note_index_pressed(1) {
	oFightingPlayer.goto_y = note_percs[1] * sprite_height
}
if note_index_pressed(2) {
	oFightingPlayer.goto_y = note_percs[2] * sprite_height
}
if note_index_pressed(3) {
	oFightingPlayer.goto_y = note_percs[3] * sprite_height
}
if note_index_pressed(4) {
	oFightingPlayer.goto_y = note_percs[4] * sprite_height
}


oWaga.angle_deg = (player_confidence/100) * 45
player_confidence = lerp(player_confidence, 0, 0.001)