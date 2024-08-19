/// @description Insert description here
// You can write your code in this editor

x -= delta_time * note_speed_px_per_sec / 1_000_000

var is_first = ds_queue_head(oNoteSpawner.note_indexes[note_index]) == id

var _pp = oNoteSpawner.player_pos

switch (note_type) {
	case NoteType.PLAYER:	
		if not oNoteSpawner.note_clicked_this_frame and is_first and not did_thing and note_index_pressed(note_index) {
			if (abs(_pp - x) <= FORGIVING_DST_PX / 2) {
				show_debug_message("WAVE!!!")
				audio_play_sound(snd_get, 2, false)
				did_thing = true
				oNoteSpawner.player_confidence += POINTS_PL_HIT
				
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
			} else if (abs(_pp - x) <= FORGIVING_DST_PX) {
				show_debug_message("slight_miss")
				audio_play_sound(snd_near, 2, false)
				oNoteSpawner.player_confidence += POINTS_PL_NEAR
				
				did_thing = true
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
			} else if (abs(_pp - x) <= FORGIVING_DST_PX * 2) {
				show_debug_message("miss")
				audio_play_sound(snd_miss, 2, false)
				oNoteSpawner.player_confidence += POINTS_PL_MISS
				
				did_thing = true
				oNoteSpawner.last_player_note_missed = true
				oNoteSpawner.note_clicked_this_frame = true
			} else {}

		}
	break
	case NoteType.ENEMY:
		if (is_first and place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message("HIT!")
			audio_play_sound(mixkit_short_slap_or_clap_2167, 2, false)
			did_thing = true
			oNoteSpawner.player_confidence += POINTS_EN_HIT
			
			oFightingPlayer.sprite_index = spr_postac_walka_obrazenia
			oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
			oFightingPlayer.changed_sprite = true
		}
		if (place_meeting(x, y, oAttackCollider) and not _did_attack_collision) {
			show_debug_message("oAttackCollider")
			oNoteSpawner.enemy_obj.do_attack = true
			_did_attack_collision = true
		}
	break
	case NoteType.RELOAD:
		if (place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message("RELOAD!")
			did_thing = true
			
			oFightingPlayer.sprite_index = spr_postac_walka_start
			oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
		}
	break
}

if (place_meeting(x, y, oNoteDestroyer) or did_thing or (x < oNoteSpawner.player_pos_perc * oNoteSpawner.sprite_width - FORGIVING_DST_PX * 2))
	and is_first {
	ds_queue_dequeue(oNoteSpawner.note_indexes[note_index])
	
	instance_destroy(id)
}